import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

/// AI 분석 중 위젯 (로딩 애니메이션)
class AnalyzingSection extends StatelessWidget {
  const AnalyzingSection({
    super.key,
    required this.onCancel,
  });

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 64.w,
            height: 64.w,
            child: CircularProgressIndicator(
              strokeWidth: 3.w,
              color: HomeColors.textPrimary,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'AI가 장소를 추출하고 있어요',
            style: AppTextStyles.subHeading,
          ),
          SizedBox(height: 8.h),
          Text(
            '잠시만 기다려주세요...',
            style: AppTextStyles.paragraph.copyWith(
              color: HomeColors.textSecondary,
            ),
          ),
          SizedBox(height: 32.h),
          TextButton(
            onPressed: onCancel,
            child: Text(
              '취소',
              style: AppTextStyles.paragraph.copyWith(
                color: HomeColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
