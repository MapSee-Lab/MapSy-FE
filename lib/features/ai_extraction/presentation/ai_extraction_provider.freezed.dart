// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_extraction_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AiExtractionState {
  AiExtractionStep get step => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int? get contentId => throw _privateConstructorUsedError;
  List<PlaceModel> get places => throw _privateConstructorUsedError;
  Set<int> get selectedPlaceIds => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  double get saveProgress => throw _privateConstructorUsedError;

  /// Create a copy of AiExtractionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiExtractionStateCopyWith<AiExtractionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiExtractionStateCopyWith<$Res> {
  factory $AiExtractionStateCopyWith(
    AiExtractionState value,
    $Res Function(AiExtractionState) then,
  ) = _$AiExtractionStateCopyWithImpl<$Res, AiExtractionState>;
  @useResult
  $Res call({
    AiExtractionStep step,
    String url,
    int? contentId,
    List<PlaceModel> places,
    Set<int> selectedPlaceIds,
    String? errorMessage,
    double saveProgress,
  });
}

/// @nodoc
class _$AiExtractionStateCopyWithImpl<$Res, $Val extends AiExtractionState>
    implements $AiExtractionStateCopyWith<$Res> {
  _$AiExtractionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiExtractionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? url = null,
    Object? contentId = freezed,
    Object? places = null,
    Object? selectedPlaceIds = null,
    Object? errorMessage = freezed,
    Object? saveProgress = null,
  }) {
    return _then(
      _value.copyWith(
            step: null == step
                ? _value.step
                : step // ignore: cast_nullable_to_non_nullable
                      as AiExtractionStep,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            contentId: freezed == contentId
                ? _value.contentId
                : contentId // ignore: cast_nullable_to_non_nullable
                      as int?,
            places: null == places
                ? _value.places
                : places // ignore: cast_nullable_to_non_nullable
                      as List<PlaceModel>,
            selectedPlaceIds: null == selectedPlaceIds
                ? _value.selectedPlaceIds
                : selectedPlaceIds // ignore: cast_nullable_to_non_nullable
                      as Set<int>,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            saveProgress: null == saveProgress
                ? _value.saveProgress
                : saveProgress // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiExtractionStateImplCopyWith<$Res>
    implements $AiExtractionStateCopyWith<$Res> {
  factory _$$AiExtractionStateImplCopyWith(
    _$AiExtractionStateImpl value,
    $Res Function(_$AiExtractionStateImpl) then,
  ) = __$$AiExtractionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AiExtractionStep step,
    String url,
    int? contentId,
    List<PlaceModel> places,
    Set<int> selectedPlaceIds,
    String? errorMessage,
    double saveProgress,
  });
}

/// @nodoc
class __$$AiExtractionStateImplCopyWithImpl<$Res>
    extends _$AiExtractionStateCopyWithImpl<$Res, _$AiExtractionStateImpl>
    implements _$$AiExtractionStateImplCopyWith<$Res> {
  __$$AiExtractionStateImplCopyWithImpl(
    _$AiExtractionStateImpl _value,
    $Res Function(_$AiExtractionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiExtractionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? url = null,
    Object? contentId = freezed,
    Object? places = null,
    Object? selectedPlaceIds = null,
    Object? errorMessage = freezed,
    Object? saveProgress = null,
  }) {
    return _then(
      _$AiExtractionStateImpl(
        step: null == step
            ? _value.step
            : step // ignore: cast_nullable_to_non_nullable
                  as AiExtractionStep,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        contentId: freezed == contentId
            ? _value.contentId
            : contentId // ignore: cast_nullable_to_non_nullable
                  as int?,
        places: null == places
            ? _value._places
            : places // ignore: cast_nullable_to_non_nullable
                  as List<PlaceModel>,
        selectedPlaceIds: null == selectedPlaceIds
            ? _value._selectedPlaceIds
            : selectedPlaceIds // ignore: cast_nullable_to_non_nullable
                  as Set<int>,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        saveProgress: null == saveProgress
            ? _value.saveProgress
            : saveProgress // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$AiExtractionStateImpl implements _AiExtractionState {
  const _$AiExtractionStateImpl({
    this.step = AiExtractionStep.input,
    this.url = '',
    this.contentId,
    final List<PlaceModel> places = const [],
    final Set<int> selectedPlaceIds = const {},
    this.errorMessage,
    this.saveProgress = 0.0,
  })  : _places = places,
        _selectedPlaceIds = selectedPlaceIds;

  @override
  @JsonKey()
  final AiExtractionStep step;
  @override
  @JsonKey()
  final String url;
  @override
  final int? contentId;

  final List<PlaceModel> _places;

  @override
  @JsonKey()
  List<PlaceModel> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  final Set<int> _selectedPlaceIds;

  @override
  @JsonKey()
  Set<int> get selectedPlaceIds {
    if (_selectedPlaceIds is EqualUnmodifiableSetView) return _selectedPlaceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedPlaceIds);
  }

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final double saveProgress;

  @override
  String toString() {
    return 'AiExtractionState(step: $step, url: $url, contentId: $contentId, places: $places, selectedPlaceIds: $selectedPlaceIds, errorMessage: $errorMessage, saveProgress: $saveProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiExtractionStateImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            const DeepCollectionEquality()
                .equals(other._selectedPlaceIds, _selectedPlaceIds) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.saveProgress, saveProgress) ||
                other.saveProgress == saveProgress));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    step,
    url,
    contentId,
    const DeepCollectionEquality().hash(_places),
    const DeepCollectionEquality().hash(_selectedPlaceIds),
    errorMessage,
    saveProgress,
  );

  /// Create a copy of AiExtractionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiExtractionStateImplCopyWith<_$AiExtractionStateImpl> get copyWith =>
      __$$AiExtractionStateImplCopyWithImpl<_$AiExtractionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AiExtractionState implements AiExtractionState {
  const factory _AiExtractionState({
    final AiExtractionStep step,
    final String url,
    final int? contentId,
    final List<PlaceModel> places,
    final Set<int> selectedPlaceIds,
    final String? errorMessage,
    final double saveProgress,
  }) = _$AiExtractionStateImpl;

  @override
  AiExtractionStep get step;
  @override
  String get url;
  @override
  int? get contentId;
  @override
  List<PlaceModel> get places;
  @override
  Set<int> get selectedPlaceIds;
  @override
  String? get errorMessage;
  @override
  double get saveProgress;

  /// Create a copy of AiExtractionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiExtractionStateImplCopyWith<_$AiExtractionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
