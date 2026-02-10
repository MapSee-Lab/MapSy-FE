import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/home_colors.dart';

/// 빈 상태 위젯
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
              Icons.explore_off_outlined,
              size: 64.sp,
              color: HomeColors.iconSecondary,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(
                color: HomeColors.textSecondary,
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
