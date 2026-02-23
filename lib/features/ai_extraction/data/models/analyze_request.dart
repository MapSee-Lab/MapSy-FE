import 'package:freezed_annotation/freezed_annotation.dart';

part 'analyze_request.freezed.dart';
part 'analyze_request.g.dart';

/// AI 분석 요청 DTO
@freezed
class AnalyzeRequest with _$AnalyzeRequest {
  const factory AnalyzeRequest({
    /// SNS URL (Instagram, YouTube)
    @JsonKey(name: 'snsUrl') required String sourceUrl,
  }) = _AnalyzeRequest;

  factory AnalyzeRequest.fromJson(Map<String, dynamic> json) =>
      _$AnalyzeRequestFromJson(json);
}
