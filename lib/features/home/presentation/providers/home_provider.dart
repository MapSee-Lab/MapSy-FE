import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/place_model.dart';
import '../../data/repositories/home_repository_impl.dart';

part 'home_provider.freezed.dart';
part 'home_provider.g.dart';

/// 홈 화면 상태
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    /// 최신 장소 목록
    @Default([]) List<PlaceModel> recentPlaces,

    /// 인기 장소 목록
    @Default([]) List<PlaceModel> popularPlaces,

    /// 최신 장소 로딩 중
    @Default(false) bool isLoadingRecent,

    /// 인기 장소 로딩 중
    @Default(false) bool isLoadingPopular,

    /// 추가 로딩 중 (무한 스크롤)
    @Default(false) bool isLoadingMore,

    /// 다음 페이지 커서 (최신 장소)
    int? recentNextCursor,

    /// 다음 페이지 존재 여부 (최신 장소)
    @Default(true) bool recentHasNext,

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
      fetchRecentPlaces(),
      fetchPopularPlaces(),
    ]);
    state = state.copyWith(isInitialized: true);
  }

  /// 최신 장소 목록 조회 (초기 로드)
  Future<void> fetchRecentPlaces() async {
    state = state.copyWith(isLoadingRecent: true, errorMessage: null);

    try {
      final repository = ref.read(homeRepositoryProvider);
      final response = await repository.getRecentContent();

      final places =
          response.content.expand((item) => item.places).toList();

      state = state.copyWith(
        recentPlaces: places,
        isLoadingRecent: false,
        recentNextCursor: response.cursor?.nextCursor,
        recentHasNext: response.cursor?.hasNext ?? false,
      );
    } catch (e) {
      debugPrint('❌ HomeNotifier: Failed to fetch recent places: $e');
      state = state.copyWith(
        isLoadingRecent: false,
        errorMessage: '최신 장소를 불러올 수 없습니다',
      );
    }
  }

  /// 최신 장소 추가 로드 (무한 스크롤)
  Future<void> fetchMoreRecentPlaces() async {
    if (!state.recentHasNext || state.isLoadingMore) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final repository = ref.read(homeRepositoryProvider);
      final response = await repository.getRecentContent(
        cursor: state.recentNextCursor,
      );

      final newPlaces =
          response.content.expand((item) => item.places).toList();

      state = state.copyWith(
        recentPlaces: [...state.recentPlaces, ...newPlaces],
        isLoadingMore: false,
        recentNextCursor: response.cursor?.nextCursor,
        recentHasNext: response.cursor?.hasNext ?? false,
      );
    } catch (e) {
      debugPrint('❌ HomeNotifier: Failed to fetch more places: $e');
      state = state.copyWith(isLoadingMore: false);
    }
  }

  /// 인기 장소 목록 조회
  Future<void> fetchPopularPlaces() async {
    state = state.copyWith(isLoadingPopular: true, errorMessage: null);

    try {
      final repository = ref.read(homeRepositoryProvider);
      final response = await repository.getMemberContent();

      final places =
          response.content.expand((item) => item.places).toList();

      state = state.copyWith(
        popularPlaces: places,
        isLoadingPopular: false,
      );
    } catch (e) {
      debugPrint('❌ HomeNotifier: Failed to fetch popular places: $e');
      state = state.copyWith(
        isLoadingPopular: false,
        errorMessage: '인기 장소를 불러올 수 없습니다',
      );
    }
  }

  /// 전체 새로고침
  Future<void> refresh() async {
    state = const HomeState();
    await _initialize();
  }
}
