import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api_endpoints.dart';
import '../../../common/services/api_client.dart';
import 'models/content_response.dart';

part 'home_remote_datasource.g.dart';

/// HomeRemoteDataSource Provider
@riverpod
HomeRemoteDataSource homeRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return HomeRemoteDataSource(dio);
}

/// 홈 화면 Remote DataSource
///
/// 홈 피드에 필요한 백엔드 API를 호출합니다.
class HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteDataSource(this._dio);

  /// 최근 콘텐츠 목록 조회 (커서 기반 페이지네이션)
  ///
  /// GET /api/content/recent?cursor={cursor}&size={size}
  Future<ContentListResponse> fetchRecentContent({
    int? cursor,
    int size = 20,
  }) async {
    debugPrint('📤 HomeRemoteDataSource: Fetching recent content...');

    final response = await _dio.get(
      ApiEndpoints.recentContent,
      queryParameters: {
        if (cursor != null) 'cursor': cursor,
        'size': size,
      },
    );

    final result = ContentListResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Recent content fetched: ${result.content.length} items');
    return result;
  }

  /// 회원 콘텐츠 목록 조회 (커서 기반 페이지네이션)
  ///
  /// GET /api/content/member?cursor={cursor}&size={size}
  Future<ContentListResponse> fetchMemberContent({
    int? cursor,
    int size = 30,
  }) async {
    debugPrint('📤 HomeRemoteDataSource: Fetching member content...');

    final response = await _dio.get(
      ApiEndpoints.memberContent,
      queryParameters: {
        if (cursor != null) 'cursor': cursor,
        'size': size,
      },
    );

    final result = ContentListResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Member content fetched: ${result.content.length} items');
    return result;
  }
}
