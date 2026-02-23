import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

class ProfileCard extends StatelessWidget {
  final String nickname;
  final String email;
  final VoidCallback onTap;

  const ProfileCard({
    super.key,
    required this.nickname,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.gray100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                color: AppColors.gray400,
                size: 28.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nickname,
                    style: AppTextStyles.subHeading.copyWith(
                      color: HomeColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    email,
                    style: AppTextStyles.callout.copyWith(
                      color: HomeColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: HomeColors.iconSecondary,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
