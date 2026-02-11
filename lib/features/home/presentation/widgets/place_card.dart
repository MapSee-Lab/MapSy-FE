import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/home_colors.dart';
import '../../data/models/place_model.dart';

/// 최신 장소 카드 (16:9 비율)
class PlaceCard extends StatelessWidget {
  final PlaceModel place;
  final VoidCallback? onTap;

  const PlaceCard({
    super.key,
    required this.place,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: HomeColors.cardBackground,
          borderRadius: BorderRadius.circular(12.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일 (16:9)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _buildThumbnail(),
            ),
            // 정보 영역
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 장소명
                  Text(
                    place.placeName,
                    style: TextStyle(
                      color: HomeColors.textPrimary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (place.address != null) ...[
                    SizedBox(height: 4.h),
                    // 주소
                    Text(
                      place.address!,
                      style: TextStyle(
                        color: HomeColors.textSecondary,
                        fontSize: 13.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (place.tags.isNotEmpty) ...[
                    SizedBox(height: 8.h),
                    // 태그
                    Wrap(
                      spacing: 6.w,
                      runSpacing: 4.h,
                      children: place.tags.take(3).map((tag) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: HomeColors.tagBackground,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '#$tag',
                            style: TextStyle(
                              color: HomeColors.tagText,
                              fontSize: 12.sp,
                            ),
                          ),
                        );
                      }).toList(),
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
    if (place.imageUrl != null && place.imageUrl!.isNotEmpty) {
      return Image.network(
        place.imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildPlaceholder(),
      );
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      color: HomeColors.surface,
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
