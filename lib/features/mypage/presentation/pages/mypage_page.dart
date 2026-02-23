import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

/// 마이페이지 화면 (Placeholder)
class MypagePage extends StatelessWidget {
  const MypagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.background,
      appBar: AppBar(
        backgroundColor: HomeColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          '마이페이지',
          style: AppTextStyles.heading02.copyWith(
            color: HomeColors.textPrimary,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline,
              size: 48.sp,
              color: HomeColors.iconSecondary,
            ),
            SizedBox(height: 16.h),
            Text(
              '마이페이지 준비 중',
              style: AppTextStyles.paragraph.copyWith(
                color: HomeColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
