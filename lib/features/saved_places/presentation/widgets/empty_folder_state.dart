import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

/// 빈 폴더 상태 위젯
class EmptyFolderState extends StatelessWidget {
  const EmptyFolderState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_open_outlined,
              size: 56.sp,
              color: HomeColors.iconSecondary,
            ),
            SizedBox(height: 16.h),
            Text(
              '아직 저장된 장소가 없어요',
              style: AppTextStyles.label.copyWith(
                color: HomeColors.textSecondary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'AI 추출로 장소를 저장해보세요',
              style: AppTextStyles.callout.copyWith(
                color: HomeColors.textDisabled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
