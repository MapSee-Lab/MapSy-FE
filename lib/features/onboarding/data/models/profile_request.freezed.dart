// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileRequest _$ProfileRequestFromJson(Map<String, dynamic> json) {
  return _ProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$ProfileRequest {
  /// 닉네임
  String get name => throw _privateConstructorUsedError;

  /// 성별 (MALE, FEMALE, NOT_SELECTED)
  Gender? get gender => throw _privateConstructorUsedError;

  /// 생년월일 (YYYY-MM-DD 형식)
  String? get birthDate => throw _privateConstructorUsedError;

  /// Serializes this ProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileRequestCopyWith<ProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileRequestCopyWith<$Res> {
  factory $ProfileRequestCopyWith(
    ProfileRequest value,
    $Res Function(ProfileRequest) then,
  ) = _$ProfileRequestCopyWithImpl<$Res, ProfileRequest>;
  @useResult
  $Res call({String name, Gender? gender, String? birthDate});
}

/// @nodoc
class _$ProfileRequestCopyWithImpl<$Res, $Val extends ProfileRequest>
    implements $ProfileRequestCopyWith<$Res> {
  _$ProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gender = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as Gender?,
            birthDate: freezed == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileRequestImplCopyWith<$Res>
    implements $ProfileRequestCopyWith<$Res> {
  factory _$$ProfileRequestImplCopyWith(
    _$ProfileRequestImpl value,
    $Res Function(_$ProfileRequestImpl) then,
  ) = __$$ProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Gender? gender, String? birthDate});
}

/// @nodoc
class __$$ProfileRequestImplCopyWithImpl<$Res>
    extends _$ProfileRequestCopyWithImpl<$Res, _$ProfileRequestImpl>
    implements _$$ProfileRequestImplCopyWith<$Res> {
  __$$ProfileRequestImplCopyWithImpl(
    _$ProfileRequestImpl _value,
    $Res Function(_$ProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gender = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(
      _$ProfileRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as Gender?,
        birthDate: freezed == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileRequestImpl implements _ProfileRequest {
  const _$ProfileRequestImpl({required this.name, this.gender, this.birthDate});

  factory _$ProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileRequestImplFromJson(json);

  /// 닉네임
  @override
  final String name;

  /// 성별 (MALE, FEMALE, NOT_SELECTED)
  @override
  final Gender? gender;

  /// 생년월일 (YYYY-MM-DD 형식)
  @override
  final String? birthDate;

  @override
  String toString() {
    return 'ProfileRequest(name: $name, gender: $gender, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, gender, birthDate);

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileRequestImplCopyWith<_$ProfileRequestImpl> get copyWith =>
      __$$ProfileRequestImplCopyWithImpl<_$ProfileRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileRequestImplToJson(this);
  }
}

abstract class _ProfileRequest implements ProfileRequest {
  const factory _ProfileRequest({
    required final String name,
    final Gender? gender,
    final String? birthDate,
  }) = _$ProfileRequestImpl;

  factory _ProfileRequest.fromJson(Map<String, dynamic> json) =
      _$ProfileRequestImpl.fromJson;

  /// 닉네임
  @override
  String get name;

  /// 성별 (MALE, FEMALE, NOT_SELECTED)
  @override
  Gender? get gender;

  /// 생년월일 (YYYY-MM-DD 형식)
  @override
  String? get birthDate;

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileRequestImplCopyWith<_$ProfileRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckNameResponse _$CheckNameResponseFromJson(Map<String, dynamic> json) {
  return _CheckNameResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckNameResponse {
  /// 사용 가능 여부
  bool get isAvailable => throw _privateConstructorUsedError;

  /// 확인한 닉네임
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this CheckNameResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckNameResponseCopyWith<CheckNameResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckNameResponseCopyWith<$Res> {
  factory $CheckNameResponseCopyWith(
    CheckNameResponse value,
    $Res Function(CheckNameResponse) then,
  ) = _$CheckNameResponseCopyWithImpl<$Res, CheckNameResponse>;
  @useResult
  $Res call({bool isAvailable, String? name});
}

/// @nodoc
class _$CheckNameResponseCopyWithImpl<$Res, $Val extends CheckNameResponse>
    implements $CheckNameResponseCopyWith<$Res> {
  _$CheckNameResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isAvailable = null, Object? name = freezed}) {
    return _then(
      _value.copyWith(
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckNameResponseImplCopyWith<$Res>
    implements $CheckNameResponseCopyWith<$Res> {
  factory _$$CheckNameResponseImplCopyWith(
    _$CheckNameResponseImpl value,
    $Res Function(_$CheckNameResponseImpl) then,
  ) = __$$CheckNameResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAvailable, String? name});
}

/// @nodoc
class __$$CheckNameResponseImplCopyWithImpl<$Res>
    extends _$CheckNameResponseCopyWithImpl<$Res, _$CheckNameResponseImpl>
    implements _$$CheckNameResponseImplCopyWith<$Res> {
  __$$CheckNameResponseImplCopyWithImpl(
    _$CheckNameResponseImpl _value,
    $Res Function(_$CheckNameResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isAvailable = null, Object? name = freezed}) {
    return _then(
      _$CheckNameResponseImpl(
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckNameResponseImpl implements _CheckNameResponse {
  const _$CheckNameResponseImpl({required this.isAvailable, this.name});

  factory _$CheckNameResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckNameResponseImplFromJson(json);

  /// 사용 가능 여부
  @override
  final bool isAvailable;

  /// 확인한 닉네임
  @override
  final String? name;

  @override
  String toString() {
    return 'CheckNameResponse(isAvailable: $isAvailable, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckNameResponseImpl &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isAvailable, name);

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckNameResponseImplCopyWith<_$CheckNameResponseImpl> get copyWith =>
      __$$CheckNameResponseImplCopyWithImpl<_$CheckNameResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckNameResponseImplToJson(this);
  }
}

abstract class _CheckNameResponse implements CheckNameResponse {
  const factory _CheckNameResponse({
    required final bool isAvailable,
    final String? name,
  }) = _$CheckNameResponseImpl;

  factory _CheckNameResponse.fromJson(Map<String, dynamic> json) =
      _$CheckNameResponseImpl.fromJson;

  /// 사용 가능 여부
  @override
  bool get isAvailable;

  /// 확인한 닉네임
  @override
  String? get name;

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckNameResponseImplCopyWith<_$CheckNameResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
