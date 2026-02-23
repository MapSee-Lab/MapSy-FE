// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_places_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SavedPlacesState {
  List<FolderModel> get folders => throw _privateConstructorUsedError;
  bool get isFoldersLoading => throw _privateConstructorUsedError;
  String? get foldersError => throw _privateConstructorUsedError;
  String? get selectedFolderId => throw _privateConstructorUsedError;
  List<FolderPlaceModel> get places => throw _privateConstructorUsedError;
  bool get isPlacesLoading => throw _privateConstructorUsedError;
  String? get placesError => throw _privateConstructorUsedError;

  /// Create a copy of SavedPlacesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedPlacesStateCopyWith<SavedPlacesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPlacesStateCopyWith<$Res> {
  factory $SavedPlacesStateCopyWith(
    SavedPlacesState value,
    $Res Function(SavedPlacesState) then,
  ) = _$SavedPlacesStateCopyWithImpl<$Res, SavedPlacesState>;
  @useResult
  $Res call({
    List<FolderModel> folders,
    bool isFoldersLoading,
    String? foldersError,
    String? selectedFolderId,
    List<FolderPlaceModel> places,
    bool isPlacesLoading,
    String? placesError,
  });
}

/// @nodoc
class _$SavedPlacesStateCopyWithImpl<$Res, $Val extends SavedPlacesState>
    implements $SavedPlacesStateCopyWith<$Res> {
  _$SavedPlacesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedPlacesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folders = null,
    Object? isFoldersLoading = null,
    Object? foldersError = freezed,
    Object? selectedFolderId = freezed,
    Object? places = null,
    Object? isPlacesLoading = null,
    Object? placesError = freezed,
  }) {
    return _then(
      _value.copyWith(
            folders: null == folders
                ? _value.folders
                : folders // ignore: cast_nullable_to_non_nullable
                      as List<FolderModel>,
            isFoldersLoading: null == isFoldersLoading
                ? _value.isFoldersLoading
                : isFoldersLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            foldersError: freezed == foldersError
                ? _value.foldersError
                : foldersError // ignore: cast_nullable_to_non_nullable
                      as String?,
            selectedFolderId: freezed == selectedFolderId
                ? _value.selectedFolderId
                : selectedFolderId // ignore: cast_nullable_to_non_nullable
                      as String?,
            places: null == places
                ? _value.places
                : places // ignore: cast_nullable_to_non_nullable
                      as List<FolderPlaceModel>,
            isPlacesLoading: null == isPlacesLoading
                ? _value.isPlacesLoading
                : isPlacesLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            placesError: freezed == placesError
                ? _value.placesError
                : placesError // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SavedPlacesStateImplCopyWith<$Res>
    implements $SavedPlacesStateCopyWith<$Res> {
  factory _$$SavedPlacesStateImplCopyWith(
    _$SavedPlacesStateImpl value,
    $Res Function(_$SavedPlacesStateImpl) then,
  ) = __$$SavedPlacesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<FolderModel> folders,
    bool isFoldersLoading,
    String? foldersError,
    String? selectedFolderId,
    List<FolderPlaceModel> places,
    bool isPlacesLoading,
    String? placesError,
  });
}

/// @nodoc
class __$$SavedPlacesStateImplCopyWithImpl<$Res>
    extends _$SavedPlacesStateCopyWithImpl<$Res, _$SavedPlacesStateImpl>
    implements _$$SavedPlacesStateImplCopyWith<$Res> {
  __$$SavedPlacesStateImplCopyWithImpl(
    _$SavedPlacesStateImpl _value,
    $Res Function(_$SavedPlacesStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SavedPlacesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folders = null,
    Object? isFoldersLoading = null,
    Object? foldersError = freezed,
    Object? selectedFolderId = freezed,
    Object? places = null,
    Object? isPlacesLoading = null,
    Object? placesError = freezed,
  }) {
    return _then(
      _$SavedPlacesStateImpl(
        folders: null == folders
            ? _value._folders
            : folders // ignore: cast_nullable_to_non_nullable
                  as List<FolderModel>,
        isFoldersLoading: null == isFoldersLoading
            ? _value.isFoldersLoading
            : isFoldersLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        foldersError: freezed == foldersError
            ? _value.foldersError
            : foldersError // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedFolderId: freezed == selectedFolderId
            ? _value.selectedFolderId
            : selectedFolderId // ignore: cast_nullable_to_non_nullable
                  as String?,
        places: null == places
            ? _value._places
            : places // ignore: cast_nullable_to_non_nullable
                  as List<FolderPlaceModel>,
        isPlacesLoading: null == isPlacesLoading
            ? _value.isPlacesLoading
            : isPlacesLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        placesError: freezed == placesError
            ? _value.placesError
            : placesError // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SavedPlacesStateImpl
    with DiagnosticableTreeMixin
    implements _SavedPlacesState {
  const _$SavedPlacesStateImpl({
    final List<FolderModel> folders = const [],
    this.isFoldersLoading = false,
    this.foldersError,
    this.selectedFolderId,
    final List<FolderPlaceModel> places = const [],
    this.isPlacesLoading = false,
    this.placesError,
  }) : _folders = folders,
       _places = places;

  final List<FolderModel> _folders;
  @override
  @JsonKey()
  List<FolderModel> get folders {
    if (_folders is EqualUnmodifiableListView) return _folders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_folders);
  }

  @override
  @JsonKey()
  final bool isFoldersLoading;
  @override
  final String? foldersError;
  @override
  final String? selectedFolderId;
  final List<FolderPlaceModel> _places;
  @override
  @JsonKey()
  List<FolderPlaceModel> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  @JsonKey()
  final bool isPlacesLoading;
  @override
  final String? placesError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SavedPlacesState(folders: $folders, isFoldersLoading: $isFoldersLoading, foldersError: $foldersError, selectedFolderId: $selectedFolderId, places: $places, isPlacesLoading: $isPlacesLoading, placesError: $placesError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SavedPlacesState'))
      ..add(DiagnosticsProperty('folders', folders))
      ..add(DiagnosticsProperty('isFoldersLoading', isFoldersLoading))
      ..add(DiagnosticsProperty('foldersError', foldersError))
      ..add(DiagnosticsProperty('selectedFolderId', selectedFolderId))
      ..add(DiagnosticsProperty('places', places))
      ..add(DiagnosticsProperty('isPlacesLoading', isPlacesLoading))
      ..add(DiagnosticsProperty('placesError', placesError));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedPlacesStateImpl &&
            const DeepCollectionEquality().equals(other._folders, _folders) &&
            (identical(other.isFoldersLoading, isFoldersLoading) ||
                other.isFoldersLoading == isFoldersLoading) &&
            (identical(other.foldersError, foldersError) ||
                other.foldersError == foldersError) &&
            (identical(other.selectedFolderId, selectedFolderId) ||
                other.selectedFolderId == selectedFolderId) &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            (identical(other.isPlacesLoading, isPlacesLoading) ||
                other.isPlacesLoading == isPlacesLoading) &&
            (identical(other.placesError, placesError) ||
                other.placesError == placesError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_folders),
    isFoldersLoading,
    foldersError,
    selectedFolderId,
    const DeepCollectionEquality().hash(_places),
    isPlacesLoading,
    placesError,
  );

  /// Create a copy of SavedPlacesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedPlacesStateImplCopyWith<_$SavedPlacesStateImpl> get copyWith =>
      __$$SavedPlacesStateImplCopyWithImpl<_$SavedPlacesStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SavedPlacesState implements SavedPlacesState {
  const factory _SavedPlacesState({
    final List<FolderModel> folders,
    final bool isFoldersLoading,
    final String? foldersError,
    final String? selectedFolderId,
    final List<FolderPlaceModel> places,
    final bool isPlacesLoading,
    final String? placesError,
  }) = _$SavedPlacesStateImpl;

  @override
  List<FolderModel> get folders;
  @override
  bool get isFoldersLoading;
  @override
  String? get foldersError;
  @override
  String? get selectedFolderId;
  @override
  List<FolderPlaceModel> get places;
  @override
  bool get isPlacesLoading;
  @override
  String? get placesError;

  /// Create a copy of SavedPlacesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedPlacesStateImplCopyWith<_$SavedPlacesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
