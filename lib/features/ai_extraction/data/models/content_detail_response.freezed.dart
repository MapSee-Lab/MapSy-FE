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
  /// 콘텐츠 상세 정보
  ContentInfo get content => throw _privateConstructorUsedError;

  /// 연관된 장소 목록 (position 순서)
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
  $Res call({ContentInfo content, List<PlaceModel> places});

  $ContentInfoCopyWith<$Res> get content;
}

/// @nodoc
class _$ContentDetailResponseCopyWithImpl<
  $Res,
  $Val extends ContentDetailResponse
>
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
  $Res call({Object? content = null, Object? places = null}) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as ContentInfo,
            places: null == places
                ? _value.places
                : places // ignore: cast_nullable_to_non_nullable
                      as List<PlaceModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of ContentDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentInfoCopyWith<$Res> get content {
    return $ContentInfoCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
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
  $Res call({ContentInfo content, List<PlaceModel> places});

  @override
  $ContentInfoCopyWith<$Res> get content;
}

/// @nodoc
class __$$ContentDetailResponseImplCopyWithImpl<$Res>
    extends
        _$ContentDetailResponseCopyWithImpl<$Res, _$ContentDetailResponseImpl>
    implements _$$ContentDetailResponseImplCopyWith<$Res> {
  __$$ContentDetailResponseImplCopyWithImpl(
    _$ContentDetailResponseImpl _value,
    $Res Function(_$ContentDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContentDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? places = null}) {
    return _then(
      _$ContentDetailResponseImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as ContentInfo,
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
    required this.content,
    final List<PlaceModel> places = const [],
  }) : _places = places;

  factory _$ContentDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentDetailResponseImplFromJson(json);

  /// 콘텐츠 상세 정보
  @override
  final ContentInfo content;

  /// 연관된 장소 목록 (position 순서)
  final List<PlaceModel> _places;

  /// 연관된 장소 목록 (position 순서)
  @override
  @JsonKey()
  List<PlaceModel> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'ContentDetailResponse(content: $content, places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentDetailResponseImpl &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    content,
    const DeepCollectionEquality().hash(_places),
  );

  /// Create a copy of ContentDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentDetailResponseImplCopyWith<_$ContentDetailResponseImpl>
  get copyWith =>
      __$$ContentDetailResponseImplCopyWithImpl<_$ContentDetailResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentDetailResponseImplToJson(this);
  }
}

abstract class _ContentDetailResponse implements ContentDetailResponse {
  const factory _ContentDetailResponse({
    required final ContentInfo content,
    final List<PlaceModel> places,
  }) = _$ContentDetailResponseImpl;

  factory _ContentDetailResponse.fromJson(Map<String, dynamic> json) =
      _$ContentDetailResponseImpl.fromJson;

  /// 콘텐츠 상세 정보
  @override
  ContentInfo get content;

  /// 연관된 장소 목록 (position 순서)
  @override
  List<PlaceModel> get places;

  /// Create a copy of ContentDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentDetailResponseImplCopyWith<_$ContentDetailResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ContentInfo _$ContentInfoFromJson(Map<String, dynamic> json) {
  return _ContentInfo.fromJson(json);
}

/// @nodoc
mixin _$ContentInfo {
  /// 콘텐츠 ID (UUID)
  String get id => throw _privateConstructorUsedError;

  /// 플랫폼 유형 (INSTAGRAM, YOUTUBE 등)
  String? get platform => throw _privateConstructorUsedError;

  /// 처리 상태 (PENDING, ANALYZING, COMPLETED, FAILED, DELETED)
  String get status => throw _privateConstructorUsedError;

  /// 업로더 이름
  String? get platformUploader => throw _privateConstructorUsedError;

  /// 캡션
  String? get caption => throw _privateConstructorUsedError;

  /// 썸네일 URL
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// 원본 SNS URL
  String? get originalUrl => throw _privateConstructorUsedError;

  /// 제목
  String? get title => throw _privateConstructorUsedError;

  /// 요약 설명
  String? get summary => throw _privateConstructorUsedError;

  /// 마지막 확인 시각
  String? get lastCheckedAt => throw _privateConstructorUsedError;

  /// Serializes this ContentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentInfoCopyWith<ContentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentInfoCopyWith<$Res> {
  factory $ContentInfoCopyWith(
    ContentInfo value,
    $Res Function(ContentInfo) then,
  ) = _$ContentInfoCopyWithImpl<$Res, ContentInfo>;
  @useResult
  $Res call({
    String id,
    String? platform,
    String status,
    String? platformUploader,
    String? caption,
    String? thumbnailUrl,
    String? originalUrl,
    String? title,
    String? summary,
    String? lastCheckedAt,
  });
}

/// @nodoc
class _$ContentInfoCopyWithImpl<$Res, $Val extends ContentInfo>
    implements $ContentInfoCopyWith<$Res> {
  _$ContentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? platform = freezed,
    Object? status = null,
    Object? platformUploader = freezed,
    Object? caption = freezed,
    Object? thumbnailUrl = freezed,
    Object? originalUrl = freezed,
    Object? title = freezed,
    Object? summary = freezed,
    Object? lastCheckedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            platform: freezed == platform
                ? _value.platform
                : platform // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            platformUploader: freezed == platformUploader
                ? _value.platformUploader
                : platformUploader // ignore: cast_nullable_to_non_nullable
                      as String?,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            originalUrl: freezed == originalUrl
                ? _value.originalUrl
                : originalUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastCheckedAt: freezed == lastCheckedAt
                ? _value.lastCheckedAt
                : lastCheckedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContentInfoImplCopyWith<$Res>
    implements $ContentInfoCopyWith<$Res> {
  factory _$$ContentInfoImplCopyWith(
    _$ContentInfoImpl value,
    $Res Function(_$ContentInfoImpl) then,
  ) = __$$ContentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? platform,
    String status,
    String? platformUploader,
    String? caption,
    String? thumbnailUrl,
    String? originalUrl,
    String? title,
    String? summary,
    String? lastCheckedAt,
  });
}

/// @nodoc
class __$$ContentInfoImplCopyWithImpl<$Res>
    extends _$ContentInfoCopyWithImpl<$Res, _$ContentInfoImpl>
    implements _$$ContentInfoImplCopyWith<$Res> {
  __$$ContentInfoImplCopyWithImpl(
    _$ContentInfoImpl _value,
    $Res Function(_$ContentInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? platform = freezed,
    Object? status = null,
    Object? platformUploader = freezed,
    Object? caption = freezed,
    Object? thumbnailUrl = freezed,
    Object? originalUrl = freezed,
    Object? title = freezed,
    Object? summary = freezed,
    Object? lastCheckedAt = freezed,
  }) {
    return _then(
      _$ContentInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: freezed == platform
            ? _value.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        platformUploader: freezed == platformUploader
            ? _value.platformUploader
            : platformUploader // ignore: cast_nullable_to_non_nullable
                  as String?,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalUrl: freezed == originalUrl
            ? _value.originalUrl
            : originalUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastCheckedAt: freezed == lastCheckedAt
            ? _value.lastCheckedAt
            : lastCheckedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentInfoImpl implements _ContentInfo {
  const _$ContentInfoImpl({
    required this.id,
    this.platform,
    required this.status,
    this.platformUploader,
    this.caption,
    this.thumbnailUrl,
    this.originalUrl,
    this.title,
    this.summary,
    this.lastCheckedAt,
  });

  factory _$ContentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentInfoImplFromJson(json);

  /// 콘텐츠 ID (UUID)
  @override
  final String id;

  /// 플랫폼 유형 (INSTAGRAM, YOUTUBE 등)
  @override
  final String? platform;

  /// 처리 상태 (PENDING, ANALYZING, COMPLETED, FAILED, DELETED)
  @override
  final String status;

  /// 업로더 이름
  @override
  final String? platformUploader;

  /// 캡션
  @override
  final String? caption;

  /// 썸네일 URL
  @override
  final String? thumbnailUrl;

  /// 원본 SNS URL
  @override
  final String? originalUrl;

  /// 제목
  @override
  final String? title;

  /// 요약 설명
  @override
  final String? summary;

  /// 마지막 확인 시각
  @override
  final String? lastCheckedAt;

  @override
  String toString() {
    return 'ContentInfo(id: $id, platform: $platform, status: $status, platformUploader: $platformUploader, caption: $caption, thumbnailUrl: $thumbnailUrl, originalUrl: $originalUrl, title: $title, summary: $summary, lastCheckedAt: $lastCheckedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.platformUploader, platformUploader) ||
                other.platformUploader == platformUploader) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.originalUrl, originalUrl) ||
                other.originalUrl == originalUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.lastCheckedAt, lastCheckedAt) ||
                other.lastCheckedAt == lastCheckedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    platform,
    status,
    platformUploader,
    caption,
    thumbnailUrl,
    originalUrl,
    title,
    summary,
    lastCheckedAt,
  );

  /// Create a copy of ContentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentInfoImplCopyWith<_$ContentInfoImpl> get copyWith =>
      __$$ContentInfoImplCopyWithImpl<_$ContentInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentInfoImplToJson(this);
  }
}

abstract class _ContentInfo implements ContentInfo {
  const factory _ContentInfo({
    required final String id,
    final String? platform,
    required final String status,
    final String? platformUploader,
    final String? caption,
    final String? thumbnailUrl,
    final String? originalUrl,
    final String? title,
    final String? summary,
    final String? lastCheckedAt,
  }) = _$ContentInfoImpl;

  factory _ContentInfo.fromJson(Map<String, dynamic> json) =
      _$ContentInfoImpl.fromJson;

  /// 콘텐츠 ID (UUID)
  @override
  String get id;

  /// 플랫폼 유형 (INSTAGRAM, YOUTUBE 등)
  @override
  String? get platform;

  /// 처리 상태 (PENDING, ANALYZING, COMPLETED, FAILED, DELETED)
  @override
  String get status;

  /// 업로더 이름
  @override
  String? get platformUploader;

  /// 캡션
  @override
  String? get caption;

  /// 썸네일 URL
  @override
  String? get thumbnailUrl;

  /// 원본 SNS URL
  @override
  String? get originalUrl;

  /// 제목
  @override
  String? get title;

  /// 요약 설명
  @override
  String? get summary;

  /// 마지막 확인 시각
  @override
  String? get lastCheckedAt;

  /// Create a copy of ContentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentInfoImplCopyWith<_$ContentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
