import 'package:freezed_annotation/freezed_annotation.dart';

import 'cursor_model.dart';
import 'place_model.dart';

part 'content_response.freezed.dart';
part 'content_response.g.dart';

/// 콘텐츠 아이템 (API 응답 단위)
@freezed
class ContentItem with _$ContentItem {
  const factory ContentItem({
    /// 콘텐츠 ID
    required int contentId,

    /// 원본 URL
    String? sourceUrl,

    /// 콘텐츠 상태
    String? status,

    /// 생성일시
    String? createdAt,

    /// 콘텐츠에 포함된 장소 목록
    @Default([]) List<PlaceModel> places,
  }) = _ContentItem;

  factory ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);
}

/// 콘텐츠 목록 응답 (페이지네이션 포함)
@freezed
class ContentListResponse with _$ContentListResponse {
  const factory ContentListResponse({
    /// 콘텐츠 아이템 목록
    @Default([]) List<ContentItem> content,

    /// 페이지네이션 정보
    CursorModel? cursor,
  }) = _ContentListResponse;

  factory ContentListResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentListResponseFromJson(json);
}
