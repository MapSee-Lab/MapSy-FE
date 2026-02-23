// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_folder_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateFolderRequest _$UpdateFolderRequestFromJson(Map<String, dynamic> json) {
  return _UpdateFolderRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateFolderRequest {
  /// 폴더 이름 (선택)
  String? get name => throw _privateConstructorUsedError;

  /// 공개 설정 (선택)
  String? get visibility => throw _privateConstructorUsedError;

  /// Serializes this UpdateFolderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateFolderRequestCopyWith<UpdateFolderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateFolderRequestCopyWith<$Res> {
  factory $UpdateFolderRequestCopyWith(
    UpdateFolderRequest value,
    $Res Function(UpdateFolderRequest) then,
  ) = _$UpdateFolderRequestCopyWithImpl<$Res, UpdateFolderRequest>;
  @useResult
  $Res call({String? name, String? visibility});
}

/// @nodoc
class _$UpdateFolderRequestCopyWithImpl<$Res, $Val extends UpdateFolderRequest>
    implements $UpdateFolderRequestCopyWith<$Res> {
  _$UpdateFolderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? visibility = freezed}) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            visibility: freezed == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateFolderRequestImplCopyWith<$Res>
    implements $UpdateFolderRequestCopyWith<$Res> {
  factory _$$UpdateFolderRequestImplCopyWith(
    _$UpdateFolderRequestImpl value,
    $Res Function(_$UpdateFolderRequestImpl) then,
  ) = __$$UpdateFolderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? visibility});
}

/// @nodoc
class __$$UpdateFolderRequestImplCopyWithImpl<$Res>
    extends _$UpdateFolderRequestCopyWithImpl<$Res, _$UpdateFolderRequestImpl>
    implements _$$UpdateFolderRequestImplCopyWith<$Res> {
  __$$UpdateFolderRequestImplCopyWithImpl(
    _$UpdateFolderRequestImpl _value,
    $Res Function(_$UpdateFolderRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? visibility = freezed}) {
    return _then(
      _$UpdateFolderRequestImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        visibility: freezed == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateFolderRequestImpl implements _UpdateFolderRequest {
  const _$UpdateFolderRequestImpl({this.name, this.visibility});

  factory _$UpdateFolderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateFolderRequestImplFromJson(json);

  /// 폴더 이름 (선택)
  @override
  final String? name;

  /// 공개 설정 (선택)
  @override
  final String? visibility;

  @override
  String toString() {
    return 'UpdateFolderRequest(name: $name, visibility: $visibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFolderRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, visibility);

  /// Create a copy of UpdateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFolderRequestImplCopyWith<_$UpdateFolderRequestImpl> get copyWith =>
      __$$UpdateFolderRequestImplCopyWithImpl<_$UpdateFolderRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateFolderRequestImplToJson(this);
  }
}

abstract class _UpdateFolderRequest implements UpdateFolderRequest {
  const factory _UpdateFolderRequest({
    final String? name,
    final String? visibility,
  }) = _$UpdateFolderRequestImpl;

  factory _UpdateFolderRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateFolderRequestImpl.fromJson;

  /// 폴더 이름 (선택)
  @override
  String? get name;

  /// 공개 설정 (선택)
  @override
  String? get visibility;

  /// Create a copy of UpdateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateFolderRequestImplCopyWith<_$UpdateFolderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateFolderResponse _$UpdateFolderResponseFromJson(Map<String, dynamic> json) {
  return _UpdateFolderResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateFolderResponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UpdateFolderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateFolderResponseCopyWith<UpdateFolderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateFolderResponseCopyWith<$Res> {
  factory $UpdateFolderResponseCopyWith(
    UpdateFolderResponse value,
    $Res Function(UpdateFolderResponse) then,
  ) = _$UpdateFolderResponseCopyWithImpl<$Res, UpdateFolderResponse>;
  @useResult
  $Res call({
    String id,
    String name,
    String visibility,
    bool isDefault,
    String? updatedAt,
  });
}

/// @nodoc
class _$UpdateFolderResponseCopyWithImpl<
  $Res,
  $Val extends UpdateFolderResponse
>
    implements $UpdateFolderResponseCopyWith<$Res> {
  _$UpdateFolderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? visibility = null,
    Object? isDefault = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as String,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateFolderResponseImplCopyWith<$Res>
    implements $UpdateFolderResponseCopyWith<$Res> {
  factory _$$UpdateFolderResponseImplCopyWith(
    _$UpdateFolderResponseImpl value,
    $Res Function(_$UpdateFolderResponseImpl) then,
  ) = __$$UpdateFolderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String visibility,
    bool isDefault,
    String? updatedAt,
  });
}

/// @nodoc
class __$$UpdateFolderResponseImplCopyWithImpl<$Res>
    extends _$UpdateFolderResponseCopyWithImpl<$Res, _$UpdateFolderResponseImpl>
    implements _$$UpdateFolderResponseImplCopyWith<$Res> {
  __$$UpdateFolderResponseImplCopyWithImpl(
    _$UpdateFolderResponseImpl _value,
    $Res Function(_$UpdateFolderResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? visibility = null,
    Object? isDefault = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UpdateFolderResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as String,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateFolderResponseImpl implements _UpdateFolderResponse {
  const _$UpdateFolderResponseImpl({
    required this.id,
    required this.name,
    required this.visibility,
    this.isDefault = false,
    this.updatedAt,
  });

  factory _$UpdateFolderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateFolderResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String visibility;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'UpdateFolderResponse(id: $id, name: $name, visibility: $visibility, isDefault: $isDefault, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFolderResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, visibility, isDefault, updatedAt);

  /// Create a copy of UpdateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFolderResponseImplCopyWith<_$UpdateFolderResponseImpl>
  get copyWith =>
      __$$UpdateFolderResponseImplCopyWithImpl<_$UpdateFolderResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateFolderResponseImplToJson(this);
  }
}

abstract class _UpdateFolderResponse implements UpdateFolderResponse {
  const factory _UpdateFolderResponse({
    required final String id,
    required final String name,
    required final String visibility,
    final bool isDefault,
    final String? updatedAt,
  }) = _$UpdateFolderResponseImpl;

  factory _UpdateFolderResponse.fromJson(Map<String, dynamic> json) =
      _$UpdateFolderResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get visibility;
  @override
  bool get isDefault;
  @override
  String? get updatedAt;

  /// Create a copy of UpdateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateFolderResponseImplCopyWith<_$UpdateFolderResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
