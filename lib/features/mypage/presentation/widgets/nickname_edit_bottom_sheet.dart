// lib/features/mypage/presentation/widgets/nickname_edit_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../mypage_provider.dart';

/// 닉네임 수정 바텀시트를 표시
Future<bool?> showNicknameEditBottomSheet(
  BuildContext context, {
  required String currentNickname,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: HomeColors.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (context) => NicknameEditBottomSheet(
      currentNickname: currentNickname,
    ),
  );
}

class NicknameEditBottomSheet extends ConsumerStatefulWidget {
  final String currentNickname;

  const NicknameEditBottomSheet({
    super.key,
    required this.currentNickname,
  });

  @override
  ConsumerState<NicknameEditBottomSheet> createState() =>
      _NicknameEditBottomSheetState();
}

class _NicknameEditBottomSheetState
    extends ConsumerState<NicknameEditBottomSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentNickname);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isChanged =>
      _controller.text.trim() != widget.currentNickname;

  Future<void> _onSubmit() async {
    final notifier = ref.read(nicknameEditorProvider.notifier);
    final success = await notifier.updateNickname(
      _controller.text.trim(),
      widget.currentNickname,
    );

    if (success && mounted) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final editState = ref.watch(nicknameEditorProvider);

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
          // 헤더
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '닉네임 변경',
                style: AppTextStyles.heading02.copyWith(
                  color: HomeColors.textPrimary,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  color: HomeColors.textSecondary,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // 입력 필드
          TextField(
            controller: _controller,
            autofocus: true,
            maxLength: 20,
            onChanged: (_) => setState(() {}),
            style: AppTextStyles.label.copyWith(color: AppColors.gray900),
            decoration: InputDecoration(
              hintText: '닉네임 입력 (2-20자)',
              hintStyle: AppTextStyles.label.copyWith(color: AppColors.gray400),
              filled: true,
              fillColor: AppColors.gray50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: editState.errorMessage != null
                      ? AppColors.error
                      : AppColors.primary,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              counterText: '',
            ),
          ),

          // 에러 메시지
          if (editState.errorMessage != null) ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.error, color: AppColors.error, size: 16.sp),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    editState.errorMessage!,
                    style: AppTextStyles.calloutSmall.copyWith(color: AppColors.error),
                  ),
                ),
              ],
            ),
          ],

          SizedBox(height: 20.h),

          // 변경하기 버튼
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: _isChanged && !editState.isLoading ? _onSubmit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor: AppColors.gray200,
                foregroundColor: Colors.white,
                disabledForegroundColor: AppColors.gray400,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: editState.isLoading
                  ? SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      '변경하기',
                      style: AppTextStyles.label.copyWith(color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
