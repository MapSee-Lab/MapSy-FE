import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/home_colors.dart';
import '../../../../router/route_paths.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/home_provider.dart';
import '../widgets/home_empty_state.dart';
import '../widgets/home_error_state.dart';
import '../widgets/home_loading_shimmer.dart';
import '../widgets/place_card.dart';
import '../widgets/popular_place_tile.dart';

/// 홈 화면
///
/// 최신 장소(무한 스크롤) + 인기 장소(그리드) 피드를 표시합니다.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(homeNotifierProvider.notifier).fetchMoreRecentPlaces();
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      backgroundColor: HomeColors.background,
      appBar: AppBar(
        backgroundColor: HomeColors.background,
        title: Text(
          'MapSy',
          style: TextStyle(
            color: HomeColors.textPrimary,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: HomeColors.iconPrimary),
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).signOut();
              if (context.mounted) {
                context.go(RoutePaths.login);
              }
            },
            tooltip: '로그아웃',
          ),
        ],
      ),
      body: _buildBody(homeState),
    );
  }

  Widget _buildBody(HomeState state) {
    // 초기 로딩
    if (!state.isInitialized &&
        (state.isLoadingRecent || state.isLoadingPopular)) {
      return const SingleChildScrollView(
        child: HomeLoadingShimmer(),
      );
    }

    // 에러 상태 (데이터 없이 에러)
    if (state.errorMessage != null &&
        state.recentPlaces.isEmpty &&
        state.popularPlaces.isEmpty) {
      return HomeErrorState(
        message: state.errorMessage!,
        onRetry: () => ref.read(homeNotifierProvider.notifier).refresh(),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(homeNotifierProvider.notifier).refresh(),
      color: HomeColors.textPrimary,
      backgroundColor: HomeColors.surface,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // 섹션 1: 최신 장소
          _buildSectionHeader('최신 장소'),
          if (state.recentPlaces.isEmpty && !state.isLoadingRecent)
            const SliverToBoxAdapter(
              child: HomeEmptyState(message: '아직 등록된 장소가 없습니다'),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index < state.recentPlaces.length) {
                    return PlaceCard(place: state.recentPlaces[index]);
                  }
                  // 무한 스크롤 로딩 인디케이터
                  if (state.isLoadingMore) {
                    return Padding(
                      padding: EdgeInsets.all(16.w),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: HomeColors.textSecondary,
                        ),
                      ),
                    );
                  }
                  // 마지막 페이지 메시지
                  if (!state.recentHasNext && state.recentPlaces.isNotEmpty) {
                    return Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Center(
                        child: Text(
                          '모든 장소를 확인했습니다',
                          style: TextStyle(
                            color: HomeColors.textDisabled,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    );
                  }
                  return null;
                },
                childCount: state.recentPlaces.length +
                    (state.isLoadingMore || !state.recentHasNext ? 1 : 0),
              ),
            ),

          // 섹션 구분
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),

          // 섹션 2: 인기 장소
          _buildSectionHeader('인기 장소'),
          if (state.popularPlaces.isEmpty && !state.isLoadingPopular)
            const SliverToBoxAdapter(
              child: HomeEmptyState(message: '아직 인기 장소가 없습니다'),
            )
          else
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.w,
                  mainAxisSpacing: 4.w,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PopularPlaceTile(
                      place: state.popularPlaces[index],
                    );
                  },
                  childCount: state.popularPlaces.length > 30
                      ? 30
                      : state.popularPlaces.length,
                ),
              ),
            ),

          // 하단 여백
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
        child: Text(
          title,
          style: TextStyle(
            color: HomeColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
