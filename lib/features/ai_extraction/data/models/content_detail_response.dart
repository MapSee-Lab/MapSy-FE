import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/models/place_model.dart';

part 'content_detail_response.freezed.dart';
part 'content_detail_response.g.dart';

/// 콘텐츠 상세 응답 DTO (폴링용)
@freezed
class ContentDetailResponse with _$ContentDetailResponse {
  const factory ContentDetailResponse({
    required int contentId,
    /// PENDING, PROCESSING, COMPLETED, FAILED
    required String status,
    String? sourceUrl,
    @Default([]) List<PlaceModel> places,
  }) = _ContentDetailResponse;

  factory ContentDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailResponseFromJson(json);
}
