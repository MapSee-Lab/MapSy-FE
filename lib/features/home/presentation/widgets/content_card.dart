import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../data/models/content_response.dart';

/// 콘텐츠 카드 (홈 피드용)
class ContentCard extends StatelessWidget {
  final ContentItemModel content;
  final VoidCallback? onTap;

  const ContentCard({super.key, required this.content, this.onTap});

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
            if (content.thumbnailUrl != null)
              AspectRatio(aspectRatio: 3 / 2, child: _buildThumbnail()),

            // 정보 영역
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 플랫폼 + 상태 배지
                  Row(
                    children: [
                      if (content.platform != null)
                        _buildPlatformBadge(content.platform!),
                      if (content.status != null) ...[
                        SizedBox(width: 6.w),
                        _buildStatusBadge(content.status!),
                      ],
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // 제목 또는 캡션
                  Text(
                    content.title ?? content.caption ?? '제목 없음',
                    style: AppTextStyles.label.copyWith(
                      color: HomeColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // 요약
                  if (content.summary != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      content.summary!,
                      style: AppTextStyles.paragraph.copyWith(
                        color: HomeColors.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // 업로더
                  if (content.platformUploader != null) ...[
                    SizedBox(height: 8.h),
                    Text(
                      '@${content.platformUploader}',
                      style: AppTextStyles.callout.copyWith(
                        color: HomeColors.textSecondary,
                      ),
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
    return Image.network(
      content.thumbnailUrl!,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: HomeColors.surfaceLight,
      child: Center(
        child: Icon(
          Icons.article_outlined,
          color: HomeColors.iconSecondary,
          size: 48.sp,
        ),
      ),
    );
  }

  Widget _buildPlatformBadge(String platform) {
    final icon = switch (platform.toUpperCase()) {
      'INSTAGRAM' => Icons.camera_alt_outlined,
      'YOUTUBE' => Icons.play_circle_outline,
      _ => Icons.language,
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: HomeColors.tagBackground,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.sp, color: HomeColors.tagText),
          SizedBox(width: 4.w),
          Text(
            platform,
            style: AppTextStyles.calloutSmall.copyWith(
              color: HomeColors.tagText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final (label, color) = switch (status.toUpperCase()) {
      'COMPLETED' => ('완료', HomeColors.textPrimary),
      'ANALYZING' => ('분석 중', HomeColors.textSecondary),
      'PENDING' => ('대기 중', HomeColors.textSecondary),
      'FAILED' => ('실패', HomeColors.error),
      _ => (status, HomeColors.textSecondary),
    };

    return Text(
      label,
      style: AppTextStyles.calloutSmall.copyWith(color: color),
    );
  }
}
