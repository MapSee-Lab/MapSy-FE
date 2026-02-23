// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appVersionHash() =>
    r'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0';

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
    r'b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1';

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
String _$nicknameEditorHash() =>
    r'c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2';

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
