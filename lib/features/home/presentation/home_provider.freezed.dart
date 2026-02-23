// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  /// 최근 콘텐츠 목록
  List<ContentItemModel> get recentContents =>
      throw _privateConstructorUsedError;

  /// 회원 콘텐츠 목록
  List<ContentItemModel> get memberContents =>
      throw _privateConstructorUsedError;

  /// 최근 콘텐츠 로딩 중
  bool get isLoadingRecent => throw _privateConstructorUsedError;

  /// 회원 콘텐츠 로딩 중
  bool get isLoadingMember => throw _privateConstructorUsedError;

  /// 에러 메시지
  String? get errorMessage => throw _privateConstructorUsedError;

  /// 초기 로딩 완료 여부
  bool get isInitialized => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    List<ContentItemModel> recentContents,
    List<ContentItemModel> memberContents,
    bool isLoadingRecent,
    bool isLoadingMember,
    String? errorMessage,
    bool isInitialized,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentContents = null,
    Object? memberContents = null,
    Object? isLoadingRecent = null,
    Object? isLoadingMember = null,
    Object? errorMessage = freezed,
    Object? isInitialized = null,
  }) {
    return _then(
      _value.copyWith(
            recentContents: null == recentContents
                ? _value.recentContents
                : recentContents // ignore: cast_nullable_to_non_nullable
                      as List<ContentItemModel>,
            memberContents: null == memberContents
                ? _value.memberContents
                : memberContents // ignore: cast_nullable_to_non_nullable
                      as List<ContentItemModel>,
            isLoadingRecent: null == isLoadingRecent
                ? _value.isLoadingRecent
                : isLoadingRecent // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoadingMember: null == isLoadingMember
                ? _value.isLoadingMember
                : isLoadingMember // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            isInitialized: null == isInitialized
                ? _value.isInitialized
                : isInitialized // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ContentItemModel> recentContents,
    List<ContentItemModel> memberContents,
    bool isLoadingRecent,
    bool isLoadingMember,
    String? errorMessage,
    bool isInitialized,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentContents = null,
    Object? memberContents = null,
    Object? isLoadingRecent = null,
    Object? isLoadingMember = null,
    Object? errorMessage = freezed,
    Object? isInitialized = null,
  }) {
    return _then(
      _$HomeStateImpl(
        recentContents: null == recentContents
            ? _value._recentContents
            : recentContents // ignore: cast_nullable_to_non_nullable
                  as List<ContentItemModel>,
        memberContents: null == memberContents
            ? _value._memberContents
            : memberContents // ignore: cast_nullable_to_non_nullable
                  as List<ContentItemModel>,
        isLoadingRecent: null == isLoadingRecent
            ? _value.isLoadingRecent
            : isLoadingRecent // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoadingMember: null == isLoadingMember
            ? _value.isLoadingMember
            : isLoadingMember // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        isInitialized: null == isInitialized
            ? _value.isInitialized
            : isInitialized // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl with DiagnosticableTreeMixin implements _HomeState {
  const _$HomeStateImpl({
    final List<ContentItemModel> recentContents = const [],
    final List<ContentItemModel> memberContents = const [],
    this.isLoadingRecent = false,
    this.isLoadingMember = false,
    this.errorMessage,
    this.isInitialized = false,
  }) : _recentContents = recentContents,
       _memberContents = memberContents;

  /// 최근 콘텐츠 목록
  final List<ContentItemModel> _recentContents;

  /// 최근 콘텐츠 목록
  @override
  @JsonKey()
  List<ContentItemModel> get recentContents {
    if (_recentContents is EqualUnmodifiableListView) return _recentContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentContents);
  }

  /// 회원 콘텐츠 목록
  final List<ContentItemModel> _memberContents;

  /// 회원 콘텐츠 목록
  @override
  @JsonKey()
  List<ContentItemModel> get memberContents {
    if (_memberContents is EqualUnmodifiableListView) return _memberContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberContents);
  }

  /// 최근 콘텐츠 로딩 중
  @override
  @JsonKey()
  final bool isLoadingRecent;

  /// 회원 콘텐츠 로딩 중
  @override
  @JsonKey()
  final bool isLoadingMember;

  /// 에러 메시지
  @override
  final String? errorMessage;

  /// 초기 로딩 완료 여부
  @override
  @JsonKey()
  final bool isInitialized;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(recentContents: $recentContents, memberContents: $memberContents, isLoadingRecent: $isLoadingRecent, isLoadingMember: $isLoadingMember, errorMessage: $errorMessage, isInitialized: $isInitialized)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('recentContents', recentContents))
      ..add(DiagnosticsProperty('memberContents', memberContents))
      ..add(DiagnosticsProperty('isLoadingRecent', isLoadingRecent))
      ..add(DiagnosticsProperty('isLoadingMember', isLoadingMember))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('isInitialized', isInitialized));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality().equals(
              other._recentContents,
              _recentContents,
            ) &&
            const DeepCollectionEquality().equals(
              other._memberContents,
              _memberContents,
            ) &&
            (identical(other.isLoadingRecent, isLoadingRecent) ||
                other.isLoadingRecent == isLoadingRecent) &&
            (identical(other.isLoadingMember, isLoadingMember) ||
                other.isLoadingMember == isLoadingMember) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_recentContents),
    const DeepCollectionEquality().hash(_memberContents),
    isLoadingRecent,
    isLoadingMember,
    errorMessage,
    isInitialized,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final List<ContentItemModel> recentContents,
    final List<ContentItemModel> memberContents,
    final bool isLoadingRecent,
    final bool isLoadingMember,
    final String? errorMessage,
    final bool isInitialized,
  }) = _$HomeStateImpl;

  /// 최근 콘텐츠 목록
  @override
  List<ContentItemModel> get recentContents;

  /// 회원 콘텐츠 목록
  @override
  List<ContentItemModel> get memberContents;

  /// 최근 콘텐츠 로딩 중
  @override
  bool get isLoadingRecent;

  /// 회원 콘텐츠 로딩 중
  @override
  bool get isLoadingMember;

  /// 에러 메시지
  @override
  String? get errorMessage;

  /// 초기 로딩 완료 여부
  @override
  bool get isInitialized;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
