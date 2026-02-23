// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analyze_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnalyzeRequest _$AnalyzeRequestFromJson(Map<String, dynamic> json) {
  return _AnalyzeRequest.fromJson(json);
}

/// @nodoc
mixin _$AnalyzeRequest {
  /// SNS URL (Instagram, YouTube)
  String get sourceUrl => throw _privateConstructorUsedError;

  /// Serializes this AnalyzeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyzeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyzeRequestCopyWith<AnalyzeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzeRequestCopyWith<$Res> {
  factory $AnalyzeRequestCopyWith(
    AnalyzeRequest value,
    $Res Function(AnalyzeRequest) then,
  ) = _$AnalyzeRequestCopyWithImpl<$Res, AnalyzeRequest>;
  @useResult
  $Res call({String sourceUrl});
}

/// @nodoc
class _$AnalyzeRequestCopyWithImpl<$Res, $Val extends AnalyzeRequest>
    implements $AnalyzeRequestCopyWith<$Res> {
  _$AnalyzeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyzeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sourceUrl = null}) {
    return _then(
      _value.copyWith(
            sourceUrl: null == sourceUrl
                ? _value.sourceUrl
                : sourceUrl // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalyzeRequestImplCopyWith<$Res>
    implements $AnalyzeRequestCopyWith<$Res> {
  factory _$$AnalyzeRequestImplCopyWith(
    _$AnalyzeRequestImpl value,
    $Res Function(_$AnalyzeRequestImpl) then,
  ) = __$$AnalyzeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sourceUrl});
}

/// @nodoc
class __$$AnalyzeRequestImplCopyWithImpl<$Res>
    extends _$AnalyzeRequestCopyWithImpl<$Res, _$AnalyzeRequestImpl>
    implements _$$AnalyzeRequestImplCopyWith<$Res> {
  __$$AnalyzeRequestImplCopyWithImpl(
    _$AnalyzeRequestImpl _value,
    $Res Function(_$AnalyzeRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalyzeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sourceUrl = null}) {
    return _then(
      _$AnalyzeRequestImpl(
        sourceUrl: null == sourceUrl
            ? _value.sourceUrl
            : sourceUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyzeRequestImpl implements _AnalyzeRequest {
  const _$AnalyzeRequestImpl({required this.sourceUrl});

  factory _$AnalyzeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyzeRequestImplFromJson(json);

  /// SNS URL (Instagram, YouTube)
  @override
  final String sourceUrl;

  @override
  String toString() {
    return 'AnalyzeRequest(sourceUrl: $sourceUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyzeRequestImpl &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sourceUrl);

  /// Create a copy of AnalyzeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyzeRequestImplCopyWith<_$AnalyzeRequestImpl> get copyWith =>
      __$$AnalyzeRequestImplCopyWithImpl<_$AnalyzeRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyzeRequestImplToJson(this);
  }
}

abstract class _AnalyzeRequest implements AnalyzeRequest {
  const factory _AnalyzeRequest({required final String sourceUrl}) =
      _$AnalyzeRequestImpl;

  factory _AnalyzeRequest.fromJson(Map<String, dynamic> json) =
      _$AnalyzeRequestImpl.fromJson;

  /// SNS URL (Instagram, YouTube)
  @override
  String get sourceUrl;

  /// Create a copy of AnalyzeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyzeRequestImplCopyWith<_$AnalyzeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
