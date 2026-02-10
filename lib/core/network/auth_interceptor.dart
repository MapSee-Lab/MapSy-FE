import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/api_endpoints.dart';
import 'token_storage.dart';

/// 통합 인증 인터셉터
///
/// 토큰 주입 + 401 갱신 + 강제 로그아웃을 하나의 인터셉터로 처리합니다.
///
/// **동작**:
/// 1. onRequest: 인증이 필요한 요청에 Access Token 자동 주입
/// 2. onError (401): Refresh Token으로 Access Token 갱신 후 원래 요청 재시도
/// 3. 갱신 실패 시: 토큰 삭제 + onForceLogout 콜백 호출 (Firebase 로그아웃 + 로그인 화면 이동)
///
/// **무한 루프 방지**: `extra['_isRetry']` 플래그로 재시도 요청의 401 재진입 차단
/// **동시 요청 처리**: 갱신 중 들어오는 401 요청은 대기열에 추가 후 일괄 처리
class AuthInterceptor extends Interceptor {
  final Ref _ref;
  final Dio _mainDio;
  final Dio _refreshDio;
  final Future<void> Function()? onForceLogout;

  /// 인증이 필요 없는 경로 목록
  static const List<String> _publicPaths = [
    ApiEndpoints.signIn,
    ApiEndpoints.reissue,
    ApiEndpoints.checkName,
  ];

  /// 토큰 갱신 중 여부 (중복 갱신 방지)
  bool _isRefreshing = false;

  /// 갱신 완료 대기 중인 요청들
  final List<_PendingRequest> _pendingRequests = [];

  AuthInterceptor(
    this._ref,
    this._mainDio,
    this._refreshDio, {
    this.onForceLogout,
  });

  // ============================================
  // onRequest: Access Token 자동 주입
  // ============================================

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 인증이 필요 없는 경로는 토큰 주입 생략
    if (_isPublicPath(options.path)) {
      debugPrint('🔓 Public path, skipping auth: ${options.path}');
      return handler.next(options);
    }

    try {
      final tokenStorage = _ref.read(tokenStorageProvider);
      final accessToken = await tokenStorage.getAccessToken();

      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
        debugPrint('🔐 Token injected for: ${options.path}');
      } else {
        debugPrint('⚠️ No access token available for: ${options.path}');
      }
    } catch (e) {
      debugPrint('❌ Error reading token: $e');
    }

    return handler.next(options);
  }

  // ============================================
  // onError: 401 감지 → 토큰 갱신 → 재시도
  // ============================================

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // 401이 아니면 그대로 전달
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // 이미 재시도한 요청이 다시 401이면 → 강제 로그아웃
    if (err.requestOptions.extra['_isRetry'] == true) {
      debugPrint('🔴 Retry request got 401 again, forcing logout...');
      await _handleForceLogout();
      return handler.next(err);
    }

    // 토큰 갱신 요청 자체가 실패한 경우 → 강제 로그아웃
    if (err.requestOptions.path == ApiEndpoints.reissue) {
      debugPrint('🔴 Refresh token expired, forcing logout...');
      await _handleForceLogout();
      return handler.next(err);
    }

    debugPrint('🔄 401 detected, attempting token refresh...');

    // 이미 갱신 중이면 대기열에 추가
    if (_isRefreshing) {
      debugPrint('⏳ Token refresh in progress, queuing request...');
      _pendingRequests.add(
        _PendingRequest(options: err.requestOptions, handler: handler),
      );
      return;
    }

    _isRefreshing = true;

    try {
      final success = await _refreshToken();

      if (!success) {
        debugPrint('🔴 Token refresh failed, forcing logout...');
        await _handleForceLogout();
        handler.next(err);
        _rejectPendingRequests(err);
        return;
      }

      debugPrint('✅ Token refreshed successfully');

      // 원래 요청 재시도 (별도 try로 분리 → 재시도 실패와 갱신 실패 구분)
      try {
        final response = await _retryRequest(err.requestOptions);
        handler.resolve(response);
        _retryPendingRequests();
      } catch (retryError) {
        debugPrint('❌ Retry request failed: $retryError');
        final retryException =
            retryError is DioException
                ? retryError
                : DioException(
                  requestOptions: err.requestOptions,
                  error: retryError,
                  message: retryError.toString(),
                );
        handler.next(retryException);
        _rejectPendingRequests(retryException);
      }
    } catch (e) {
      debugPrint('❌ Token refresh error: $e');
      await _handleForceLogout();
      handler.next(err);
      _rejectPendingRequests(err);
    } finally {
      _isRefreshing = false;
    }
  }

  // ============================================
  // Private Methods
  // ============================================

  /// 인증이 필요 없는 경로인지 확인
  bool _isPublicPath(String path) {
    return _publicPaths.any(
      (publicPath) => path == publicPath || path.startsWith('$publicPath?'),
    );
  }

  /// Refresh Token으로 새 Access Token 요청
  Future<bool> _refreshToken() async {
    try {
      final tokenStorage = _ref.read(tokenStorageProvider);
      final refreshToken = await tokenStorage.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        debugPrint('⚠️ No refresh token available');
        return false;
      }

      // 별도 Dio 인스턴스로 갱신 요청 (인터셉터 순환 방지)
      final response = await _refreshDio.post(
        ApiEndpoints.reissue,
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200 && response.data != null) {
        final newAccessToken = response.data['accessToken'] as String?;
        final newRefreshToken = response.data['refreshToken'] as String?;

        if (newAccessToken != null && newRefreshToken != null) {
          await tokenStorage.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
          );
          return true;
        }
      }

      return false;
    } catch (e) {
      debugPrint('❌ Refresh token request failed: $e');
      return false;
    }
  }

  /// 원래 요청 재시도 (_isRetry 플래그 추가)
  ///
  /// mainDio를 사용하여 LogInterceptor, ErrorInterceptor를 거치도록 합니다.
  /// _isRetry 플래그로 AuthInterceptor의 401 무한 루프를 방지합니다.
  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final tokenStorage = _ref.read(tokenStorageProvider);
    final newAccessToken = await tokenStorage.getAccessToken();

    // 새 토큰으로 헤더 업데이트
    requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
    // 재시도 플래그 설정 (무한 루프 방지)
    requestOptions.extra['_isRetry'] = true;

    return await _mainDio.fetch(requestOptions);
  }

  /// 대기 중인 요청들 재시도
  void _retryPendingRequests() {
    for (final pending in _pendingRequests) {
      _retryRequest(pending.options).then(
        (response) => pending.handler.resolve(response),
        onError: (error) {
          if (error is DioException) {
            pending.handler.reject(error);
          } else {
            pending.handler.reject(
              DioException(
                requestOptions: pending.options,
                error: error,
                message: error.toString(),
              ),
            );
          }
        },
      );
    }
    _pendingRequests.clear();
  }

  /// 대기 중인 요청들 거부
  void _rejectPendingRequests(DioException err) {
    for (final pending in _pendingRequests) {
      pending.handler.next(err);
    }
    _pendingRequests.clear();
  }

  /// 강제 로그아웃 처리
  ///
  /// 1. 로컬 토큰 삭제
  /// 2. onForceLogout 콜백 호출 (Firebase 로그아웃 + 로그인 화면 이동)
  Future<void> _handleForceLogout() async {
    try {
      final tokenStorage = _ref.read(tokenStorageProvider);
      await tokenStorage.clearTokens();
      debugPrint('🚪 Tokens cleared');

      if (onForceLogout != null) {
        await onForceLogout!();
        debugPrint('🚪 Force logout callback executed');
      }
    } catch (e) {
      debugPrint('❌ Force logout error: $e');
    }
  }
}

/// 대기 중인 요청 정보
class _PendingRequest {
  final RequestOptions options;
  final ErrorInterceptorHandler handler;

  _PendingRequest({required this.options, required this.handler});
}
