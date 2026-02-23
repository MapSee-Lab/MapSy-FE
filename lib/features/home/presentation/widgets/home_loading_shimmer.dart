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
