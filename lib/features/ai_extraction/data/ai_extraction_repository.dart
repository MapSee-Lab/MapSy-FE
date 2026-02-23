import 'models/analyze_request.dart';
import 'models/analyze_response.dart';
import 'models/content_detail_response.dart';

/// AI 장소 추출 Repository 인터페이스
abstract class AiExtractionRepository {
  /// AI 분석 요청
  Future<AnalyzeResponse> analyze(AnalyzeRequest request);

  /// 콘텐츠 상세 조회 (폴링용)
  Future<ContentDetailResponse> getContentDetail(int contentId);

  /// 장소 저장
  Future<void> savePlace(int placeId);
}
