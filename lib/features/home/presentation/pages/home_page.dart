import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../routing/route_paths.dart';
import '../../../auth/presentation/auth_provider.dart';
import '../home_provider.dart';
import '../widgets/home_empty_state.dart';
import '../widgets/home_error_state.dart';
import '../widgets/home_loading_shimmer.dart';
import '../widgets/place_card.dart';

/// 홈 화면 (씀 스타일: 탭 전환 + 미니멀 카드 리스트)
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _recentScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _recentScrollController.addListener(_onRecentScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _recentScrollController.removeListener(_onRecentScroll);
    _recentScrollController.dispose();
    super.dispose();
  }

  void _onRecentScroll() {
    if (_recentScrollController.position.pixels >=
        _recentScrollController.position.maxScrollExtent - 200) {
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
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'MapSy',
          style: TextStyle(
            color: HomeColors.textPrimary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: HomeColors.iconPrimary, size: 22.sp),
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).signOut();
              if (context.mounted) {
                context.go(RoutePaths.login);
              }
            },
            tooltip: '로그아웃',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: HomeColors.textPrimary,
          unselectedLabelColor: HomeColors.iconSecondary,
          labelStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          indicatorColor: HomeColors.textPrimary,
          indicatorWeight: 2,
          dividerColor: HomeColors.divider,
          tabs: const [
            Tab(text: '최신순'),
            Tab(text: '인기순'),
          ],
        ),
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

    return TabBarView(
      controller: _tabController,
      children: [
        _buildRecentTab(state),
        _buildPopularTab(state),
      ],
    );
  }

  /// 최신순 탭
  Widget _buildRecentTab(HomeState state) {
    if (state.recentPlaces.isEmpty && !state.isLoadingRecent) {
      return const HomeEmptyState(message: '아직 등록된 장소가 없습니다');
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(homeNotifierProvider.notifier).refresh(),
      color: HomeColors.textPrimary,
      backgroundColor: HomeColors.background,
      child: ListView.builder(
        controller: _recentScrollController,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: state.recentPlaces.length + (state.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < state.recentPlaces.length) {
            return PlaceCard(place: state.recentPlaces[index]);
          }
          // 무한 스크롤 로딩
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Center(
              child: SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  color: HomeColors.textPrimary,
                  strokeWidth: 2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 인기순 탭
  Widget _buildPopularTab(HomeState state) {
    if (state.popularPlaces.isEmpty && !state.isLoadingPopular) {
      return const HomeEmptyState(message: '아직 인기 장소가 없습니다');
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(homeNotifierProvider.notifier).refresh(),
      color: HomeColors.textPrimary,
      backgroundColor: HomeColors.background,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: state.popularPlaces.length,
        itemBuilder: (context, index) {
          return PlaceCard(place: state.popularPlaces[index]);
        },
      ),
    );
  }
}
