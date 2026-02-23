import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

/// 장소 모델
@freezed
class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    /// 장소 ID
    required int placeId,

    /// 장소명
    required String placeName,

    /// 주소
    String? address,

    /// 위도
    double? latitude,

    /// 경도
    double? longitude,

    /// 카테고리
    String? category,

    /// 태그 목록
    @Default([]) List<String> tags,

    /// 대표 이미지 URL
    String? imageUrl,

    /// 콘텐츠 ID (상위 콘텐츠)
    int? contentId,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);
}
