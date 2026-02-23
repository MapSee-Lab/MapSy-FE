import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../../../routing/route_paths.dart';
import '../../data/models/folder_model.dart';
import '../saved_places_provider.dart';

/// 마이페이지용 폴더 미리보기 섹션
class FolderPreviewSection extends ConsumerStatefulWidget {
  const FolderPreviewSection({super.key});

  @override
  ConsumerState<FolderPreviewSection> createState() =>
      _FolderPreviewSectionState();
}

class _FolderPreviewSectionState extends ConsumerState<FolderPreviewSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(savedPlacesNotifierProvider);
      if (state.folders.isEmpty && !state.isFoldersLoading) {
        ref.read(savedPlacesNotifierProvider.notifier).loadFolders();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(savedPlacesNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 섹션 헤더
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 12.w, top: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '내 폴더',
                style: AppTextStyles.callout.copyWith(
                  color: HomeColors.textSecondary,
                ),
              ),
              GestureDetector(
                onTap: () => context.push(RoutePaths.mypageSavedPlaces),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '전체보기',
                        style: AppTextStyles.callout.copyWith(
                          color: HomeColors.textSecondary,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.chevron_right,
                        size: 16.sp,
                        color: HomeColors.iconSecondary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),

        // 폴더 칩 목록
        if (state.isFoldersLoading)
          _buildLoading()
        else if (state.folders.isEmpty)
          _buildEmpty()
        else
          _buildFolderChips(state.folders),

        SizedBox(height: 8.h),
      ],
    );
  }

  Widget _buildLoading() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        children: List.generate(
          3,
          (index) => Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Container(
              width: 80.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: HomeColors.shimmerBase,
                borderRadius: BorderRadius.circular(18.r),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return GestureDetector(
      onTap: () => context.push(RoutePaths.mypageSavedPlaces),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Text(
          'AI 추출로 장소를 저장해보세요',
          style: AppTextStyles.callout.copyWith(
            color: HomeColors.textDisabled,
          ),
        ),
      ),
    );
  }

  Widget _buildFolderChips(List<FolderModel> folders) {
    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: folders.length,
        separatorBuilder: (_, _) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final folder = folders[index];
          return GestureDetector(
            onTap: () => context.push(RoutePaths.mypageSavedPlaces),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: HomeColors.surfaceLight,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (folder.isDefault)
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Icon(
                        Icons.folder_special_outlined,
                        size: 14.sp,
                        color: HomeColors.textSecondary,
                      ),
                    ),
                  Text(
                    folder.name,
                    style: AppTextStyles.callout.copyWith(
                      color: HomeColors.textPrimary,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${folder.placeCount}',
                    style: AppTextStyles.calloutSmall.copyWith(
                      color: HomeColors.textSecondary,
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
