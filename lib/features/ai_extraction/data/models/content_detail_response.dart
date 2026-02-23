import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/models/place_model.dart';

part 'content_detail_response.freezed.dart';
part 'content_detail_response.g.dart';

/// 콘텐츠 상세 응답 DTO - 백엔드 GetContentInfoResponse 매칭
@freezed
class ContentDetailResponse with _$ContentDetailResponse {
  const factory ContentDetailResponse({
    /// 콘텐츠 상세 정보
    required ContentInfo content,

    /// 연관된 장소 목록 (position 순서)
    @Default([]) List<PlaceModel> places,
  }) = _ContentDetailResponse;

  factory ContentDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailResponseFromJson(json);

  /// SNS PlaceDto의 id → placeId 매핑이 필요한 경우 사용
  static ContentDetailResponse fromSnsJson(Map<String, dynamic> json) {
    final normalized = Map<String, dynamic>.from(json);
    if (normalized['places'] is List) {
      normalized['places'] = (normalized['places'] as List).map((p) {
        if (p is Map && p.containsKey('id') && !p.containsKey('placeId')) {
          return Map<String, dynamic>.from(p)..['placeId'] = p['id'];
        }
        return p;
      }).toList();
    }
    return _$ContentDetailResponseFromJson(normalized);
  }
}

/// 콘텐츠 정보 DTO - 백엔드 ContentDto 매칭
@freezed
class ContentInfo with _$ContentInfo {
  const factory ContentInfo({
    /// 콘텐츠 ID (UUID)
    required String id,

    /// 플랫폼 유형 (INSTAGRAM, YOUTUBE 등)
    String? platform,

    /// 처리 상태 (PENDING, ANALYZING, COMPLETED, FAILED, DELETED)
    required String status,

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
  }) = _ContentInfo;

  factory ContentInfo.fromJson(Map<String, dynamic> json) =>
      _$ContentInfoFromJson(json);
}
