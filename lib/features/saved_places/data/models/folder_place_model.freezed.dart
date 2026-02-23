// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GetFolderPlacesResponse _$GetFolderPlacesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _GetFolderPlacesResponse.fromJson(json);
}

/// @nodoc
mixin _$GetFolderPlacesResponse {
  String get folderId => throw _privateConstructorUsedError;
  String get folderName => throw _privateConstructorUsedError;
  List<PlaceModel> get places => throw _privateConstructorUsedError;

  /// Serializes this GetFolderPlacesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetFolderPlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetFolderPlacesResponseCopyWith<GetFolderPlacesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFolderPlacesResponseCopyWith<$Res> {
  factory $GetFolderPlacesResponseCopyWith(
    GetFolderPlacesResponse value,
    $Res Function(GetFolderPlacesResponse) then,
  ) = _$GetFolderPlacesResponseCopyWithImpl<$Res, GetFolderPlacesResponse>;
  @useResult
  $Res call({String folderId, String folderName, List<PlaceModel> places});
}

/// @nodoc
class _$GetFolderPlacesResponseCopyWithImpl<
  $Res,
  $Val extends GetFolderPlacesResponse
>
    implements $GetFolderPlacesResponseCopyWith<$Res> {
  _$GetFolderPlacesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetFolderPlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderId = null,
    Object? folderName = null,
    Object? places = null,
  }) {
    return _then(
      _value.copyWith(
            folderId: null == folderId
                ? _value.folderId
                : folderId // ignore: cast_nullable_to_non_nullable
                      as String,
            folderName: null == folderName
                ? _value.folderName
                : folderName // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$GetFolderPlacesResponseImplCopyWith<$Res>
    implements $GetFolderPlacesResponseCopyWith<$Res> {
  factory _$$GetFolderPlacesResponseImplCopyWith(
    _$GetFolderPlacesResponseImpl value,
    $Res Function(_$GetFolderPlacesResponseImpl) then,
  ) = __$$GetFolderPlacesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String folderId, String folderName, List<PlaceModel> places});
}

/// @nodoc
class __$$GetFolderPlacesResponseImplCopyWithImpl<$Res>
    extends
        _$GetFolderPlacesResponseCopyWithImpl<
          $Res,
          _$GetFolderPlacesResponseImpl
        >
    implements _$$GetFolderPlacesResponseImplCopyWith<$Res> {
  __$$GetFolderPlacesResponseImplCopyWithImpl(
    _$GetFolderPlacesResponseImpl _value,
    $Res Function(_$GetFolderPlacesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetFolderPlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderId = null,
    Object? folderName = null,
    Object? places = null,
  }) {
    return _then(
      _$GetFolderPlacesResponseImpl(
        folderId: null == folderId
            ? _value.folderId
            : folderId // ignore: cast_nullable_to_non_nullable
                  as String,
        folderName: null == folderName
            ? _value.folderName
            : folderName // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$GetFolderPlacesResponseImpl implements _GetFolderPlacesResponse {
  const _$GetFolderPlacesResponseImpl({
    required this.folderId,
    required this.folderName,
    final List<PlaceModel> places = const [],
  }) : _places = places;

  factory _$GetFolderPlacesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFolderPlacesResponseImplFromJson(json);

  @override
  final String folderId;
  @override
  final String folderName;
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
    return 'GetFolderPlacesResponse(folderId: $folderId, folderName: $folderName, places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFolderPlacesResponseImpl &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    folderId,
    folderName,
    const DeepCollectionEquality().hash(_places),
  );

  /// Create a copy of GetFolderPlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFolderPlacesResponseImplCopyWith<_$GetFolderPlacesResponseImpl>
  get copyWith =>
      __$$GetFolderPlacesResponseImplCopyWithImpl<
        _$GetFolderPlacesResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFolderPlacesResponseImplToJson(this);
  }
}

abstract class _GetFolderPlacesResponse implements GetFolderPlacesResponse {
  const factory _GetFolderPlacesResponse({
    required final String folderId,
    required final String folderName,
    final List<PlaceModel> places,
  }) = _$GetFolderPlacesResponseImpl;

  factory _GetFolderPlacesResponse.fromJson(Map<String, dynamic> json) =
      _$GetFolderPlacesResponseImpl.fromJson;

  @override
  String get folderId;
  @override
  String get folderName;
  @override
  List<PlaceModel> get places;

  /// Create a copy of GetFolderPlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFolderPlacesResponseImplCopyWith<_$GetFolderPlacesResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AddFolderPlaceRequest _$AddFolderPlaceRequestFromJson(
  Map<String, dynamic> json,
) {
  return _AddFolderPlaceRequest.fromJson(json);
}

/// @nodoc
mixin _$AddFolderPlaceRequest {
  String get placeId => throw _privateConstructorUsedError;

  /// Serializes this AddFolderPlaceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddFolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddFolderPlaceRequestCopyWith<AddFolderPlaceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFolderPlaceRequestCopyWith<$Res> {
  factory $AddFolderPlaceRequestCopyWith(
    AddFolderPlaceRequest value,
    $Res Function(AddFolderPlaceRequest) then,
  ) = _$AddFolderPlaceRequestCopyWithImpl<$Res, AddFolderPlaceRequest>;
  @useResult
  $Res call({String placeId});
}

/// @nodoc
class _$AddFolderPlaceRequestCopyWithImpl<
  $Res,
  $Val extends AddFolderPlaceRequest
>
    implements $AddFolderPlaceRequestCopyWith<$Res> {
  _$AddFolderPlaceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddFolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? placeId = null}) {
    return _then(
      _value.copyWith(
            placeId: null == placeId
                ? _value.placeId
                : placeId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddFolderPlaceRequestImplCopyWith<$Res>
    implements $AddFolderPlaceRequestCopyWith<$Res> {
  factory _$$AddFolderPlaceRequestImplCopyWith(
    _$AddFolderPlaceRequestImpl value,
    $Res Function(_$AddFolderPlaceRequestImpl) then,
  ) = __$$AddFolderPlaceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String placeId});
}

/// @nodoc
class __$$AddFolderPlaceRequestImplCopyWithImpl<$Res>
    extends
        _$AddFolderPlaceRequestCopyWithImpl<$Res, _$AddFolderPlaceRequestImpl>
    implements _$$AddFolderPlaceRequestImplCopyWith<$Res> {
  __$$AddFolderPlaceRequestImplCopyWithImpl(
    _$AddFolderPlaceRequestImpl _value,
    $Res Function(_$AddFolderPlaceRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddFolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? placeId = null}) {
    return _then(
      _$AddFolderPlaceRequestImpl(
        placeId: null == placeId
            ? _value.placeId
            : placeId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddFolderPlaceRequestImpl implements _AddFolderPlaceRequest {
  const _$AddFolderPlaceRequestImpl({required this.placeId});

  factory _$AddFolderPlaceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddFolderPlaceRequestImplFromJson(json);

  @override
  final String placeId;

  @override
  String toString() {
    return 'AddFolderPlaceRequest(placeId: $placeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFolderPlaceRequestImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId);

  /// Create a copy of AddFolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFolderPlaceRequestImplCopyWith<_$AddFolderPlaceRequestImpl>
  get copyWith =>
      __$$AddFolderPlaceRequestImplCopyWithImpl<_$AddFolderPlaceRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddFolderPlaceRequestImplToJson(this);
  }
}

abstract class _AddFolderPlaceRequest implements AddFolderPlaceRequest {
  const factory _AddFolderPlaceRequest({required final String placeId}) =
      _$AddFolderPlaceRequestImpl;

  factory _AddFolderPlaceRequest.fromJson(Map<String, dynamic> json) =
      _$AddFolderPlaceRequestImpl.fromJson;

  @override
  String get placeId;

  /// Create a copy of AddFolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddFolderPlaceRequestImplCopyWith<_$AddFolderPlaceRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AddFolderPlaceResponse _$AddFolderPlaceResponseFromJson(
  Map<String, dynamic> json,
) {
  return _AddFolderPlaceResponse.fromJson(json);
}

/// @nodoc
mixin _$AddFolderPlaceResponse {
  String get id => throw _privateConstructorUsedError;
  String get folderId => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AddFolderPlaceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddFolderPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddFolderPlaceResponseCopyWith<AddFolderPlaceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFolderPlaceResponseCopyWith<$Res> {
  factory $AddFolderPlaceResponseCopyWith(
    AddFolderPlaceResponse value,
    $Res Function(AddFolderPlaceResponse) then,
  ) = _$AddFolderPlaceResponseCopyWithImpl<$Res, AddFolderPlaceResponse>;
  @useResult
  $Res call({
    String id,
    String folderId,
    String placeId,
    int? position,
    String? createdAt,
  });
}

/// @nodoc
class _$AddFolderPlaceResponseCopyWithImpl<
  $Res,
  $Val extends AddFolderPlaceResponse
>
    implements $AddFolderPlaceResponseCopyWith<$Res> {
  _$AddFolderPlaceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddFolderPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? folderId = null,
    Object? placeId = null,
    Object? position = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            folderId: null == folderId
                ? _value.folderId
                : folderId // ignore: cast_nullable_to_non_nullable
                      as String,
            placeId: null == placeId
                ? _value.placeId
                : placeId // ignore: cast_nullable_to_non_nullable
                      as String,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as int?,
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
abstract class _$$AddFolderPlaceResponseImplCopyWith<$Res>
    implements $AddFolderPlaceResponseCopyWith<$Res> {
  factory _$$AddFolderPlaceResponseImplCopyWith(
    _$AddFolderPlaceResponseImpl value,
    $Res Function(_$AddFolderPlaceResponseImpl) then,
  ) = __$$AddFolderPlaceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String folderId,
    String placeId,
    int? position,
    String? createdAt,
  });
}

/// @nodoc
class __$$AddFolderPlaceResponseImplCopyWithImpl<$Res>
    extends
        _$AddFolderPlaceResponseCopyWithImpl<$Res, _$AddFolderPlaceResponseImpl>
    implements _$$AddFolderPlaceResponseImplCopyWith<$Res> {
  __$$AddFolderPlaceResponseImplCopyWithImpl(
    _$AddFolderPlaceResponseImpl _value,
    $Res Function(_$AddFolderPlaceResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddFolderPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? folderId = null,
    Object? placeId = null,
    Object? position = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$AddFolderPlaceResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        folderId: null == folderId
            ? _value.folderId
            : folderId // ignore: cast_nullable_to_non_nullable
                  as String,
        placeId: null == placeId
            ? _value.placeId
            : placeId // ignore: cast_nullable_to_non_nullable
                  as String,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as int?,
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
class _$AddFolderPlaceResponseImpl implements _AddFolderPlaceResponse {
  const _$AddFolderPlaceResponseImpl({
    required this.id,
    required this.folderId,
    required this.placeId,
    this.position,
    this.createdAt,
  });

  factory _$AddFolderPlaceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddFolderPlaceResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String folderId;
  @override
  final String placeId;
  @override
  final int? position;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'AddFolderPlaceResponse(id: $id, folderId: $folderId, placeId: $placeId, position: $position, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFolderPlaceResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, folderId, placeId, position, createdAt);

  /// Create a copy of AddFolderPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFolderPlaceResponseImplCopyWith<_$AddFolderPlaceResponseImpl>
  get copyWith =>
      __$$AddFolderPlaceResponseImplCopyWithImpl<_$AddFolderPlaceResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddFolderPlaceResponseImplToJson(this);
  }
}

abstract class _AddFolderPlaceResponse implements AddFolderPlaceResponse {
  const factory _AddFolderPlaceResponse({
    required final String id,
    required final String folderId,
    required final String placeId,
    final int? position,
    final String? createdAt,
  }) = _$AddFolderPlaceResponseImpl;

  factory _AddFolderPlaceResponse.fromJson(Map<String, dynamic> json) =
      _$AddFolderPlaceResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get folderId;
  @override
  String get placeId;
  @override
  int? get position;
  @override
  String? get createdAt;

  /// Create a copy of AddFolderPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddFolderPlaceResponseImplCopyWith<_$AddFolderPlaceResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
