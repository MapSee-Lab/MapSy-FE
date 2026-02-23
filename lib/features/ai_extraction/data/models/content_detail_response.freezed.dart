// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContentDetailResponse _$ContentDetailResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ContentDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$ContentDetailResponse {
  int get contentId => throw _privateConstructorUsedError;

  /// PENDING, PROCESSING, COMPLETED, FAILED
  String get status => throw _privateConstructorUsedError;
  String? get sourceUrl => throw _privateConstructorUsedError;
  List<PlaceModel> get places => throw _privateConstructorUsedError;

  /// Serializes this ContentDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentDetailResponseCopyWith<ContentDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentDetailResponseCopyWith<$Res> {
  factory $ContentDetailResponseCopyWith(
    ContentDetailResponse value,
    $Res Function(ContentDetailResponse) then,
  ) = _$ContentDetailResponseCopyWithImpl<$Res, ContentDetailResponse>;
  @useResult
  $Res call({
    int contentId,
    String status,
    String? sourceUrl,
    List<PlaceModel> places,
  });
}

/// @nodoc
class _$ContentDetailResponseCopyWithImpl<$Res,
        $Val extends ContentDetailResponse>
    implements $ContentDetailResponseCopyWith<$Res> {
  _$ContentDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? status = null,
    Object? sourceUrl = freezed,
    Object? places = null,
  }) {
    return _then(
      _value.copyWith(
            contentId: null == contentId
                ? _value.contentId
                : contentId // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceUrl: freezed == sourceUrl
                ? _value.sourceUrl
                : sourceUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            places: null == places
                ? _value.places
                : places // ignore: cast_nullable_to_non_nullable
                      as List<PlaceModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContentDetailResponseImplCopyWith<$Res>
    implements $ContentDetailResponseCopyWith<$Res> {
  factory _$$ContentDetailResponseImplCopyWith(
    _$ContentDetailResponseImpl value,
    $Res Function(_$ContentDetailResponseImpl) then,
  ) = __$$ContentDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int contentId,
    String status,
    String? sourceUrl,
    List<PlaceModel> places,
  });
}

/// @nodoc
class __$$ContentDetailResponseImplCopyWithImpl<$Res>
    extends _$ContentDetailResponseCopyWithImpl<$Res,
        _$ContentDetailResponseImpl>
    implements _$$ContentDetailResponseImplCopyWith<$Res> {
  __$$ContentDetailResponseImplCopyWithImpl(
    _$ContentDetailResponseImpl _value,
    $Res Function(_$ContentDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContentDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? status = null,
    Object? sourceUrl = freezed,
    Object? places = null,
  }) {
    return _then(
      _$ContentDetailResponseImpl(
        contentId: null == contentId
            ? _value.contentId
            : contentId // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceUrl: freezed == sourceUrl
            ? _value.sourceUrl
            : sourceUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        places: null == places
            ? _value._places
            : places // ignore: cast_nullable_to_non_nullable
                  as List<PlaceModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentDetailResponseImpl implements _ContentDetailResponse {
  const _$ContentDetailResponseImpl({
    required this.contentId,
    required this.status,
    this.sourceUrl,
    final List<PlaceModel> places = const [],
  }) : _places = places;

  factory _$ContentDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentDetailResponseImplFromJson(json);

  @override
  final int contentId;

  /// PENDING, PROCESSING, COMPLETED, FAILED
  @override
  final String status;
  @override
  final String? sourceUrl;

  final List<PlaceModel> _places;

  @override
  @JsonKey()
  List<PlaceModel> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'ContentDetailResponse(contentId: $contentId, status: $status, sourceUrl: $sourceUrl, places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentDetailResponseImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    contentId,
    status,
    sourceUrl,
    const DeepCollectionEquality().hash(_places),
  );

  /// Create a copy of ContentDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentDetailResponseImplCopyWith<_$ContentDetailResponseImpl>
      get copyWith => __$$ContentDetailResponseImplCopyWithImpl<
          _$ContentDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentDetailResponseImplToJson(this);
  }
}

abstract class _ContentDetailResponse implements ContentDetailResponse {
  const factory _ContentDetailResponse({
    required final int contentId,
    required final String status,
    final String? sourceUrl,
    final List<PlaceModel> places,
  }) = _$ContentDetailResponseImpl;

  factory _ContentDetailResponse.fromJson(Map<String, dynamic> json) =
      _$ContentDetailResponseImpl.fromJson;

  @override
  int get contentId;

  /// PENDING, PROCESSING, COMPLETED, FAILED
  @override
  String get status;
  @override
  String? get sourceUrl;
  @override
  List<PlaceModel> get places;

  /// Create a copy of ContentDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentDetailResponseImplCopyWith<_$ContentDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
