import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../../../common/constants/spacing_and_radius.dart';
import '../../../../common/models/place_model.dart';

/// 장소 결과 + 선택 + 저장 위젯
class PlaceResultSection extends StatelessWidget {
  const PlaceResultSection({
    super.key,
    required this.places,
    required this.selectedPlaceIds,
    required this.onTogglePlace,
    required this.onToggleAll,
    required this.onSave,
    required this.isSaving,
    required this.saveProgress,
  });

  final List<PlaceModel> places;
  final Set<String> selectedPlaceIds;
  final ValueChanged<String> onTogglePlace;
  final VoidCallback onToggleAll;
  final VoidCallback onSave;
  final bool isSaving;
  final double saveProgress;

  @override
  Widget build(BuildContext context) {
    final isAllSelected = selectedPlaceIds.length == places.length;

    return Column(
      children: [
        // 헤더: 추출 결과 + 전체선택
        Padding(
          padding: AppPadding.horizontal20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                '${places.length}개의 장소를 찾았어요',
                style: AppTextStyles.subHeading,
              ),
              SizedBox(height: 4.h),
              Text(
                '저장할 장소를 선택하세요',
                style: AppTextStyles.paragraph.copyWith(
                  color: HomeColors.textSecondary,
                ),
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: onToggleAll,
                child: Row(
                  children: [
                    Icon(
                      isAllSelected
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: isAllSelected
                          ? HomeColors.textPrimary
                          : HomeColors.textDisabled,
                      size: 22.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      isAllSelected ? '전체 해제' : '전체 선택',
                      style: AppTextStyles.paragraph.copyWith(
                        color: HomeColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Divider(color: HomeColors.divider, height: 1),
            ],
          ),
        ),

        // 장소 리스트
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            itemCount: places.length,
            separatorBuilder: (_, _) => Divider(
              color: HomeColors.divider,
              height: 1,
              indent: 20.w,
              endIndent: 20.w,
            ),
            itemBuilder: (context, index) {
              final place = places[index];
              final isSelected = selectedPlaceIds.contains(place.placeId);

              return _PlaceSelectItem(
                place: place,
                isSelected: isSelected,
                onTap: () => onTogglePlace(place.placeId),
              );
            },
          ),
        ),

        // 하단 저장 버튼
        Container(
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 12.h),
          decoration: BoxDecoration(
            color: HomeColors.background,
            border: Border(
              top: BorderSide(color: HomeColors.divider, width: 1),
            ),
          ),
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: selectedPlaceIds.isNotEmpty && !isSaving
                    ? onSave
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: HomeColors.textPrimary,
                  disabledBackgroundColor: HomeColors.divider,
                  foregroundColor: HomeColors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.large,
                  ),
                ),
                child: isSaving
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.w,
                              color: HomeColors.background,
                              value: saveProgress > 0 ? saveProgress : null,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '저장 중...',
                            style: AppTextStyles.label.copyWith(
                              color: HomeColors.background,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        '${selectedPlaceIds.length}개 장소 저장하기',
                        style: AppTextStyles.label.copyWith(
                          color: selectedPlaceIds.isNotEmpty
                              ? HomeColors.background
                              : HomeColors.textDisabled,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 장소 선택 아이템
class _PlaceSelectItem extends StatelessWidget {
  const _PlaceSelectItem({
    required this.place,
    required this.isSelected,
    required this.onTap,
  });

  final PlaceModel place;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected
                  ? HomeColors.textPrimary
                  : HomeColors.textDisabled,
              size: 24.sp,
            ),
            SizedBox(width: 12.w),
            ClipRRect(
              borderRadius: AppRadius.medium,
              child: Container(
                width: 56.w,
                height: 56.w,
                color: HomeColors.shimmerBase,
                child: place.photoUrls.isNotEmpty
                    ? Image.network(
                        place.photoUrls.first,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Icon(
                          Icons.place,
                          color: HomeColors.textDisabled,
                          size: 24.sp,
                        ),
                      )
                    : Icon(
                        Icons.place,
                        color: HomeColors.textDisabled,
                        size: 24.sp,
                      ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: AppTextStyles.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (place.address != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      place.address!,
                      style: AppTextStyles.callout.copyWith(
                        color: HomeColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (place.description != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      place.description!,
                      style: AppTextStyles.callout.copyWith(
                        color: HomeColors.textDisabled,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
