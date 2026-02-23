import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data/mypage_repository_impl.dart';
import '../data/mypage_repository.dart';

part 'mypage_provider.g.dart';

/// 알림 설정 키
const _notificationEnabledKey = 'notification_enabled';

/// 앱 버전 Provider
@riverpod
Future<String> appVersion(Ref ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

/// 알림 설정 Provider
@riverpod
class NotificationSetting extends _$NotificationSetting {
  @override
  FutureOr<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_notificationEnabledKey) ?? true;
  }

  Future<void> toggle() async {
    final current = state.valueOrNull ?? true;
    final newValue = !current;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationEnabledKey, newValue);

    state = AsyncValue.data(newValue);
  }
}

/// 닉네임 수정 Provider
@riverpod
class NicknameEditor extends _$NicknameEditor {
  static const int _minLength = 2;
  static const int _maxLength = 20;
  static final RegExp _nicknameRegex = RegExp(r'^[가-힣a-zA-Z0-9]+$');

  @override
  NicknameEditState build() {
    return const NicknameEditState();
  }

  MypageRepository get _repository => ref.read(mypageRepositoryProvider);

  /// 닉네임 유효성 검증
  String? validate(String nickname) {
    if (nickname.isEmpty) return '닉네임을 입력해주세요.';
    if (nickname.length < _minLength) return '닉네임은 ${_minLength}자 이상이어야 합니다.';
    if (nickname.length > _maxLength) return '닉네임은 ${_maxLength}자 이하여야 합니다.';
    if (nickname.contains(' ')) return '닉네임에 공백을 사용할 수 없습니다.';
    if (!_nicknameRegex.hasMatch(nickname)) return '닉네임은 한글, 영문, 숫자만 사용할 수 있습니다.';
    return null;
  }

  /// 닉네임 변경 (중복확인 + 프로필 업데이트를 한 번에)
  Future<bool> updateNickname(String newNickname, String currentNickname) async {
    if (newNickname == currentNickname) return false;

    final error = validate(newNickname);
    if (error != null) {
      state = state.copyWith(errorMessage: error);
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final checkResult = await _repository.checkName(newNickname);
      if (!checkResult.isAvailable) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: '이미 사용 중인 닉네임입니다.',
        );
        return false;
      }

      await _repository.updateNickname(newNickname);

      state = state.copyWith(isLoading: false);
      debugPrint('✅ Nickname updated: $newNickname');
      return true;
    } catch (e) {
      debugPrint('❌ Nickname update failed: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: '닉네임 변경에 실패했습니다. 다시 시도해주세요.',
      );
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  void reset() {
    state = const NicknameEditState();
  }
}

/// 닉네임 수정 상태
class NicknameEditState {
  final bool isLoading;
  final String? errorMessage;

  const NicknameEditState({
    this.isLoading = false,
    this.errorMessage,
  });

  NicknameEditState copyWith({
    bool? isLoading,
    Object? errorMessage = _sentinel,
  }) {
    return NicknameEditState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage == _sentinel
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

const _sentinel = Object();
