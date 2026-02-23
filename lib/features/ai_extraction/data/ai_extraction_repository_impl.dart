import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'ai_extraction_repository.dart';
import 'ai_extraction_remote_datasource.dart';
import 'models/analyze_request.dart';
import 'models/analyze_response.dart';
import 'models/content_detail_response.dart';

part 'ai_extraction_repository_impl.g.dart';

@riverpod
AiExtractionRepository aiExtractionRepository(Ref ref) {
  final remoteDataSource = ref.watch(aiExtractionRemoteDataSourceProvider);
  return AiExtractionRepositoryImpl(remoteDataSource);
}

/// AI 장소 추출 Repository 구현체
class AiExtractionRepositoryImpl implements AiExtractionRepository {
  final AiExtractionRemoteDataSource _remoteDataSource;

  AiExtractionRepositoryImpl(this._remoteDataSource);

  @override
  Future<AnalyzeResponse> analyze(AnalyzeRequest request) async {
    debugPrint('📝 AiExtractionRepo: Analyzing...');
    return await _remoteDataSource.analyze(request);
  }

  @override
  Future<ContentDetailResponse> getContentDetail(int contentId) async {
    debugPrint('📝 AiExtractionRepo: Getting content detail...');
    return await _remoteDataSource.getContentDetail(contentId);
  }

  @override
  Future<void> savePlace(int placeId) async {
    debugPrint('📝 AiExtractionRepo: Saving place...');
    return await _remoteDataSource.savePlace(placeId);
  }
}
