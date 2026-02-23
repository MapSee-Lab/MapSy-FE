// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContentItemModel _$ContentItemModelFromJson(Map<String, dynamic> json) {
  return _ContentItemModel.fromJson(json);
}

/// @nodoc
mixin _$ContentItemModel {
  /// 콘텐츠 ID (UUID)
  String get id => throw _privateConstructorUsedError;

  /// 플랫폼 유형 (INSTAGRAM, YOUTUBE 등)
  String? get platform => throw _privateConstructorUsedError;

  /// 처리 상태 (PENDING, ANALYZING, COMPLETED, FAILED, DELETED)
  String? get status => throw _privateConstructorUsedError;

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

  /// Serializes this ContentItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentItemModelCopyWith<ContentItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentItemModelCopyWith<$Res> {
  factory $ContentItemModelCopyWith(
    ContentItemModel value,
    $Res Function(ContentItemModel) then,
  ) = _$ContentItemModelCopyWithImpl<$Res, ContentItemModel>;
  @useResult
  $Res call({
    String id,
    String? platform,
    String? status,
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
class _$ContentItemModelCopyWithImpl<$Res, $Val extends ContentItemModel>
    implements $ContentItemModelCopyWith<$Res> {
  _$ContentItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? platform = freezed,
    Object? status = freezed,
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
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$ContentItemModelImplCopyWith<$Res>
    implements $ContentItemModelCopyWith<$Res> {
  factory _$$ContentItemModelImplCopyWith(
    _$ContentItemModelImpl value,
    $Res Function(_$ContentItemModelImpl) then,
  ) = __$$ContentItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? platform,
    String? status,
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
class __$$ContentItemModelImplCopyWithImpl<$Res>
    extends _$ContentItemModelCopyWithImpl<$Res, _$ContentItemModelImpl>
    implements _$$ContentItemModelImplCopyWith<$Res> {
  __$$ContentItemModelImplCopyWithImpl(
    _$ContentItemModelImpl _value,
    $Res Function(_$ContentItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? platform = freezed,
    Object? status = freezed,
    Object? platformUploader = freezed,
    Object? caption = freezed,
    Object? thumbnailUrl = freezed,
    Object? originalUrl = freezed,
    Object? title = freezed,
    Object? summary = freezed,
    Object? lastCheckedAt = freezed,
  }) {
    return _then(
      _$ContentItemModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: freezed == platform
            ? _value.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$ContentItemModelImpl implements _ContentItemModel {
  const _$ContentItemModelImpl({
    required this.id,
    this.platform,
    this.status,
    this.platformUploader,
    this.caption,
    this.thumbnailUrl,
    this.originalUrl,
    this.title,
    this.summary,
    this.lastCheckedAt,
  });

  factory _$ContentItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentItemModelImplFromJson(json);

  /// 콘텐츠 ID (UUID)
  @override
  final String id;

  /// 플랫폼 유형 (INSTAGRAM, YOUTUBE 등)
  @override
  final String? platform;

  /// 처리 상태 (PENDING, ANALYZING, COMPLETED, FAILED, DELETED)
  @override
  final String? status;

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
    return 'ContentItemModel(id: $id, platform: $platform, status: $status, platformUploader: $platformUploader, caption: $caption, thumbnailUrl: $thumbnailUrl, originalUrl: $originalUrl, title: $title, summary: $summary, lastCheckedAt: $lastCheckedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentItemModelImpl &&
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

  /// Create a copy of ContentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentItemModelImplCopyWith<_$ContentItemModelImpl> get copyWith =>
      __$$ContentItemModelImplCopyWithImpl<_$ContentItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentItemModelImplToJson(this);
  }
}

abstract class _ContentItemModel implements ContentItemModel {
  const factory _ContentItemModel({
    required final String id,
    final String? platform,
    final String? status,
    final String? platformUploader,
    final String? caption,
    final String? thumbnailUrl,
    final String? originalUrl,
    final String? title,
    final String? summary,
    final String? lastCheckedAt,
  }) = _$ContentItemModelImpl;

  factory _ContentItemModel.fromJson(Map<String, dynamic> json) =
      _$ContentItemModelImpl.fromJson;

  /// 콘텐츠 ID (UUID)
  @override
  String get id;

  /// 플랫폼 유형 (INSTAGRAM, YOUTUBE 등)
  @override
  String? get platform;

  /// 처리 상태 (PENDING, ANALYZING, COMPLETED, FAILED, DELETED)
  @override
  String? get status;

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

  /// Create a copy of ContentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentItemModelImplCopyWith<_$ContentItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentContentResponse _$RecentContentResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RecentContentResponse.fromJson(json);
}

/// @nodoc
mixin _$RecentContentResponse {
  List<ContentItemModel> get contents => throw _privateConstructorUsedError;

  /// Serializes this RecentContentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentContentResponseCopyWith<RecentContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentContentResponseCopyWith<$Res> {
  factory $RecentContentResponseCopyWith(
    RecentContentResponse value,
    $Res Function(RecentContentResponse) then,
  ) = _$RecentContentResponseCopyWithImpl<$Res, RecentContentResponse>;
  @useResult
  $Res call({List<ContentItemModel> contents});
}

/// @nodoc
class _$RecentContentResponseCopyWithImpl<
  $Res,
  $Val extends RecentContentResponse
>
    implements $RecentContentResponseCopyWith<$Res> {
  _$RecentContentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? contents = null}) {
    return _then(
      _value.copyWith(
            contents: null == contents
                ? _value.contents
                : contents // ignore: cast_nullable_to_non_nullable
                      as List<ContentItemModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecentContentResponseImplCopyWith<$Res>
    implements $RecentContentResponseCopyWith<$Res> {
  factory _$$RecentContentResponseImplCopyWith(
    _$RecentContentResponseImpl value,
    $Res Function(_$RecentContentResponseImpl) then,
  ) = __$$RecentContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ContentItemModel> contents});
}

/// @nodoc
class __$$RecentContentResponseImplCopyWithImpl<$Res>
    extends
        _$RecentContentResponseCopyWithImpl<$Res, _$RecentContentResponseImpl>
    implements _$$RecentContentResponseImplCopyWith<$Res> {
  __$$RecentContentResponseImplCopyWithImpl(
    _$RecentContentResponseImpl _value,
    $Res Function(_$RecentContentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecentContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? contents = null}) {
    return _then(
      _$RecentContentResponseImpl(
        contents: null == contents
            ? _value._contents
            : contents // ignore: cast_nullable_to_non_nullable
                  as List<ContentItemModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentContentResponseImpl implements _RecentContentResponse {
  const _$RecentContentResponseImpl({
    final List<ContentItemModel> contents = const [],
  }) : _contents = contents;

  factory _$RecentContentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentContentResponseImplFromJson(json);

  final List<ContentItemModel> _contents;
  @override
  @JsonKey()
  List<ContentItemModel> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  String toString() {
    return 'RecentContentResponse(contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentContentResponseImpl &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_contents));

  /// Create a copy of RecentContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentContentResponseImplCopyWith<_$RecentContentResponseImpl>
  get copyWith =>
      __$$RecentContentResponseImplCopyWithImpl<_$RecentContentResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentContentResponseImplToJson(this);
  }
}

abstract class _RecentContentResponse implements RecentContentResponse {
  const factory _RecentContentResponse({
    final List<ContentItemModel> contents,
  }) = _$RecentContentResponseImpl;

  factory _RecentContentResponse.fromJson(Map<String, dynamic> json) =
      _$RecentContentResponseImpl.fromJson;

  @override
  List<ContentItemModel> get contents;

  /// Create a copy of RecentContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentContentResponseImplCopyWith<_$RecentContentResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MemberContentPageResponse _$MemberContentPageResponseFromJson(
  Map<String, dynamic> json,
) {
  return _MemberContentPageResponse.fromJson(json);
}

/// @nodoc
mixin _$MemberContentPageResponse {
  ContentPage get contentPage => throw _privateConstructorUsedError;

  /// Serializes this MemberContentPageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberContentPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberContentPageResponseCopyWith<MemberContentPageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberContentPageResponseCopyWith<$Res> {
  factory $MemberContentPageResponseCopyWith(
    MemberContentPageResponse value,
    $Res Function(MemberContentPageResponse) then,
  ) = _$MemberContentPageResponseCopyWithImpl<$Res, MemberContentPageResponse>;
  @useResult
  $Res call({ContentPage contentPage});

  $ContentPageCopyWith<$Res> get contentPage;
}

/// @nodoc
class _$MemberContentPageResponseCopyWithImpl<
  $Res,
  $Val extends MemberContentPageResponse
>
    implements $MemberContentPageResponseCopyWith<$Res> {
  _$MemberContentPageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberContentPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? contentPage = null}) {
    return _then(
      _value.copyWith(
            contentPage: null == contentPage
                ? _value.contentPage
                : contentPage // ignore: cast_nullable_to_non_nullable
                      as ContentPage,
          )
          as $Val,
    );
  }

  /// Create a copy of MemberContentPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentPageCopyWith<$Res> get contentPage {
    return $ContentPageCopyWith<$Res>(_value.contentPage, (value) {
      return _then(_value.copyWith(contentPage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemberContentPageResponseImplCopyWith<$Res>
    implements $MemberContentPageResponseCopyWith<$Res> {
  factory _$$MemberContentPageResponseImplCopyWith(
    _$MemberContentPageResponseImpl value,
    $Res Function(_$MemberContentPageResponseImpl) then,
  ) = __$$MemberContentPageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContentPage contentPage});

  @override
  $ContentPageCopyWith<$Res> get contentPage;
}

/// @nodoc
class __$$MemberContentPageResponseImplCopyWithImpl<$Res>
    extends
        _$MemberContentPageResponseCopyWithImpl<
          $Res,
          _$MemberContentPageResponseImpl
        >
    implements _$$MemberContentPageResponseImplCopyWith<$Res> {
  __$$MemberContentPageResponseImplCopyWithImpl(
    _$MemberContentPageResponseImpl _value,
    $Res Function(_$MemberContentPageResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberContentPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? contentPage = null}) {
    return _then(
      _$MemberContentPageResponseImpl(
        contentPage: null == contentPage
            ? _value.contentPage
            : contentPage // ignore: cast_nullable_to_non_nullable
                  as ContentPage,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberContentPageResponseImpl implements _MemberContentPageResponse {
  const _$MemberContentPageResponseImpl({required this.contentPage});

  factory _$MemberContentPageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberContentPageResponseImplFromJson(json);

  @override
  final ContentPage contentPage;

  @override
  String toString() {
    return 'MemberContentPageResponse(contentPage: $contentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberContentPageResponseImpl &&
            (identical(other.contentPage, contentPage) ||
                other.contentPage == contentPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, contentPage);

  /// Create a copy of MemberContentPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberContentPageResponseImplCopyWith<_$MemberContentPageResponseImpl>
  get copyWith =>
      __$$MemberContentPageResponseImplCopyWithImpl<
        _$MemberContentPageResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberContentPageResponseImplToJson(this);
  }
}

abstract class _MemberContentPageResponse implements MemberContentPageResponse {
  const factory _MemberContentPageResponse({
    required final ContentPage contentPage,
  }) = _$MemberContentPageResponseImpl;

  factory _MemberContentPageResponse.fromJson(Map<String, dynamic> json) =
      _$MemberContentPageResponseImpl.fromJson;

  @override
  ContentPage get contentPage;

  /// Create a copy of MemberContentPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberContentPageResponseImplCopyWith<_$MemberContentPageResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ContentPage _$ContentPageFromJson(Map<String, dynamic> json) {
  return _ContentPage.fromJson(json);
}

/// @nodoc
mixin _$ContentPage {
  List<ContentItemModel> get content => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  bool get first => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;
  bool get empty => throw _privateConstructorUsedError;

  /// Serializes this ContentPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentPageCopyWith<ContentPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentPageCopyWith<$Res> {
  factory $ContentPageCopyWith(
    ContentPage value,
    $Res Function(ContentPage) then,
  ) = _$ContentPageCopyWithImpl<$Res, ContentPage>;
  @useResult
  $Res call({
    List<ContentItemModel> content,
    int totalElements,
    int totalPages,
    int size,
    int number,
    bool first,
    bool last,
    bool empty,
  });
}

/// @nodoc
class _$ContentPageCopyWithImpl<$Res, $Val extends ContentPage>
    implements $ContentPageCopyWith<$Res> {
  _$ContentPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? size = null,
    Object? number = null,
    Object? first = null,
    Object? last = null,
    Object? empty = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<ContentItemModel>,
            totalElements: null == totalElements
                ? _value.totalElements
                : totalElements // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            first: null == first
                ? _value.first
                : first // ignore: cast_nullable_to_non_nullable
                      as bool,
            last: null == last
                ? _value.last
                : last // ignore: cast_nullable_to_non_nullable
                      as bool,
            empty: null == empty
                ? _value.empty
                : empty // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContentPageImplCopyWith<$Res>
    implements $ContentPageCopyWith<$Res> {
  factory _$$ContentPageImplCopyWith(
    _$ContentPageImpl value,
    $Res Function(_$ContentPageImpl) then,
  ) = __$$ContentPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ContentItemModel> content,
    int totalElements,
    int totalPages,
    int size,
    int number,
    bool first,
    bool last,
    bool empty,
  });
}

/// @nodoc
class __$$ContentPageImplCopyWithImpl<$Res>
    extends _$ContentPageCopyWithImpl<$Res, _$ContentPageImpl>
    implements _$$ContentPageImplCopyWith<$Res> {
  __$$ContentPageImplCopyWithImpl(
    _$ContentPageImpl _value,
    $Res Function(_$ContentPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContentPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? size = null,
    Object? number = null,
    Object? first = null,
    Object? last = null,
    Object? empty = null,
  }) {
    return _then(
      _$ContentPageImpl(
        content: null == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<ContentItemModel>,
        totalElements: null == totalElements
            ? _value.totalElements
            : totalElements // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        first: null == first
            ? _value.first
            : first // ignore: cast_nullable_to_non_nullable
                  as bool,
        last: null == last
            ? _value.last
            : last // ignore: cast_nullable_to_non_nullable
                  as bool,
        empty: null == empty
            ? _value.empty
            : empty // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentPageImpl implements _ContentPage {
  const _$ContentPageImpl({
    final List<ContentItemModel> content = const [],
    this.totalElements = 0,
    this.totalPages = 0,
    this.size = 0,
    this.number = 0,
    this.first = true,
    this.last = true,
    this.empty = true,
  }) : _content = content;

  factory _$ContentPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentPageImplFromJson(json);

  final List<ContentItemModel> _content;
  @override
  @JsonKey()
  List<ContentItemModel> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  @JsonKey()
  final int totalElements;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int number;
  @override
  @JsonKey()
  final bool first;
  @override
  @JsonKey()
  final bool last;
  @override
  @JsonKey()
  final bool empty;

  @override
  String toString() {
    return 'ContentPage(content: $content, totalElements: $totalElements, totalPages: $totalPages, size: $size, number: $number, first: $first, last: $last, empty: $empty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentPageImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_content),
    totalElements,
    totalPages,
    size,
    number,
    first,
    last,
    empty,
  );

  /// Create a copy of ContentPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentPageImplCopyWith<_$ContentPageImpl> get copyWith =>
      __$$ContentPageImplCopyWithImpl<_$ContentPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentPageImplToJson(this);
  }
}

abstract class _ContentPage implements ContentPage {
  const factory _ContentPage({
    final List<ContentItemModel> content,
    final int totalElements,
    final int totalPages,
    final int size,
    final int number,
    final bool first,
    final bool last,
    final bool empty,
  }) = _$ContentPageImpl;

  factory _ContentPage.fromJson(Map<String, dynamic> json) =
      _$ContentPageImpl.fromJson;

  @override
  List<ContentItemModel> get content;
  @override
  int get totalElements;
  @override
  int get totalPages;
  @override
  int get size;
  @override
  int get number;
  @override
  bool get first;
  @override
  bool get last;
  @override
  bool get empty;

  /// Create a copy of ContentPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentPageImplCopyWith<_$ContentPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
