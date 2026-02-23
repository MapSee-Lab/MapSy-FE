import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_response.freezed.dart';
part 'content_response.g.dart';

/// 콘텐츠 아이템 - 백엔드 ContentDto 매칭
@freezed
class ContentItemModel with _$ContentItemModel {
  const factory ContentItemModel({
    /// 콘텐츠 ID (UUID)
    required String id,

    /// 플랫폼 유형 (INSTAGRAM, YOUTUBE 등)
    String? platform,

    /// 처리 상태 (PENDING, ANALYZING, COMPLETED, FAILED, DELETED)
    String? status,

    /// 업로더 이름
    String? platformUploader,

    /// 캡션
    String? caption,

    /// 썸네일 URL
    String? thumbnailUrl,

    /// 원본 SNS URL
    String? originalUrl,

    /// 제목
    String? title,

    /// 요약 설명
    String? summary,

    /// 마지막 확인 시각
    String? lastCheckedAt,
  }) = _ContentItemModel;

  factory ContentItemModel.fromJson(Map<String, dynamic> json) =>
      _$ContentItemModelFromJson(json);
}

/// 최근 콘텐츠 목록 응답 - 백엔드 GetRecentContentResponse 매칭
@freezed
class RecentContentResponse with _$RecentContentResponse {
  const factory RecentContentResponse({
    @Default([]) List<ContentItemModel> contents,
  }) = _RecentContentResponse;

  factory RecentContentResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentContentResponseFromJson(json);
}

/// 회원 콘텐츠 목록 응답 - 백엔드 GetMemberContentPageResponse 매칭
/// Spring `Page<ContentDto>`를 contentPage 필드로 감싸는 구조
@freezed
class MemberContentPageResponse with _$MemberContentPageResponse {
  const factory MemberContentPageResponse({
    required ContentPage contentPage,
  }) = _MemberContentPageResponse;

  factory MemberContentPageResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberContentPageResponseFromJson(json);
}

/// Spring Page 구조 매칭
@freezed
class ContentPage with _$ContentPage {
  const factory ContentPage({
    @Default([]) List<ContentItemModel> content,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
    @Default(0) int size,
    @Default(0) int number,
    @Default(true) bool first,
    @Default(true) bool last,
    @Default(true) bool empty,
  }) = _ContentPage;

  factory ContentPage.fromJson(Map<String, dynamic> json) =>
      _$ContentPageFromJson(json);
}
