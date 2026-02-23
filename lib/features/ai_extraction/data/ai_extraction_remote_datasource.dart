import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api_endpoints.dart';
import '../../../common/services/api_client.dart';
import 'models/analyze_request.dart';
import 'models/analyze_response.dart';
import 'models/content_detail_response.dart';

part 'ai_extraction_remote_datasource.g.dart';

@riverpod
AiExtractionRemoteDataSource aiExtractionRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AiExtractionRemoteDataSource(dio);
}

/// AI 장소 추출 Remote DataSource
class AiExtractionRemoteDataSource {
  final Dio _dio;

  AiExtractionRemoteDataSource(this._dio);

  /// AI 분석 요청
  /// POST /api/content/analyze
  Future<AnalyzeResponse> analyze(AnalyzeRequest request) async {
    debugPrint('📤 AiExtraction: Analyzing URL: ${request.sourceUrl}');

    final response = await _dio.post(
      ApiEndpoints.contentAnalyze,
      data: request.toJson(),
    );

    final result = AnalyzeResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Analyze requested: contentId=${result.contentId}');
    return result;
  }

  /// 콘텐츠 상세 조회 (폴링용)
  /// GET /api/content/{contentId}
  Future<ContentDetailResponse> getContentDetail(int contentId) async {
    debugPrint('📤 AiExtraction: Polling contentId=$contentId');

    final response = await _dio.get(
      ApiEndpoints.contentDetail(contentId.toString()),
    );

    final result = ContentDetailResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Content status: ${result.status}');
    return result;
  }

  /// 장소 저장
  /// POST /api/place/{placeId}/save
  Future<void> savePlace(int placeId) async {
    debugPrint('📤 AiExtraction: Saving placeId=$placeId');

    await _dio.post(
      ApiEndpoints.savePlace(placeId.toString()),
    );

    debugPrint('✅ Place saved: placeId=$placeId');
  }
}
