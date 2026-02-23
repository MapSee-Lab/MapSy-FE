import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';

/// 에러 상태 위젯 (씀 스타일: 텍스트 중심, 아이콘 없음)
class HomeErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const HomeErrorState({
    super.key,
    this.message = '불러오기에 실패했습니다',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 48.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: TextStyle(
                color: HomeColors.textSecondary,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: onRetry,
                child: Text(
                  '다시 시도',
                  style: TextStyle(
                    color: HomeColors.retryButton,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
