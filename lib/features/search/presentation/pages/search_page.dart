import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

/// 검색 화면 (Placeholder)
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.background,
      appBar: AppBar(
        backgroundColor: HomeColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          '검색',
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
              Icons.search,
              size: 48.sp,
              color: HomeColors.iconSecondary,
            ),
            SizedBox(height: 16.h),
            Text(
              '검색 화면 준비 중',
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
