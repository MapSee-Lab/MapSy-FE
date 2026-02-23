import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/services/token_storage.dart';
import 'auth_repository.dart';
import 'auth_remote_datasource.dart';
import 'models/auth_request.dart';
import 'models/sign_in_request.dart';
import 'models/sign_in_response.dart';
import 'models/reissue_request.dart';

part 'auth_repository_impl.g.dart';

/// AuthRepository Provider
@riverpod
AuthRepository authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthRepositoryImpl(remoteDataSource, tokenStorage);
}

/// AuthRepository 구현체
///
/// 인증 관련 비즈니스 로직을 구현합니다.
/// Remote DataSource와 Token Storage를 조합하여
/// 완전한 인증 플로우를 제공합니다.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final TokenStorage _tokenStorage;

  AuthRepositoryImpl(this._remoteDataSource, this._tokenStorage);

  @override
  Future<SignInResponse> signIn({
    required String firebaseIdToken,
    String? fcmToken,
    String? deviceType,
    String? deviceId,
  }) async {
    debugPrint('🔐 AuthRepository: Starting sign-in flow...');

    // 1. 백엔드 로그인 API 호출
    final request = SignInRequest(
      firebaseIdToken: firebaseIdToken,
      fcmToken: fcmToken,
      deviceType: deviceType,
      deviceId: deviceId,
    );

    final response = await _remoteDataSource.signIn(request);

    // 2. 토큰 저장
    await _tokenStorage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
    debugPrint('✅ Tokens saved to secure storage');

    // 3. 온보딩 상태 저장
    await _tokenStorage.saveOnboardingState(
      requiresOnboarding: response.requiresOnboarding,
      onboardingStep: response.onboardingStep,
    );
    debugPrint(
      '✅ Onboarding state saved: requiresOnboarding=${response.requiresOnboarding}',
    );

    return response;
  }

  @override
  Future<void> refreshTokens() async {
    debugPrint('🔄 AuthRepository: Refreshing tokens...');

    final refreshToken = await _tokenStorage.getRefreshToken();
    if (refreshToken == null) {
      throw Exception('No refresh token available');
    }

    final request = ReissueRequest(refreshToken: refreshToken);
    final response = await _remoteDataSource.reissue(request);

    await _tokenStorage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
    debugPrint('✅ Tokens refreshed and saved');
  }

  @override
  Future<void> logout({
    String? socialPlatform,
    String? email,
    String? name,
    String? fcmToken,
    String? deviceType,
    String? deviceId,
  }) async {
    debugPrint('🚪 AuthRepository: Logging out...');

    try {
      final request = AuthRequest(
        socialPlatform: socialPlatform,
        email: email,
        name: name,
        fcmToken: fcmToken,
        deviceType: deviceType,
        deviceId: deviceId,
      );
      await _remoteDataSource.logout(request);
    } catch (e) {
      // 서버 로그아웃 실패해도 로컬 토큰은 삭제
      debugPrint('⚠️ Server logout failed, clearing local tokens anyway: $e');
    }

    // 로컬 토큰 삭제
    await _tokenStorage.clearTokens();
    debugPrint('✅ Local tokens cleared');
  }

  @override
  Future<void> withdraw() async {
    debugPrint('⚠️ AuthRepository: Withdrawing...');

    await _remoteDataSource.withdraw();
    await _tokenStorage.clearTokens();
    debugPrint('✅ Account withdrawn and tokens cleared');
  }

  @override
  Future<bool> hasValidTokens() async {
    return await _tokenStorage.hasTokens();
  }

  @override
  Future<bool> requiresOnboarding() async {
    return await _tokenStorage.getRequiresOnboarding();
  }

  @override
  Future<OnboardingStep?> getCurrentOnboardingStep() async {
    final stepString = await _tokenStorage.getOnboardingStep();
    return OnboardingStep.fromString(stepString);
  }
}
