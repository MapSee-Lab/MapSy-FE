import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/api_endpoints.dart';
import 'auth_interceptor.dart';
import 'error_interceptor.dart';

part 'api_client.g.dart';

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
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 30), // LLM 처리 시간 고려
      sendTimeout: const Duration(minutes: 30), // LLM 처리 시간 고려
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // 인터셉터 추가 (순서 중요!)
  // 1. 로깅 (개발 모드에서만)
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (obj) => debugPrint('📡 $obj'),
      ),
    );
  }

  // 2. 통합 인증 인터셉터 (토큰 주입 + 401 갱신 + 강제 로그아웃)
  final refreshDio = ref.read(refreshDioProvider);
  dio.interceptors.add(
    AuthInterceptor(
      ref,
      dio,
      refreshDio,
      onForceLogout: () async {
        debugPrint('🚪 Force logout: Firebase signOut + GoRouter redirect');
        try {
          await FirebaseAuth.instance.signOut();
        } catch (e) {
          debugPrint('⚠️ Firebase signOut error during force logout: $e');
        }
        // GoRouter의 refreshListenable이 authStateChanges를 구독하고 있으므로
        // Firebase signOut만으로 자동으로 로그인 페이지로 리다이렉트됩니다.
      },
    ),
  );

  // 3. 에러 변환 (DioException → AppException)
  dio.interceptors.add(ErrorInterceptor());

  return dio;
}

/// 토큰 갱신 전용 Dio 인스턴스
///
/// AuthInterceptor에서 토큰 갱신 요청에 사용하는 별도의 Dio 인스턴스입니다.
/// 인터셉터 순환을 방지하기 위해 최소한의 설정만 적용합니다.
@Riverpod(keepAlive: true)
Dio refreshDio(Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}
