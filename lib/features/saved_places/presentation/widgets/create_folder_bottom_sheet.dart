import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

/// 폴더 생성 바텀시트
Future<Map<String, String>?> showCreateFolderBottomSheet(
  BuildContext context,
) async {
  return showModalBottomSheet<Map<String, String>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: HomeColors.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) => const _CreateFolderSheet(),
  );
}

class _CreateFolderSheet extends StatefulWidget {
  const _CreateFolderSheet();

  @override
  State<_CreateFolderSheet> createState() => _CreateFolderSheetState();
}

class _CreateFolderSheetState extends State<_CreateFolderSheet> {
  final _nameController = TextEditingController();
  String _visibility = 'PRIVATE';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _isValid => _nameController.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 24.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 핸들
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: HomeColors.divider,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // 제목
          Text(
            '새 폴더 만들기',
            style: AppTextStyles.heading02.copyWith(
              color: HomeColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),

          // 폴더 이름 입력
          Text(
            '폴더 이름',
            style: AppTextStyles.callout.copyWith(
              color: HomeColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: _nameController,
            maxLength: 100,
            autofocus: true,
            style: AppTextStyles.paragraph.copyWith(
              color: HomeColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: '폴더 이름을 입력하세요',
              hintStyle: AppTextStyles.paragraph.copyWith(
                color: HomeColors.textDisabled,
              ),
              counterText: '',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: HomeColors.cardBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: HomeColors.cardBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: HomeColors.textPrimary,
                  width: 1.5,
                ),
              ),
            ),
            onChanged: (_) => setState(() {}),
          ),
          SizedBox(height: 16.h),

          // 공개 설정
          Text(
            '공개 설정',
            style: AppTextStyles.callout.copyWith(
              color: HomeColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          _buildVisibilityOption('PRIVATE', '나만 보기'),
          SizedBox(height: 4.h),
          _buildVisibilityOption('SHARED', '공유 가능'),
          SizedBox(height: 24.h),

          // 만들기 버튼
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: _isValid
                  ? () => Navigator.of(context).pop({
                        'name': _nameController.text.trim(),
                        'visibility': _visibility,
                      })
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: HomeColors.textPrimary,
                disabledBackgroundColor: HomeColors.surfaceLight,
                foregroundColor: HomeColors.background,
                disabledForegroundColor: HomeColors.textDisabled,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text('만들기', style: AppTextStyles.label),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisibilityOption(String value, String label) {
    final isSelected = _visibility == value;

    return GestureDetector(
      onTap: () => setState(() => _visibility = value),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              size: 20.sp,
              color: isSelected
                  ? HomeColors.textPrimary
                  : HomeColors.iconSecondary,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: AppTextStyles.paragraph.copyWith(
                color: HomeColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
