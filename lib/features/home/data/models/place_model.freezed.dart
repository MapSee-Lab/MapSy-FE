// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) {
  return _PlaceModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceModel {
  /// 장소 ID
  int get placeId => throw _privateConstructorUsedError;

  /// 장소명
  String get placeName => throw _privateConstructorUsedError;

  /// 주소
  String? get address => throw _privateConstructorUsedError;

  /// 위도
  double? get latitude => throw _privateConstructorUsedError;

  /// 경도
  double? get longitude => throw _privateConstructorUsedError;

  /// 카테고리
  String? get category => throw _privateConstructorUsedError;

  /// 태그 목록
  List<String> get tags => throw _privateConstructorUsedError;

  /// 대표 이미지 URL
  String? get imageUrl => throw _privateConstructorUsedError;

  /// 콘텐츠 ID (상위 콘텐츠)
  int? get contentId => throw _privateConstructorUsedError;

  /// Serializes this PlaceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceModelCopyWith<PlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceModelCopyWith<$Res> {
  factory $PlaceModelCopyWith(
    PlaceModel value,
    $Res Function(PlaceModel) then,
  ) = _$PlaceModelCopyWithImpl<$Res, PlaceModel>;
  @useResult
  $Res call({
    int placeId,
    String placeName,
    String? address,
    double? latitude,
    double? longitude,
    String? category,
    List<String> tags,
    String? imageUrl,
    int? contentId,
  });
}

/// @nodoc
class _$PlaceModelCopyWithImpl<$Res, $Val extends PlaceModel>
    implements $PlaceModelCopyWith<$Res> {
  _$PlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? placeName = null,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? category = freezed,
    Object? tags = null,
    Object? imageUrl = freezed,
    Object? contentId = freezed,
  }) {
    return _then(
      _value.copyWith(
            placeId: null == placeId
                ? _value.placeId
                : placeId // ignore: cast_nullable_to_non_nullable
                      as int,
            placeName: null == placeName
                ? _value.placeName
                : placeName // ignore: cast_nullable_to_non_nullable
                      as String,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            contentId: freezed == contentId
                ? _value.contentId
                : contentId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlaceModelImplCopyWith<$Res>
    implements $PlaceModelCopyWith<$Res> {
  factory _$$PlaceModelImplCopyWith(
    _$PlaceModelImpl value,
    $Res Function(_$PlaceModelImpl) then,
  ) = __$$PlaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int placeId,
    String placeName,
    String? address,
    double? latitude,
    double? longitude,
    String? category,
    List<String> tags,
    String? imageUrl,
    int? contentId,
  });
}

/// @nodoc
class __$$PlaceModelImplCopyWithImpl<$Res>
    extends _$PlaceModelCopyWithImpl<$Res, _$PlaceModelImpl>
    implements _$$PlaceModelImplCopyWith<$Res> {
  __$$PlaceModelImplCopyWithImpl(
    _$PlaceModelImpl _value,
    $Res Function(_$PlaceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? placeName = null,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? category = freezed,
    Object? tags = null,
    Object? imageUrl = freezed,
    Object? contentId = freezed,
  }) {
    return _then(
      _$PlaceModelImpl(
        placeId: null == placeId
            ? _value.placeId
            : placeId // ignore: cast_nullable_to_non_nullable
                  as int,
        placeName: null == placeName
            ? _value.placeName
            : placeName // ignore: cast_nullable_to_non_nullable
                  as String,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        contentId: freezed == contentId
            ? _value.contentId
            : contentId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceModelImpl implements _PlaceModel {
  const _$PlaceModelImpl({
    required this.placeId,
    required this.placeName,
    this.address,
    this.latitude,
    this.longitude,
    this.category,
    final List<String> tags = const [],
    this.imageUrl,
    this.contentId,
  }) : _tags = tags;

  factory _$PlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceModelImplFromJson(json);

  /// 장소 ID
  @override
  final int placeId;

  /// 장소명
  @override
  final String placeName;

  /// 주소
  @override
  final String? address;

  /// 위도
  @override
  final double? latitude;

  /// 경도
  @override
  final double? longitude;

  /// 카테고리
  @override
  final String? category;

  /// 태그 목록
  final List<String> _tags;

  /// 태그 목록
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// 대표 이미지 URL
  @override
  final String? imageUrl;

  /// 콘텐츠 ID (상위 콘텐츠)
  @override
  final int? contentId;

  @override
  String toString() {
    return 'PlaceModel(placeId: $placeId, placeName: $placeName, address: $address, latitude: $latitude, longitude: $longitude, category: $category, tags: $tags, imageUrl: $imageUrl, contentId: $contentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceModelImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    placeId,
    placeName,
    address,
    latitude,
    longitude,
    category,
    const DeepCollectionEquality().hash(_tags),
    imageUrl,
    contentId,
  );

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      __$$PlaceModelImplCopyWithImpl<_$PlaceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceModelImplToJson(this);
  }
}

abstract class _PlaceModel implements PlaceModel {
  const factory _PlaceModel({
    required final int placeId,
    required final String placeName,
    final String? address,
    final double? latitude,
    final double? longitude,
    final String? category,
    final List<String> tags,
    final String? imageUrl,
    final int? contentId,
  }) = _$PlaceModelImpl;

  factory _PlaceModel.fromJson(Map<String, dynamic> json) =
      _$PlaceModelImpl.fromJson;

  /// 장소 ID
  @override
  int get placeId;

  /// 장소명
  @override
  String get placeName;

  /// 주소
  @override
  String? get address;

  /// 위도
  @override
  double? get latitude;

  /// 경도
  @override
  double? get longitude;

  /// 카테고리
  @override
  String? get category;

  /// 태그 목록
  @override
  List<String> get tags;

  /// 대표 이미지 URL
  @override
  String? get imageUrl;

  /// 콘텐츠 ID (상위 콘텐츠)
  @override
  int? get contentId;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
