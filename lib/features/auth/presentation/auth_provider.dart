import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/exceptions/app_exception.dart';
import '../../../common/services/token_storage.dart';
import '../../../common/services/device_info_service.dart';
import '../../../common/services/firebase_messaging_service.dart';
import '../data/firebase_auth_datasource.dart';
import '../data/models/sign_in_response.dart';
import '../data/auth_repository_impl.dart';
import '../data/firebase_auth_error_handler.dart';

part 'auth_provider.g.dart';

/// FirebaseAuthDataSource Provider
@riverpod
FirebaseAuthDataSource firebaseAuthDataSource(Ref ref) {
  return FirebaseAuthDataSource();
}

/// Firebase Auth State를 실시간으로 제공하는 StreamProvider
///
/// GoRouter의 refreshListenable로 사용되어
/// 인증 상태 변경 시 자동으로 라우팅을 재평가합니다.
@riverpod
Stream<User?> authState(Ref ref) {
  final dataSource = ref.watch(firebaseAuthDataSourceProvider);
  return dataSource.authStateChanges();
}

/// 인증 상태를 관리하는 Notifier
///
/// Google/Apple 로그인, 로그아웃 등의 인증 작업을 수행하며
/// Firebase 인증 후 백엔드 로그인까지 완료합니다.
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<User?> build() {
    final dataSource = ref.watch(firebaseAuthDataSourceProvider);
    return dataSource.currentUser;
  }

  /// Google 로그인 수행
  ///
  /// 1. Firebase Google 로그인
  /// 2. Firebase ID Token 획득
  /// 3. FCM 토큰 + 기기 정보 수집
  /// 4. 백엔드 로그인 API 호출
  /// 5. JWT 토큰 저장
  /// 6. 온보딩 상태 저장
  Future<SignInResponse?> signInWithGoogle() async {
    state = const AsyncValue.loading();

    try {
      final dataSource = ref.read(firebaseAuthDataSourceProvider);

      // 1. Firebase Google 로그인
      final userCredential = await dataSource.signInWithGoogle();
      debugPrint('✅ Firebase Google login success');

      // 2. Firebase ID Token 획득
      final idToken = await dataSource.getIdToken();
      debugPrint('✅ Firebase ID Token obtained');

      // 3. 백엔드 로그인 완료
      final signInResponse = await _completeBackendLogin(idToken, 'google');

      state = AsyncValue.data(userCredential.user);
      return signInResponse;
    } on FirebaseAuthException catch (e) {
      await _cleanupSessionOnFailure('google');
      state = AsyncValue.error(
        FirebaseAuthErrorHandler.createAuthException(e, provider: 'Google'),
        StackTrace.current,
      );
      return null;
    } catch (e, stack) {
      debugPrint('❌ Google 로그인 에러: $e');
      debugPrint('❌ Stack trace: $stack');
      await _cleanupSessionOnFailure('google');
      state = AsyncValue.error(
        AuthException(
          message: _extractErrorMessage(e),
          originalException: e,
        ),
        stack,
      );
      return null;
    }
  }

  /// Apple 로그인 수행
  Future<SignInResponse?> signInWithApple() async {
    state = const AsyncValue.loading();

    try {
      final dataSource = ref.read(firebaseAuthDataSourceProvider);

      // 1. Firebase Apple 로그인
      final userCredential = await dataSource.signInWithApple();
      debugPrint('✅ Firebase Apple login success');

      // 2. Firebase ID Token 획득
      final idToken = await dataSource.getIdToken();
      debugPrint('✅ Firebase ID Token obtained');

      // 3. 백엔드 로그인 완료
      final signInResponse = await _completeBackendLogin(idToken, 'apple');

      state = AsyncValue.data(userCredential.user);
      return signInResponse;
    } on FirebaseAuthException catch (e) {
      await _cleanupSessionOnFailure('apple');
      state = AsyncValue.error(
        FirebaseAuthErrorHandler.createAuthException(e, provider: 'Apple'),
        StackTrace.current,
      );
      return null;
    } catch (e, stack) {
      debugPrint('❌ Apple 로그인 에러: $e');
      debugPrint('❌ Stack trace: $stack');
      await _cleanupSessionOnFailure('apple');
      state = AsyncValue.error(
        AuthException(
          message: _extractErrorMessage(e),
          originalException: e,
        ),
        stack,
      );
      return null;
    }
  }

  /// 백엔드 로그인 완료 (공통 로직)
  Future<SignInResponse> _completeBackendLogin(
    String idToken,
    String provider,
  ) async {
    // FCM 토큰 획득
    String? fcmToken;
    try {
      final fcmService = ref.read(firebaseMessagingServiceProvider);
      fcmToken = await fcmService.getFcmToken();
      debugPrint('✅ FCM Token obtained');
    } catch (e) {
      debugPrint('⚠️ FCM Token retrieval failed (continuing): $e');
    }

    // 기기 정보 수집
    String? deviceType;
    String? deviceId;
    try {
      final deviceInfoService = ref.read(deviceInfoServiceProvider);
      final deviceInfo = await deviceInfoService.getDeviceInfo();
      deviceType = deviceInfo.deviceType;
      deviceId = deviceInfo.deviceId;
      debugPrint('✅ Device info obtained: $deviceType, $deviceId');
    } catch (e) {
      debugPrint('⚠️ Device info retrieval failed (continuing): $e');
    }

    // 백엔드 로그인 API 호출
    final authRepository = ref.read(authRepositoryProvider);
    final signInResponse = await authRepository.signIn(
      firebaseIdToken: idToken,
      fcmToken: fcmToken,
      deviceType: deviceType,
      deviceId: deviceId,
    );
    debugPrint('✅ Backend login success');
    debugPrint('   requiresOnboarding: ${signInResponse.requiresOnboarding}');
    debugPrint('   onboardingStep: ${signInResponse.onboardingStep}');

    return signInResponse;
  }

  /// 로그아웃
  ///
  /// 1. Firebase 유저 정보 + 기기 정보 수집
  /// 2. 백엔드 로그아웃 API 호출 (AuthRequest body 포함)
  /// 3. Firebase 로그아웃
  Future<void> signOut() async {
    state = const AsyncValue.loading();

    try {
      // 1. Firebase 로그아웃 전에 유저 정보 수집
      final dataSource = ref.read(firebaseAuthDataSourceProvider);
      final currentUser = dataSource.currentUser;

      // 2. FCM 토큰 + 기기 정보 수집
      String? fcmToken;
      String? deviceType;
      String? deviceId;
      try {
        final fcmService = ref.read(firebaseMessagingServiceProvider);
        fcmToken = await fcmService.getFcmToken();
      } catch (_) {}
      try {
        final deviceInfoService = ref.read(deviceInfoServiceProvider);
        final deviceInfo = await deviceInfoService.getDeviceInfo();
        deviceType = deviceInfo.deviceType;
        deviceId = deviceInfo.deviceId;
      } catch (_) {}

      // 3. 백엔드 로그아웃 API 호출 (Firebase 로그아웃 전에 수행)
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.logout(
        socialPlatform: 'GOOGLE',
        email: currentUser?.email,
        name: currentUser?.displayName,
        fcmToken: fcmToken,
        deviceType: deviceType,
        deviceId: deviceId,
      );

      // 4. Firebase 로그아웃
      await dataSource.signOut();

      state = const AsyncValue.data(null);
      debugPrint('✅ Sign out success');
    } catch (e, stack) {
      // 에러가 발생해도 로컬 토큰은 삭제하고 Firebase 로그아웃
      try {
        final dataSource = ref.read(firebaseAuthDataSourceProvider);
        await dataSource.signOut();
        final tokenStorage = ref.read(tokenStorageProvider);
        await tokenStorage.clearTokens();
      } catch (_) {}

      state = AsyncValue.error(
        AuthException(
          message: _extractErrorMessage(e),
          originalException: e,
        ),
        stack,
      );
    }
  }

  /// 회원 탈퇴
  Future<void> withdraw() async {
    state = const AsyncValue.loading();

    try {
      // 백엔드 회원 탈퇴
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.withdraw();

      // Firebase 로그아웃
      final dataSource = ref.read(firebaseAuthDataSourceProvider);
      await dataSource.signOut();

      state = const AsyncValue.data(null);
      debugPrint('✅ Withdraw success');
    } catch (e, stack) {
      state = AsyncValue.error(
        AuthException(
          message: _extractErrorMessage(e),
          originalException: e,
        ),
        stack,
      );
    }
  }

  /// 저장된 토큰으로 자동 로그인 시도
  Future<bool> tryAutoLogin() async {
    try {
      final authRepository = ref.read(authRepositoryProvider);
      final hasTokens = await authRepository.hasValidTokens();

      if (hasTokens) {
        debugPrint('✅ Valid tokens found, auto-login enabled');
        return true;
      }

      debugPrint('⚠️ No valid tokens found');
      return false;
    } catch (e) {
      debugPrint('❌ Auto-login check failed: $e');
      return false;
    }
  }

  /// 온보딩 필요 여부 확인
  Future<bool> checkRequiresOnboarding() async {
    try {
      final authRepository = ref.read(authRepositoryProvider);
      return await authRepository.requiresOnboarding();
    } catch (e) {
      debugPrint('❌ Onboarding check failed: $e');
      return false;
    }
  }

  /// 현재 온보딩 단계 조회
  Future<OnboardingStep?> getCurrentOnboardingStep() async {
    try {
      final authRepository = ref.read(authRepositoryProvider);
      return await authRepository.getCurrentOnboardingStep();
    } catch (e) {
      debugPrint('❌ Get onboarding step failed: $e');
      return null;
    }
  }

  /// 에러에서 백엔드 메시지를 추출
  ///
  /// ErrorInterceptor가 변환한 AppException → DioException의 response에서
  /// 백엔드가 보낸 원본 메시지를 그대로 추출합니다.
  String _extractErrorMessage(dynamic error) {
    // ErrorInterceptor가 변환한 AppException
    if (error is DioException && error.error is AppException) {
      return (error.error as AppException).message;
    }
    // AppException 직접 전달된 경우
    if (error is AppException) {
      return error.message;
    }
    // DioException response에서 직접 추출
    if (error is DioException && error.response?.data is Map<String, dynamic>) {
      final data = error.response!.data as Map<String, dynamic>;
      final message = data['message'] as String?;
      if (message != null) return message;
    }
    return error.toString();
  }

  /// 로그인 실패 시 세션 정리
  Future<void> _cleanupSessionOnFailure(String provider) async {
    try {
      final dataSource = ref.read(firebaseAuthDataSourceProvider);
      await dataSource.signOut();

      final tokenStorage = ref.read(tokenStorageProvider);
      await tokenStorage.clearTokens();

      debugPrint('🔄 로그인 실패 - 세션 정리 완료 ($provider)');
    } catch (signOutError) {
      debugPrint('⚠️ 로그아웃 중 에러 (무시): $signOutError');
    }
  }
}
