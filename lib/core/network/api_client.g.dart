// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'54eb6570fb1e5e68ec85fd495e0c9a17fc4b26e8';

/// Dio 인스턴스 Provider
///
/// 앱 전체에서 사용하는 HTTP 클라이언트입니다.
/// 인증, 토큰 갱신, 에러 변환 인터셉터가 자동으로 적용됩니다.
///
/// **인터셉터 체인**:
/// 1. LogInterceptor (debug only) - 요청/응답 로깅
/// 2. AuthInterceptor (통합) - 토큰 주입 + 401 갱신 + 강제 로그아웃
/// 3. ErrorInterceptor - DioException → AppException 변환
///
/// keepAlive: 인터셉터 내부 상태(_isRefreshing, _pendingRequests)를
/// 유지하기 위해 AutoDispose를 사용하지 않습니다.
///
/// Copied from [dio].
@ProviderFor(dio)
final dioProvider = Provider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = ProviderRef<Dio>;
String _$refreshDioHash() => r'e30a74a4052304c887b5f57eae3142339ff5cf70';

/// 토큰 갱신 전용 Dio 인스턴스
///
/// AuthInterceptor에서 토큰 갱신 요청에 사용하는 별도의 Dio 인스턴스입니다.
/// 인터셉터 순환을 방지하기 위해 최소한의 설정만 적용합니다.
///
/// Copied from [refreshDio].
@ProviderFor(refreshDio)
final refreshDioProvider = Provider<Dio>.internal(
  refreshDio,
  name: r'refreshDioProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$refreshDioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RefreshDioRef = ProviderRef<Dio>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
