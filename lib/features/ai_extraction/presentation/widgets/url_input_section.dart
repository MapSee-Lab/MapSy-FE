import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../../../common/constants/spacing_and_radius.dart';

/// URL 입력 섹션 위젯
class UrlInputSection extends StatelessWidget {
  const UrlInputSection({
    super.key,
    required this.controller,
    required this.onAnalyze,
    required this.isValid,
  });

  final TextEditingController controller;
  final VoidCallback onAnalyze;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            'SNS 링크를 붙여넣어\n장소를 추출해보세요',
            style: AppTextStyles.heading02,
          ),
          SizedBox(height: 8.h),
          Text(
            'Instagram, YouTube 링크를 지원합니다',
            style: AppTextStyles.paragraph.copyWith(
              color: HomeColors.textSecondary,
            ),
          ),
          SizedBox(height: 32.h),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'https://www.instagram.com/p/...',
              hintStyle: AppTextStyles.label.copyWith(
                color: HomeColors.textDisabled,
              ),
              border: OutlineInputBorder(
                borderRadius: AppRadius.large,
                borderSide: BorderSide(color: HomeColors.divider),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: AppRadius.large,
                borderSide: BorderSide(color: HomeColors.divider),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: AppRadius.large,
                borderSide: BorderSide(color: HomeColors.textPrimary, width: 1.5),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              suffixIcon: IconButton(
                onPressed: () async {
                  final data = await Clipboard.getData(Clipboard.kTextPlain);
                  if (data?.text != null) {
                    controller.text = data!.text!;
                  }
                },
                icon: Icon(
                  Icons.content_paste,
                  color: HomeColors.textSecondary,
                  size: 20.sp,
                ),
              ),
            ),
            style: AppTextStyles.label,
            keyboardType: TextInputType.url,
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: isValid ? onAnalyze : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: HomeColors.textPrimary,
                disabledBackgroundColor: HomeColors.divider,
                foregroundColor: HomeColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.large,
                ),
              ),
              child: Text(
                '장소 추출하기',
                style: AppTextStyles.label.copyWith(
                  color: isValid ? HomeColors.background : HomeColors.textDisabled,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
