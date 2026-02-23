# 홈 피드 UI 씀(Sseum) 스타일 리디자인 - 구현 계획

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** 현재 다크 테마의 홈 피드를 씀 앱 스타일의 라이트 모노톤 미니멀 디자인으로 전면 리디자인한다.

**Architecture:** UI/컬러 레이어만 변경. data 레이어(models, datasource, repository, provider 로직)는 그대로 유지. HomeColors 컬러 팔레트를 다크→라이트로 교체하고, HomePage를 2섹션 스크롤에서 TabBar+TabBarView 탭 전환 구조로 변경한다.

**Tech Stack:** Flutter 3.9.2, Riverpod (riverpod_annotation), Freezed, flutter_screenutil, GoRouter

**제약:** `flutter format`만 로컬 실행 가능. `build_runner` 실행 불가. 코드 생성 파일은 직접 작성 불요(이번 변경에서 provider/model 코드 변경 없음).

---

## Task 1: HomeColors 라이트 모노톤으로 교체

**Files:**
- Modify: `lib/common/constants/home_colors.dart`

**Step 1: HomeColors 전체 교체**

`cardOverlayStart`, `cardOverlayEnd`, `border` 삭제. `cardBorder` 신규 추가. 나머지 모든 값을 라이트 모노톤으로 변경.

```dart
import 'package:flutter/material.dart';

/// 홈 화면 전용 컬러 상수
/// Home Screen Color Palette (씀 스타일 라이트 모노톤 미니멀 디자인)
///
/// 사용법:
/// - Container(color: HomeColors.background)
class HomeColors {
  HomeColors._();

  // ============================================
  // 배경 색상 (Background Colors)
  // ============================================

  /// 메인 배경색 (순수 화이트)
  static const Color background = Color(0xFFFFFFFF);

  /// 서피스 배경색 (미세 구분용)
  static const Color surface = Color(0xFFFAFAFA);

  /// 서피스 밝은 톤 (스켈레톤 베이스, placeholder)
  static const Color surfaceLight = Color(0xFFF5F5F5);

  // ============================================
  // 텍스트 색상 (Text Colors)
  // ============================================

  /// 주요 텍스트 (거의 블랙)
  static const Color textPrimary = Color(0xFF1A1A1A);

  /// 보조 텍스트 (미디엄 그레이)
  static const Color textSecondary = Color(0xFF888888);

  /// 비활성 텍스트 (연한 그레이)
  static const Color textDisabled = Color(0xFFBDBDBD);

  // ============================================
  // 카드 색상 (Card Colors)
  // ============================================

  /// 카드 배경색
  static const Color cardBackground = Color(0xFFFFFFFF);

  /// 카드 보더 색상
  static const Color cardBorder = Color(0xFFE5E5E5);

  // ============================================
  // 태그/칩 색상 (Tag/Chip Colors)
  // ============================================

  /// 태그 배경색
  static const Color tagBackground = Color(0xFFF5F5F5);

  /// 태그 텍스트 색상
  static const Color tagText = Color(0xFF666666);

  // ============================================
  // 구분선 색상 (Divider Colors)
  // ============================================

  /// 구분선 색상
  static const Color divider = Color(0xFFF0F0F0);

  // ============================================
  // 스켈레톤 색상 (Shimmer/Skeleton Colors)
  // ============================================

  /// 스켈레톤 기본 색상
  static const Color shimmerBase = Color(0xFFF5F5F5);

  /// 스켈레톤 하이라이트 색상
  static const Color shimmerHighlight = Color(0xFFEBEBEB);

  // ============================================
  // 아이콘 색상 (Icon Colors)
  // ============================================

  /// 아이콘 기본 색상
  static const Color iconPrimary = Color(0xFF1A1A1A);

  /// 아이콘 보조 색상
  static const Color iconSecondary = Color(0xFFAAAAAA);

  // ============================================
  // 에러/상태 색상 (Status Colors)
  // ============================================

  /// 에러 색상
  static const Color error = Color(0xFFD32F2F);

  /// 재시도 버튼 색상
  static const Color retryButton = Color(0xFF1A1A1A);
}
```

**Step 2: 커밋**

```bash
git add lib/common/constants/home_colors.dart
git commit -m "최신/인기 장소 목록 UI : refactor : HomeColors 씀 스타일 라이트 모노톤으로 교체 https://github.com/MapSee-Lab/MapSy-FE/issues/18"
```

---

## Task 2: PlaceCard 씀 스타일로 수정

**Files:**
- Modify: `lib/features/home/presentation/widgets/place_card.dart`

**Step 1: PlaceCard 전체 교체**

변경사항:
- `borderRadius: 12.r` → `0` (직각)
- `BoxDecoration` 에 `border: Border.all(color: HomeColors.cardBorder)` 추가
- `margin` 좌우 16 → 20, 상하 8 → 수직 8 유지
- `AspectRatio` 16:9 → 3:2
- 내부 패딩 `12.w` → 좌우 `20.w`, 상하 `16.h`
- 태그 `borderRadius: 4.r` → `100.r` (pill shape)
- placeholder 배경 `HomeColors.surface` → `HomeColors.surfaceLight`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../data/models/place_model.dart';

/// 장소 카드 (씀 스타일: 직각 보더, 넓은 여백)
class PlaceCard extends StatelessWidget {
  final PlaceModel place;
  final VoidCallback? onTap;

  const PlaceCard({
    super.key,
    required this.place,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: HomeColors.cardBackground,
          border: Border.all(color: HomeColors.cardBorder, width: 1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일 (3:2)
            AspectRatio(
              aspectRatio: 3 / 2,
              child: _buildThumbnail(),
            ),
            // 정보 영역
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 장소명
                  Text(
                    place.placeName,
                    style: TextStyle(
                      color: HomeColors.textPrimary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (place.address != null) ...[
                    SizedBox(height: 4.h),
                    // 주소
                    Text(
                      place.address!,
                      style: TextStyle(
                        color: HomeColors.textSecondary,
                        fontSize: 13.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (place.tags.isNotEmpty) ...[
                    SizedBox(height: 8.h),
                    // 태그
                    Wrap(
                      spacing: 6.w,
                      runSpacing: 4.h,
                      children: place.tags.take(3).map((tag) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: HomeColors.tagBackground,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            '#$tag',
                            style: TextStyle(
                              color: HomeColors.tagText,
                              fontSize: 12.sp,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    if (place.imageUrl != null && place.imageUrl!.isNotEmpty) {
      return Image.network(
        place.imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildPlaceholder(),
      );
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      color: HomeColors.surfaceLight,
      child: Center(
        child: Icon(
          Icons.place_outlined,
          color: HomeColors.iconSecondary,
          size: 48.sp,
        ),
      ),
    );
  }
}
```

**Step 2: 커밋**

```bash
git add lib/features/home/presentation/widgets/place_card.dart
git commit -m "최신/인기 장소 목록 UI : refactor : PlaceCard 씀 스타일 적용 (직각 보더, 넓은 여백, pill 태그) https://github.com/MapSee-Lab/MapSy-FE/issues/18"
```

---

## Task 3: 상태 위젯 씀 스타일로 수정

**Files:**
- Modify: `lib/features/home/presentation/widgets/home_loading_shimmer.dart`
- Modify: `lib/features/home/presentation/widgets/home_empty_state.dart`
- Modify: `lib/features/home/presentation/widgets/home_error_state.dart`

**Step 1: HomeLoadingShimmer 수정**

변경사항:
- 그리드 스켈레톤 제거 (탭 전환 구조에서 그리드 미사용)
- 카드 스켈레톤만 3개 (직각, 씀 스타일 여백)
- `borderRadius: 12.r` → `0`
- 마진 좌우 16 → 20

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';

/// 홈 화면 로딩 스켈레톤 (씀 스타일)
class HomeLoadingShimmer extends StatelessWidget {
  const HomeLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(3, (_) => _buildCardShimmer()),
    );
  }

  Widget _buildCardShimmer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: HomeColors.shimmerBase,
        border: Border.all(color: HomeColors.cardBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 썸네일 영역 (3:2)
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(color: HomeColors.shimmerHighlight),
          ),
          // 텍스트 영역
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    color: HomeColors.shimmerHighlight,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 12.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: HomeColors.shimmerHighlight,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

**Step 2: HomeEmptyState 수정**

변경사항:
- 아이콘 64sp → 48sp
- `Icons.explore_off_outlined` → `Icons.explore_outlined`
- 아이콘 색상 → `HomeColors.textDisabled` (#BDBDBD)
- 텍스트 15sp → 14sp

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';

/// 빈 상태 위젯 (씀 스타일: 미니멀)
class HomeEmptyState extends StatelessWidget {
  final String message;

  const HomeEmptyState({
    super.key,
    this.message = '아직 등록된 장소가 없습니다',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 48.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.explore_outlined,
              size: 48.sp,
              color: HomeColors.textDisabled,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(
                color: HomeColors.textSecondary,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
```

**Step 3: HomeErrorState 수정**

변경사항:
- 에러 아이콘 제거 (텍스트 중심)
- 재시도 버튼: TextButton → 언더라인 텍스트 스타일
- 텍스트 15sp → 14sp

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';

/// 에러 상태 위젯 (씀 스타일: 텍스트 중심, 아이콘 없음)
class HomeErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const HomeErrorState({
    super.key,
    this.message = '불러오기에 실패했습니다',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 48.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: TextStyle(
                color: HomeColors.textSecondary,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: onRetry,
                child: Text(
                  '다시 시도',
                  style: TextStyle(
                    color: HomeColors.retryButton,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

**Step 4: 커밋**

```bash
git add lib/features/home/presentation/widgets/home_loading_shimmer.dart lib/features/home/presentation/widgets/home_empty_state.dart lib/features/home/presentation/widgets/home_error_state.dart
git commit -m "최신/인기 장소 목록 UI : refactor : 상태 위젯 씀 스타일 적용 (스켈레톤, 빈 상태, 에러) https://github.com/MapSee-Lab/MapSy-FE/issues/18"
```

---

## Task 4: HomePage 탭 전환 구조로 재작성

**Files:**
- Modify: `lib/features/home/presentation/pages/home_page.dart`

**Step 1: HomePage 전체 재작성**

변경사항:
- `ConsumerStatefulWidget` 유지 (무한 스크롤 컨트롤러 필요)
- `SingleTickerProviderStateMixin` 추가 (TabController)
- 2섹션 `CustomScrollView` → `TabBar` + `TabBarView`
- 각 탭은 같은 `PlaceCard` 위젯 사용하는 리스트
- `PopularPlaceTile` import 제거
- 씀 스타일: AppBar elevation 0, 구분선 없음

```dart
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
```

**Step 2: 커밋**

```bash
git add lib/features/home/presentation/pages/home_page.dart
git commit -m "최신/인기 장소 목록 UI : refactor : HomePage 씀 스타일 탭 전환 구조로 재작성 https://github.com/MapSee-Lab/MapSy-FE/issues/18"
```

---

## Task 5: PopularPlaceTile 삭제

**Files:**
- Delete: `lib/features/home/presentation/widgets/popular_place_tile.dart`

**Step 1: 파일 삭제**

탭 전환 구조에서 인기 장소도 PlaceCard를 사용하므로 PopularPlaceTile은 불필요.

```bash
git rm lib/features/home/presentation/widgets/popular_place_tile.dart
```

**Step 2: 커밋**

```bash
git commit -m "최신/인기 장소 목록 UI : refactor : PopularPlaceTile 삭제 (탭 구조에서 PlaceCard 통합 사용) https://github.com/MapSee-Lab/MapSy-FE/issues/18"
```

---

## Task 6: flutter format 실행 및 최종 확인

**Step 1: 포맷팅 실행**

```bash
flutter format lib/common/constants/home_colors.dart lib/features/home/presentation/pages/home_page.dart lib/features/home/presentation/widgets/
```

**Step 2: 변경 있으면 커밋**

```bash
git add -A
git commit -m "최신/인기 장소 목록 UI : style : flutter format 적용 https://github.com/MapSee-Lab/MapSy-FE/issues/18"
```

---

## 구현 순서 요약

| Task | 설명 | 의존성 |
|------|------|--------|
| 1 | HomeColors 라이트 모노톤 교체 | 없음 |
| 2 | PlaceCard 씀 스타일 수정 | Task 1 |
| 3 | 상태 위젯 (로딩/빈/에러) 수정 | Task 1 |
| 4 | HomePage 탭 전환 구조 재작성 | Task 2, 3 |
| 5 | PopularPlaceTile 삭제 | Task 4 |
| 6 | flutter format + 최종 확인 | Task 5 |

```
Task 1 (HomeColors)
  ├──→ Task 2 (PlaceCard)  ──┐
  └──→ Task 3 (상태 위젯)   ──┤
                              ├──→ Task 4 (HomePage) → Task 5 (삭제) → Task 6 (format)
```
