import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../../../common/models/place_model.dart';

/// 폴더 내 장소 카드
class FolderPlaceCard extends StatelessWidget {
  const FolderPlaceCard({
    super.key,
    required this.place,
    this.onTap,
    this.onRemove,
  });

  final PlaceModel place;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: HomeColors.cardBackground,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: HomeColors.cardBorder, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 장소 이미지
            _buildThumbnail(),
            SizedBox(width: 12.w),

            // 장소 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: AppTextStyles.label.copyWith(
                      color: HomeColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (place.address != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      place.address!,
                      style: AppTextStyles.callout.copyWith(
                        color: HomeColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (place.rating != null) ...[
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 14.sp,
                          color: HomeColors.starRating,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          place.rating!.toStringAsFixed(1),
                          style: AppTextStyles.callout.copyWith(
                            color: HomeColors.textPrimary,
                          ),
                        ),
                        if (place.userRatingsTotal != null) ...[
                          SizedBox(width: 4.w),
                          Text(
                            '(${place.userRatingsTotal})',
                            style: AppTextStyles.calloutSmall.copyWith(
                              color: HomeColors.textSecondary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),

            // 삭제 버튼
            if (onRemove != null)
              GestureDetector(
                onTap: onRemove,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Icon(
                    Icons.close,
                    size: 18.sp,
                    color: HomeColors.iconSecondary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    final hasPhoto = place.photoUrls.isNotEmpty;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 64.w,
        height: 64.w,
        color: HomeColors.surfaceLight,
        child: hasPhoto
            ? Image.network(
                place.photoUrls.first,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _buildPlaceholder(),
              )
            : _buildPlaceholder(),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Center(
      child: Icon(
        Icons.place_outlined,
        size: 28.sp,
        color: HomeColors.iconSecondary,
      ),
    );
  }
}
