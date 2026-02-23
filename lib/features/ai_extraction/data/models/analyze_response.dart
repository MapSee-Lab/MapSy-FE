import 'package:freezed_annotation/freezed_annotation.dart';

part 'analyze_response.freezed.dart';
part 'analyze_response.g.dart';

/// AI 분석 응답 DTO - 백엔드 RequestPlaceExtractionResponse 매칭
@freezed
class AnalyzeResponse with _$AnalyzeResponse {
  const factory AnalyzeResponse({
    /// 폴링용 콘텐츠 ID (UUID)
    required String contentId,

    /// 회원 ID (UUID)
    String? memberId,

    /// 장소 추출 상태 (PENDING, ANALYZING, COMPLETED, FAILED, DELETED)
    String? status,
  }) = _AnalyzeResponse;

  factory AnalyzeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnalyzeResponseFromJson(json);
}
