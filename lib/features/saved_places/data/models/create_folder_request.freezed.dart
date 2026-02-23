// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_folder_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateFolderRequest _$CreateFolderRequestFromJson(Map<String, dynamic> json) {
  return _CreateFolderRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateFolderRequest {
  /// 폴더 이름 (최대 100자)
  String get name => throw _privateConstructorUsedError;

  /// 공개 설정 (PRIVATE / SHARED)
  String get visibility => throw _privateConstructorUsedError;

  /// Serializes this CreateFolderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateFolderRequestCopyWith<CreateFolderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFolderRequestCopyWith<$Res> {
  factory $CreateFolderRequestCopyWith(
    CreateFolderRequest value,
    $Res Function(CreateFolderRequest) then,
  ) = _$CreateFolderRequestCopyWithImpl<$Res, CreateFolderRequest>;
  @useResult
  $Res call({String name, String visibility});
}

/// @nodoc
class _$CreateFolderRequestCopyWithImpl<$Res, $Val extends CreateFolderRequest>
    implements $CreateFolderRequestCopyWith<$Res> {
  _$CreateFolderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? visibility = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateFolderRequestImplCopyWith<$Res>
    implements $CreateFolderRequestCopyWith<$Res> {
  factory _$$CreateFolderRequestImplCopyWith(
    _$CreateFolderRequestImpl value,
    $Res Function(_$CreateFolderRequestImpl) then,
  ) = __$$CreateFolderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String visibility});
}

/// @nodoc
class __$$CreateFolderRequestImplCopyWithImpl<$Res>
    extends _$CreateFolderRequestCopyWithImpl<$Res, _$CreateFolderRequestImpl>
    implements _$$CreateFolderRequestImplCopyWith<$Res> {
  __$$CreateFolderRequestImplCopyWithImpl(
    _$CreateFolderRequestImpl _value,
    $Res Function(_$CreateFolderRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? visibility = null}) {
    return _then(
      _$CreateFolderRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFolderRequestImpl implements _CreateFolderRequest {
  const _$CreateFolderRequestImpl({
    required this.name,
    this.visibility = 'PRIVATE',
  });

  factory _$CreateFolderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFolderRequestImplFromJson(json);

  /// 폴더 이름 (최대 100자)
  @override
  final String name;

  /// 공개 설정 (PRIVATE / SHARED)
  @override
  @JsonKey()
  final String visibility;

  @override
  String toString() {
    return 'CreateFolderRequest(name: $name, visibility: $visibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFolderRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, visibility);

  /// Create a copy of CreateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFolderRequestImplCopyWith<_$CreateFolderRequestImpl> get copyWith =>
      __$$CreateFolderRequestImplCopyWithImpl<_$CreateFolderRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFolderRequestImplToJson(this);
  }
}

abstract class _CreateFolderRequest implements CreateFolderRequest {
  const factory _CreateFolderRequest({
    required final String name,
    final String visibility,
  }) = _$CreateFolderRequestImpl;

  factory _CreateFolderRequest.fromJson(Map<String, dynamic> json) =
      _$CreateFolderRequestImpl.fromJson;

  /// 폴더 이름 (최대 100자)
  @override
  String get name;

  /// 공개 설정 (PRIVATE / SHARED)
  @override
  String get visibility;

  /// Create a copy of CreateFolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFolderRequestImplCopyWith<_$CreateFolderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateFolderResponse _$CreateFolderResponseFromJson(Map<String, dynamic> json) {
  return _CreateFolderResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateFolderResponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CreateFolderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateFolderResponseCopyWith<CreateFolderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFolderResponseCopyWith<$Res> {
  factory $CreateFolderResponseCopyWith(
    CreateFolderResponse value,
    $Res Function(CreateFolderResponse) then,
  ) = _$CreateFolderResponseCopyWithImpl<$Res, CreateFolderResponse>;
  @useResult
  $Res call({
    String id,
    String name,
    String visibility,
    bool isDefault,
    String? createdAt,
  });
}

/// @nodoc
class _$CreateFolderResponseCopyWithImpl<
  $Res,
  $Val extends CreateFolderResponse
>
    implements $CreateFolderResponseCopyWith<$Res> {
  _$CreateFolderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? visibility = null,
    Object? isDefault = null,
    Object? createdAt = freezed,
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
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateFolderResponseImplCopyWith<$Res>
    implements $CreateFolderResponseCopyWith<$Res> {
  factory _$$CreateFolderResponseImplCopyWith(
    _$CreateFolderResponseImpl value,
    $Res Function(_$CreateFolderResponseImpl) then,
  ) = __$$CreateFolderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String visibility,
    bool isDefault,
    String? createdAt,
  });
}

/// @nodoc
class __$$CreateFolderResponseImplCopyWithImpl<$Res>
    extends _$CreateFolderResponseCopyWithImpl<$Res, _$CreateFolderResponseImpl>
    implements _$$CreateFolderResponseImplCopyWith<$Res> {
  __$$CreateFolderResponseImplCopyWithImpl(
    _$CreateFolderResponseImpl _value,
    $Res Function(_$CreateFolderResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? visibility = null,
    Object? isDefault = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$CreateFolderResponseImpl(
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
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFolderResponseImpl implements _CreateFolderResponse {
  const _$CreateFolderResponseImpl({
    required this.id,
    required this.name,
    required this.visibility,
    this.isDefault = false,
    this.createdAt,
  });

  factory _$CreateFolderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFolderResponseImplFromJson(json);

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
  final String? createdAt;

  @override
  String toString() {
    return 'CreateFolderResponse(id: $id, name: $name, visibility: $visibility, isDefault: $isDefault, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFolderResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, visibility, isDefault, createdAt);

  /// Create a copy of CreateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFolderResponseImplCopyWith<_$CreateFolderResponseImpl>
  get copyWith =>
      __$$CreateFolderResponseImplCopyWithImpl<_$CreateFolderResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFolderResponseImplToJson(this);
  }
}

abstract class _CreateFolderResponse implements CreateFolderResponse {
  const factory _CreateFolderResponse({
    required final String id,
    required final String name,
    required final String visibility,
    final bool isDefault,
    final String? createdAt,
  }) = _$CreateFolderResponseImpl;

  factory _CreateFolderResponse.fromJson(Map<String, dynamic> json) =
      _$CreateFolderResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get visibility;
  @override
  bool get isDefault;
  @override
  String? get createdAt;

  /// Create a copy of CreateFolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFolderResponseImplCopyWith<_$CreateFolderResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
