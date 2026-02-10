import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/home_colors.dart';

/// 홈 화면 로딩 스켈레톤
class HomeLoadingShimmer extends StatelessWidget {
  const HomeLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 최신 장소 스켈레톤 (카드 3개)
        ...List.generate(3, (_) => _buildCardShimmer()),
        SizedBox(height: 24.h),
        // 인기 장소 섹션 타이틀 스켈레톤
        _buildSectionTitleShimmer(),
        SizedBox(height: 12.h),
        // 인기 장소 그리드 스켈레톤
        _buildGridShimmer(),
      ],
    );
  }

  Widget _buildCardShimmer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: HomeColors.shimmerBase,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          // 썸네일 영역
          Container(
            height: 180.h,
            decoration: BoxDecoration(
              color: HomeColors.shimmerHighlight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            ),
          ),
          // 텍스트 영역
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16.h,
                  width: 160.w,
                  color: HomeColors.shimmerHighlight,
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 12.h,
                  width: 120.w,
                  color: HomeColors.shimmerHighlight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitleShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 20.h,
        width: 140.w,
        color: HomeColors.shimmerHighlight,
      ),
    );
  }

  Widget _buildGridShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.w,
          mainAxisSpacing: 4.w,
        ),
        itemCount: 6,
        itemBuilder: (_, __) => Container(
          decoration: BoxDecoration(
            color: HomeColors.shimmerHighlight,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
