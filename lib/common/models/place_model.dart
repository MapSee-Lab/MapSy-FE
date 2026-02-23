import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

/// 장소 모델 (공통) - 백엔드 PlaceDto 매칭
///
/// 백엔드에 두 개의 PlaceDto가 존재:
/// - MS-Place/PlaceDto: placeId 필드 사용 (폴더, 저장 장소) → 그대로 역직렬화
/// - MS-SNS/PlaceDto: id 필드 사용 (콘텐츠 상세) → ContentDetailResponse.fromSnsJson에서 매핑
@freezed
class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    /// 장소 ID (UUID)
    required String placeId,

    /// 장소명
    required String name,

    /// 주소
    String? address,

    /// 평점 (0.0 ~ 5.0)
    double? rating,

    /// 리뷰 수
    int? userRatingsTotal,

    /// 사진 URL 배열 (최대 10개)
    @Default([]) List<String> photoUrls,

    /// 장소 요약 설명
    String? description,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);
}
