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
  /// 장소 ID (UUID)
  String get placeId => throw _privateConstructorUsedError;

  /// 장소명
  String get name => throw _privateConstructorUsedError;

  /// 주소
  String? get address => throw _privateConstructorUsedError;

  /// 평점 (0.0 ~ 5.0)
  double? get rating => throw _privateConstructorUsedError;

  /// 리뷰 수
  int? get userRatingsTotal => throw _privateConstructorUsedError;

  /// 사진 URL 배열 (최대 10개)
  List<String> get photoUrls => throw _privateConstructorUsedError;

  /// 장소 요약 설명
  String? get description => throw _privateConstructorUsedError;

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
    String placeId,
    String name,
    String? address,
    double? rating,
    int? userRatingsTotal,
    List<String> photoUrls,
    String? description,
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
    Object? name = null,
    Object? address = freezed,
    Object? rating = freezed,
    Object? userRatingsTotal = freezed,
    Object? photoUrls = null,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            placeId: null == placeId
                ? _value.placeId
                : placeId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double?,
            userRatingsTotal: freezed == userRatingsTotal
                ? _value.userRatingsTotal
                : userRatingsTotal // ignore: cast_nullable_to_non_nullable
                      as int?,
            photoUrls: null == photoUrls
                ? _value.photoUrls
                : photoUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
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
    String placeId,
    String name,
    String? address,
    double? rating,
    int? userRatingsTotal,
    List<String> photoUrls,
    String? description,
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
    Object? name = null,
    Object? address = freezed,
    Object? rating = freezed,
    Object? userRatingsTotal = freezed,
    Object? photoUrls = null,
    Object? description = freezed,
  }) {
    return _then(
      _$PlaceModelImpl(
        placeId: null == placeId
            ? _value.placeId
            : placeId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double?,
        userRatingsTotal: freezed == userRatingsTotal
            ? _value.userRatingsTotal
            : userRatingsTotal // ignore: cast_nullable_to_non_nullable
                  as int?,
        photoUrls: null == photoUrls
            ? _value._photoUrls
            : photoUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceModelImpl implements _PlaceModel {
  const _$PlaceModelImpl({
    required this.placeId,
    required this.name,
    this.address,
    this.rating,
    this.userRatingsTotal,
    final List<String> photoUrls = const [],
    this.description,
  }) : _photoUrls = photoUrls;

  factory _$PlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceModelImplFromJson(json);

  /// 장소 ID (UUID)
  @override
  final String placeId;

  /// 장소명
  @override
  final String name;

  /// 주소
  @override
  final String? address;

  /// 평점 (0.0 ~ 5.0)
  @override
  final double? rating;

  /// 리뷰 수
  @override
  final int? userRatingsTotal;

  /// 사진 URL 배열 (최대 10개)
  final List<String> _photoUrls;

  /// 사진 URL 배열 (최대 10개)
  @override
  @JsonKey()
  List<String> get photoUrls {
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoUrls);
  }

  /// 장소 요약 설명
  @override
  final String? description;

  @override
  String toString() {
    return 'PlaceModel(placeId: $placeId, name: $name, address: $address, rating: $rating, userRatingsTotal: $userRatingsTotal, photoUrls: $photoUrls, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceModelImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.userRatingsTotal, userRatingsTotal) ||
                other.userRatingsTotal == userRatingsTotal) &&
            const DeepCollectionEquality().equals(
              other._photoUrls,
              _photoUrls,
            ) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    placeId,
    name,
    address,
    rating,
    userRatingsTotal,
    const DeepCollectionEquality().hash(_photoUrls),
    description,
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
    required final String placeId,
    required final String name,
    final String? address,
    final double? rating,
    final int? userRatingsTotal,
    final List<String> photoUrls,
    final String? description,
  }) = _$PlaceModelImpl;

  factory _PlaceModel.fromJson(Map<String, dynamic> json) =
      _$PlaceModelImpl.fromJson;

  /// 장소 ID (UUID)
  @override
  String get placeId;

  /// 장소명
  @override
  String get name;

  /// 주소
  @override
  String? get address;

  /// 평점 (0.0 ~ 5.0)
  @override
  double? get rating;

  /// 리뷰 수
  @override
  int? get userRatingsTotal;

  /// 사진 URL 배열 (최대 10개)
  @override
  List<String> get photoUrls;

  /// 장소 요약 설명
  @override
  String? get description;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
