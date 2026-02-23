import 'package:freezed_annotation/freezed_annotation.dart';

part 'analyze_response.freezed.dart';
part 'analyze_response.g.dart';

/// AI 분석 응답 DTO
@freezed
class AnalyzeResponse with _$AnalyzeResponse {
  const factory AnalyzeResponse({
    /// 폴링용 콘텐츠 ID
    required int contentId,
  }) = _AnalyzeResponse;

  factory AnalyzeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnalyzeResponseFromJson(json);
}
