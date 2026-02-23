import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../../../common/models/place_model.dart';

/// 장소 카드 (씀 스타일: 직각 보더, 넓은 여백)
class PlaceCard extends StatelessWidget {
  final PlaceModel place;
  final VoidCallback? onTap;

  const PlaceCard({super.key, required this.place, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: HomeColors.cardBackground,
          border: Border.all(color: HomeColors.cardBorder, width: 1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일 (3:2)
            AspectRatio(aspectRatio: 3 / 2, child: _buildThumbnail()),
            // 정보 영역
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 장소명
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
                      style: AppTextStyles.paragraph.copyWith(
                        color: HomeColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (place.rating != null) ...[
                    SizedBox(height: 8.h),
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
                            fontWeight: FontWeight.w500,
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
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    if (place.photoUrls.isNotEmpty) {
      return Image.network(
        place.photoUrls.first,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _buildPlaceholder(),
      );
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      color: HomeColors.surfaceLight,
      child: Center(
        child: Icon(
          Icons.place_outlined,
          color: HomeColors.iconSecondary,
          size: 48.sp,
        ),
      ),
    );
  }
}
