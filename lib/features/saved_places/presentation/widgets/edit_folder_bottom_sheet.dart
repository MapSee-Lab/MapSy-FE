import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../data/models/folder_model.dart';

/// 폴더 편집 바텀시트 (수정 + 삭제)
Future<EditFolderResult?> showEditFolderBottomSheet(
  BuildContext context, {
  required FolderModel folder,
}) async {
  return showModalBottomSheet<EditFolderResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: HomeColors.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) => _EditFolderSheet(folder: folder),
  );
}

/// 폴더 편집 결과
class EditFolderResult {
  final EditFolderAction action;
  final String? name;
  final String? visibility;

  EditFolderResult.update({this.name, this.visibility})
      : action = EditFolderAction.update;
  EditFolderResult.delete()
      : action = EditFolderAction.delete,
        name = null,
        visibility = null;
}

enum EditFolderAction { update, delete }

class _EditFolderSheet extends StatefulWidget {
  const _EditFolderSheet({required this.folder});

  final FolderModel folder;

  @override
  State<_EditFolderSheet> createState() => _EditFolderSheetState();
}

class _EditFolderSheetState extends State<_EditFolderSheet> {
  late final TextEditingController _nameController;
  late String _visibility;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.folder.name);
    _visibility = widget.folder.visibility;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _isValid => _nameController.text.trim().isNotEmpty;

  bool get _hasChanges =>
      _nameController.text.trim() != widget.folder.name ||
      _visibility != widget.folder.visibility;

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
            '폴더 수정',
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

          // 수정 버튼
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: _isValid && _hasChanges
                  ? () {
                      final result = EditFolderResult.update(
                        name: _nameController.text.trim() !=
                                widget.folder.name
                            ? _nameController.text.trim()
                            : null,
                        visibility: _visibility != widget.folder.visibility
                            ? _visibility
                            : null,
                      );
                      Navigator.of(context).pop(result);
                    }
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
              child: Text('수정하기', style: AppTextStyles.label),
            ),
          ),

          // 삭제 버튼 (기본 폴더가 아닌 경우만)
          if (!widget.folder.isDefault) ...[
            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: TextButton(
                onPressed: () => _onDelete(context),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.error,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text('폴더 삭제', style: AppTextStyles.label),
              ),
            ),
          ],
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

  Future<void> _onDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('폴더 삭제'),
        content: Text(
          '\'${widget.folder.name}\' 폴더를 삭제하시겠습니까?\n폴더 안의 장소 연결도 함께 삭제됩니다.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('삭제'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      Navigator.of(context).pop(EditFolderResult.delete());
    }
  }
}
