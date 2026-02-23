import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../data/models/folder_model.dart';

/// 폴더 탭 바 (가로 스크롤 칩 목록)
class FolderTabBar extends StatelessWidget {
  const FolderTabBar({
    super.key,
    required this.folders,
    required this.selectedFolderId,
    required this.onFolderSelected,
  });

  final List<FolderModel> folders;
  final String? selectedFolderId;
  final ValueChanged<String> onFolderSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: folders.length,
        separatorBuilder: (_, _) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final folder = folders[index];
          final isSelected = folder.id == selectedFolderId;

          return GestureDetector(
            onTap: () => onFolderSelected(folder.id),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? HomeColors.textPrimary
                    : HomeColors.surfaceLight,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    folder.name,
                    style: AppTextStyles.callout.copyWith(
                      color: isSelected
                          ? HomeColors.background
                          : HomeColors.textSecondary,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${folder.placeCount}',
                    style: AppTextStyles.calloutSmall.copyWith(
                      color: isSelected
                          ? HomeColors.background.withValues(alpha: 0.7)
                          : HomeColors.textDisabled,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
