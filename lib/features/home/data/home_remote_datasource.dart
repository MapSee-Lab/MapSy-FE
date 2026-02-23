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
class HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteDataSource(this._dio);

  /// 최근 콘텐츠 목록 조회
  ///
  /// GET /api/content/recent
  Future<RecentContentResponse> fetchRecentContent() async {
    debugPrint('📤 HomeRemoteDataSource: Fetching recent content...');

    final response = await _dio.get(ApiEndpoints.recentContent);

    final result = RecentContentResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Recent content fetched: ${result.contents.length} items');
    return result;
  }

  /// 회원 콘텐츠 목록 조회 (Spring Page 기반 페이지네이션)
  ///
  /// GET /api/content/member?pageSize={pageSize}
  Future<MemberContentPageResponse> fetchMemberContent({
    int pageSize = 10,
  }) async {
    debugPrint('📤 HomeRemoteDataSource: Fetching member content...');

    final response = await _dio.get(
      ApiEndpoints.memberContent,
      queryParameters: {
        'pageSize': pageSize,
      },
    );

    final result = MemberContentPageResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint(
      '✅ Member content fetched: ${result.contentPage.content.length} items',
    );
    return result;
  }
}
