import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/home_colors.dart';
import '../../data/models/place_model.dart';

/// 인기 장소 타일 (정사각형, 그리드용)
class PopularPlaceTile extends StatelessWidget {
  final PlaceModel place;
  final VoidCallback? onTap;

  const PopularPlaceTile({
    super.key,
    required this.place,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: HomeColors.cardBackground,
          borderRadius: BorderRadius.circular(8.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 썸네일
            _buildThumbnail(),
            // 그라데이션 오버레이
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    HomeColors.cardOverlayStart,
                    HomeColors.cardOverlayEnd,
                  ],
                ),
              ),
            ),
            // 장소명
            Positioned(
              left: 6.w,
              right: 6.w,
              bottom: 6.h,
              child: Text(
                place.placeName,
                style: TextStyle(
                  color: HomeColors.textPrimary,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
          size: 24.sp,
        ),
      ),
    );
  }
}
