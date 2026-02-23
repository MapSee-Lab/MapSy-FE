// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CursorModel _$CursorModelFromJson(Map<String, dynamic> json) {
  return _CursorModel.fromJson(json);
}

/// @nodoc
mixin _$CursorModel {
  bool get hasNext => throw _privateConstructorUsedError;
  int? get nextCursor => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;

  /// Serializes this CursorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CursorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CursorModelCopyWith<CursorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursorModelCopyWith<$Res> {
  factory $CursorModelCopyWith(
    CursorModel value,
    $Res Function(CursorModel) then,
  ) = _$CursorModelCopyWithImpl<$Res, CursorModel>;
  @useResult
  $Res call({bool hasNext, int? nextCursor, int size});
}

/// @nodoc
class _$CursorModelCopyWithImpl<$Res, $Val extends CursorModel>
    implements $CursorModelCopyWith<$Res> {
  _$CursorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CursorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNext = null,
    Object? nextCursor = freezed,
    Object? size = null,
  }) {
    return _then(
      _value.copyWith(
            hasNext: null == hasNext
                ? _value.hasNext
                : hasNext // ignore: cast_nullable_to_non_nullable
                      as bool,
            nextCursor: freezed == nextCursor
                ? _value.nextCursor
                : nextCursor // ignore: cast_nullable_to_non_nullable
                      as int?,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CursorModelImplCopyWith<$Res>
    implements $CursorModelCopyWith<$Res> {
  factory _$$CursorModelImplCopyWith(
    _$CursorModelImpl value,
    $Res Function(_$CursorModelImpl) then,
  ) = __$$CursorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasNext, int? nextCursor, int size});
}

/// @nodoc
class __$$CursorModelImplCopyWithImpl<$Res>
    extends _$CursorModelCopyWithImpl<$Res, _$CursorModelImpl>
    implements _$$CursorModelImplCopyWith<$Res> {
  __$$CursorModelImplCopyWithImpl(
    _$CursorModelImpl _value,
    $Res Function(_$CursorModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CursorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNext = null,
    Object? nextCursor = freezed,
    Object? size = null,
  }) {
    return _then(
      _$CursorModelImpl(
        hasNext: null == hasNext
            ? _value.hasNext
            : hasNext // ignore: cast_nullable_to_non_nullable
                  as bool,
        nextCursor: freezed == nextCursor
            ? _value.nextCursor
            : nextCursor // ignore: cast_nullable_to_non_nullable
                  as int?,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CursorModelImpl implements _CursorModel {
  const _$CursorModelImpl({
    this.hasNext = false,
    this.nextCursor,
    this.size = 0,
  });

  factory _$CursorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CursorModelImplFromJson(json);

  @override
  @JsonKey()
  final bool hasNext;
  @override
  final int? nextCursor;
  @override
  @JsonKey()
  final int size;

  @override
  String toString() {
    return 'CursorModel(hasNext: $hasNext, nextCursor: $nextCursor, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursorModelImpl &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasNext, nextCursor, size);

  /// Create a copy of CursorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CursorModelImplCopyWith<_$CursorModelImpl> get copyWith =>
      __$$CursorModelImplCopyWithImpl<_$CursorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CursorModelImplToJson(this);
  }
}

abstract class _CursorModel implements CursorModel {
  const factory _CursorModel({
    final bool hasNext,
    final int? nextCursor,
    final int size,
  }) = _$CursorModelImpl;

  factory _CursorModel.fromJson(Map<String, dynamic> json) =
      _$CursorModelImpl.fromJson;

  @override
  bool get hasNext;
  @override
  int? get nextCursor;
  @override
  int get size;

  /// Create a copy of CursorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CursorModelImplCopyWith<_$CursorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
