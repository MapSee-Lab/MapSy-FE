import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/home_colors.dart';

/// 에러 상태 위젯
class HomeErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const HomeErrorState({
    super.key,
    this.message = '데이터를 불러올 수 없습니다',
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
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: HomeColors.error,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(
                color: HomeColors.textSecondary,
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              SizedBox(height: 16.h),
              TextButton(
                onPressed: onRetry,
                style: TextButton.styleFrom(
                  foregroundColor: HomeColors.retryButton,
                ),
                child: Text(
                  '다시 시도',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
