import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/content_response.dart';
import '../data/home_repository_impl.dart';

part 'home_provider.freezed.dart';
part 'home_provider.g.dart';

/// 홈 화면 상태
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    /// 최근 콘텐츠 목록
    @Default([]) List<ContentItemModel> recentContents,

    /// 회원 콘텐츠 목록
    @Default([]) List<ContentItemModel> memberContents,

    /// 최근 콘텐츠 로딩 중
    @Default(false) bool isLoadingRecent,

    /// 회원 콘텐츠 로딩 중
    @Default(false) bool isLoadingMember,

    /// 에러 메시지
    String? errorMessage,

    /// 초기 로딩 완료 여부
    @Default(false) bool isInitialized,
  }) = _HomeState;
}

/// 홈 화면 Notifier
@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    Future.microtask(() => _initialize());
    return const HomeState();
  }

  Future<void> _initialize() async {
    await Future.wait([
      fetchRecentContents(),
      fetchMemberContents(),
    ]);
    state = state.copyWith(isInitialized: true);
  }

  /// 최근 콘텐츠 목록 조회
  Future<void> fetchRecentContents() async {
    state = state.copyWith(isLoadingRecent: true, errorMessage: null);

    try {
      final repository = ref.read(homeRepositoryProvider);
      final response = await repository.getRecentContent();

      state = state.copyWith(
        recentContents: response.contents,
        isLoadingRecent: false,
      );
    } catch (e) {
      debugPrint('❌ HomeNotifier: Failed to fetch recent contents: $e');
      state = state.copyWith(
        isLoadingRecent: false,
        errorMessage: '최신 콘텐츠를 불러올 수 없습니다',
      );
    }
  }

  /// 회원 콘텐츠 목록 조회
  Future<void> fetchMemberContents() async {
    state = state.copyWith(isLoadingMember: true, errorMessage: null);

    try {
      final repository = ref.read(homeRepositoryProvider);
      final response = await repository.getMemberContent();

      state = state.copyWith(
        memberContents: response.contentPage.content,
        isLoadingMember: false,
      );
    } catch (e) {
      debugPrint('❌ HomeNotifier: Failed to fetch member contents: $e');
      state = state.copyWith(
        isLoadingMember: false,
        errorMessage: '내 콘텐츠를 불러올 수 없습니다',
      );
    }
  }

  /// 전체 새로고침
  Future<void> refresh() async {
    state = const HomeState();
    await _initialize();
  }
}
