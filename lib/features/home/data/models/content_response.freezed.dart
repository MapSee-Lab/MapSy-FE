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

ContentItem _$ContentItemFromJson(Map<String, dynamic> json) {
  return _ContentItem.fromJson(json);
}

/// @nodoc
mixin _$ContentItem {
  /// 콘텐츠 ID
  int get contentId => throw _privateConstructorUsedError;

  /// 원본 URL
  String? get sourceUrl => throw _privateConstructorUsedError;

  /// 콘텐츠 상태
  String? get status => throw _privateConstructorUsedError;

  /// 생성일시
  String? get createdAt => throw _privateConstructorUsedError;

  /// 콘텐츠에 포함된 장소 목록
  List<PlaceModel> get places => throw _privateConstructorUsedError;

  /// Serializes this ContentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentItemCopyWith<ContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentItemCopyWith<$Res> {
  factory $ContentItemCopyWith(
    ContentItem value,
    $Res Function(ContentItem) then,
  ) = _$ContentItemCopyWithImpl<$Res, ContentItem>;
  @useResult
  $Res call({
    int contentId,
    String? sourceUrl,
    String? status,
    String? createdAt,
    List<PlaceModel> places,
  });
}

/// @nodoc
class _$ContentItemCopyWithImpl<$Res, $Val extends ContentItem>
    implements $ContentItemCopyWith<$Res> {
  _$ContentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? sourceUrl = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? places = null,
  }) {
    return _then(
      _value.copyWith(
            contentId: null == contentId
                ? _value.contentId
                : contentId // ignore: cast_nullable_to_non_nullable
                      as int,
            sourceUrl: freezed == sourceUrl
                ? _value.sourceUrl
                : sourceUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ContentItemImplCopyWith<$Res>
    implements $ContentItemCopyWith<$Res> {
  factory _$$ContentItemImplCopyWith(
    _$ContentItemImpl value,
    $Res Function(_$ContentItemImpl) then,
  ) = __$$ContentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int contentId,
    String? sourceUrl,
    String? status,
    String? createdAt,
    List<PlaceModel> places,
  });
}

/// @nodoc
class __$$ContentItemImplCopyWithImpl<$Res>
    extends _$ContentItemCopyWithImpl<$Res, _$ContentItemImpl>
    implements _$$ContentItemImplCopyWith<$Res> {
  __$$ContentItemImplCopyWithImpl(
    _$ContentItemImpl _value,
    $Res Function(_$ContentItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? sourceUrl = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? places = null,
  }) {
    return _then(
      _$ContentItemImpl(
        contentId: null == contentId
            ? _value.contentId
            : contentId // ignore: cast_nullable_to_non_nullable
                  as int,
        sourceUrl: freezed == sourceUrl
            ? _value.sourceUrl
            : sourceUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
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
class _$ContentItemImpl implements _ContentItem {
  const _$ContentItemImpl({
    required this.contentId,
    this.sourceUrl,
    this.status,
    this.createdAt,
    final List<PlaceModel> places = const [],
  }) : _places = places;

  factory _$ContentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentItemImplFromJson(json);

  /// 콘텐츠 ID
  @override
  final int contentId;

  /// 원본 URL
  @override
  final String? sourceUrl;

  /// 콘텐츠 상태
  @override
  final String? status;

  /// 생성일시
  @override
  final String? createdAt;

  /// 콘텐츠에 포함된 장소 목록
  final List<PlaceModel> _places;

  /// 콘텐츠에 포함된 장소 목록
  @override
  @JsonKey()
  List<PlaceModel> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'ContentItem(contentId: $contentId, sourceUrl: $sourceUrl, status: $status, createdAt: $createdAt, places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentItemImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    contentId,
    sourceUrl,
    status,
    createdAt,
    const DeepCollectionEquality().hash(_places),
  );

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentItemImplCopyWith<_$ContentItemImpl> get copyWith =>
      __$$ContentItemImplCopyWithImpl<_$ContentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentItemImplToJson(this);
  }
}

abstract class _ContentItem implements ContentItem {
  const factory _ContentItem({
    required final int contentId,
    final String? sourceUrl,
    final String? status,
    final String? createdAt,
    final List<PlaceModel> places,
  }) = _$ContentItemImpl;

  factory _ContentItem.fromJson(Map<String, dynamic> json) =
      _$ContentItemImpl.fromJson;

  /// 콘텐츠 ID
  @override
  int get contentId;

  /// 원본 URL
  @override
  String? get sourceUrl;

  /// 콘텐츠 상태
  @override
  String? get status;

  /// 생성일시
  @override
  String? get createdAt;

  /// 콘텐츠에 포함된 장소 목록
  @override
  List<PlaceModel> get places;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentItemImplCopyWith<_$ContentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentListResponse _$ContentListResponseFromJson(Map<String, dynamic> json) {
  return _ContentListResponse.fromJson(json);
}

/// @nodoc
mixin _$ContentListResponse {
  /// 콘텐츠 아이템 목록
  List<ContentItem> get content => throw _privateConstructorUsedError;

  /// 페이지네이션 정보
  CursorModel? get cursor => throw _privateConstructorUsedError;

  /// Serializes this ContentListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentListResponseCopyWith<ContentListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentListResponseCopyWith<$Res> {
  factory $ContentListResponseCopyWith(
    ContentListResponse value,
    $Res Function(ContentListResponse) then,
  ) = _$ContentListResponseCopyWithImpl<$Res, ContentListResponse>;
  @useResult
  $Res call({List<ContentItem> content, CursorModel? cursor});

  $CursorModelCopyWith<$Res>? get cursor;
}

/// @nodoc
class _$ContentListResponseCopyWithImpl<$Res, $Val extends ContentListResponse>
    implements $ContentListResponseCopyWith<$Res> {
  _$ContentListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? cursor = freezed}) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<ContentItem>,
            cursor: freezed == cursor
                ? _value.cursor
                : cursor // ignore: cast_nullable_to_non_nullable
                      as CursorModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of ContentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CursorModelCopyWith<$Res>? get cursor {
    if (_value.cursor == null) {
      return null;
    }

    return $CursorModelCopyWith<$Res>(_value.cursor!, (value) {
      return _then(_value.copyWith(cursor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentListResponseImplCopyWith<$Res>
    implements $ContentListResponseCopyWith<$Res> {
  factory _$$ContentListResponseImplCopyWith(
    _$ContentListResponseImpl value,
    $Res Function(_$ContentListResponseImpl) then,
  ) = __$$ContentListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ContentItem> content, CursorModel? cursor});

  @override
  $CursorModelCopyWith<$Res>? get cursor;
}

/// @nodoc
class __$$ContentListResponseImplCopyWithImpl<$Res>
    extends _$ContentListResponseCopyWithImpl<$Res, _$ContentListResponseImpl>
    implements _$$ContentListResponseImplCopyWith<$Res> {
  __$$ContentListResponseImplCopyWithImpl(
    _$ContentListResponseImpl _value,
    $Res Function(_$ContentListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? cursor = freezed}) {
    return _then(
      _$ContentListResponseImpl(
        content: null == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<ContentItem>,
        cursor: freezed == cursor
            ? _value.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CursorModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentListResponseImpl implements _ContentListResponse {
  const _$ContentListResponseImpl({
    final List<ContentItem> content = const [],
    this.cursor,
  }) : _content = content;

  factory _$ContentListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentListResponseImplFromJson(json);

  /// 콘텐츠 아이템 목록
  final List<ContentItem> _content;

  /// 콘텐츠 아이템 목록
  @override
  @JsonKey()
  List<ContentItem> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  /// 페이지네이션 정보
  @override
  final CursorModel? cursor;

  @override
  String toString() {
    return 'ContentListResponse(content: $content, cursor: $cursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentListResponseImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.cursor, cursor) || other.cursor == cursor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_content),
    cursor,
  );

  /// Create a copy of ContentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentListResponseImplCopyWith<_$ContentListResponseImpl> get copyWith =>
      __$$ContentListResponseImplCopyWithImpl<_$ContentListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentListResponseImplToJson(this);
  }
}

abstract class _ContentListResponse implements ContentListResponse {
  const factory _ContentListResponse({
    final List<ContentItem> content,
    final CursorModel? cursor,
  }) = _$ContentListResponseImpl;

  factory _ContentListResponse.fromJson(Map<String, dynamic> json) =
      _$ContentListResponseImpl.fromJson;

  /// 콘텐츠 아이템 목록
  @override
  List<ContentItem> get content;

  /// 페이지네이션 정보
  @override
  CursorModel? get cursor;

  /// Create a copy of ContentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentListResponseImplCopyWith<_$ContentListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
