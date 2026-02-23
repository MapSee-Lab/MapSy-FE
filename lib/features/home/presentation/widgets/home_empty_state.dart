import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';

/// 빈 상태 위젯 (씀 스타일: 미니멀)
class HomeEmptyState extends StatelessWidget {
  final String message;

  const HomeEmptyState({super.key, this.message = '아직 등록된 장소가 없습니다'});

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
