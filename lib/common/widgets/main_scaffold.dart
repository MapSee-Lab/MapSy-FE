import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../constants/home_colors.dart';
import '../../routing/route_paths.dart';

/// 메인 네비게이션 셸 (하단 네비게이션 바 + FAB)
///
/// StatefulShellRoute의 builder에서 사용되며,
/// 4탭(홈/검색/지도/마이) + 중앙 FAB(AI 추출) 구조를 제공합니다.
class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      floatingActionButton: SizedBox(
        width: 56.w,
        height: 56.w,
        child: FloatingActionButton(
          onPressed: () {
            context.push(RoutePaths.aiExtraction);
          },
          elevation: 2,
          backgroundColor: HomeColors.textPrimary,
          foregroundColor: HomeColors.background,
          shape: const CircleBorder(),
          child: Icon(Icons.add, size: 28.sp),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: _BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}

/// 하단 네비게이션 바 (4탭 + 중앙 FAB 공간)
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HomeColors.background,
        border: Border(
          top: const BorderSide(color: HomeColors.divider, width: 1),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 56.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: '홈',
                isSelected: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavItem(
                icon: Icons.search,
                activeIcon: Icons.search,
                label: '검색',
                isSelected: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              SizedBox(width: 56.w), // FAB 공간
              _NavItem(
                icon: Icons.map_outlined,
                activeIcon: Icons.map,
                label: '지도',
                isSelected: currentIndex == 2,
                onTap: () => onTap(2),
              ),
              _NavItem(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: '마이',
                isSelected: currentIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 네비게이션 아이템 (아이콘 + 라벨)
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color =
        isSelected ? HomeColors.textPrimary : HomeColors.iconSecondary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              size: 24.sp,
              color: color,
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
