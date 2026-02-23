// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appVersionHash() => r'e8bdf0eb01e50b65eb7931eadc45c32b561fce64';

/// 앱 버전 Provider
///
/// Copied from [appVersion].
@ProviderFor(appVersion)
final appVersionProvider = AutoDisposeFutureProvider<String>.internal(
  appVersion,
  name: r'appVersionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appVersionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppVersionRef = AutoDisposeFutureProviderRef<String>;
String _$notificationSettingHash() =>
    r'c987104be8b6cdf96ccc09887d6fcf0912f1e4a7';

/// 알림 설정 Provider
///
/// Copied from [NotificationSetting].
@ProviderFor(NotificationSetting)
final notificationSettingProvider =
    AutoDisposeAsyncNotifierProvider<NotificationSetting, bool>.internal(
      NotificationSetting.new,
      name: r'notificationSettingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$notificationSettingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NotificationSetting = AutoDisposeAsyncNotifier<bool>;
String _$nicknameEditorHash() => r'4107eba534e257b9f2c6d00b81e5ae054173d627';

/// 닉네임 수정 Provider
///
/// Copied from [NicknameEditor].
@ProviderFor(NicknameEditor)
final nicknameEditorProvider =
    AutoDisposeNotifierProvider<NicknameEditor, NicknameEditState>.internal(
      NicknameEditor.new,
      name: r'nicknameEditorProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$nicknameEditorHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NicknameEditor = AutoDisposeNotifier<NicknameEditState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
