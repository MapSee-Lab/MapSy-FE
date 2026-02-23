import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/spacing_and_radius.dart';
import '../../../../common/constants/text_styles.dart';
import '../../../../common/exceptions/app_exception.dart';
import '../../../../routing/route_paths.dart';
import '../../data/models/sign_in_response.dart';
import '../auth_provider.dart';

/// Google 로그인 화면
///
/// Google Sign-In을 통해 사용자 인증을 수행합니다.
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  /// Google 로그인 버튼 핸들러
  ///
  /// Google 로그인을 수행하고 에러 발생 시 SnackBar를 표시합니다.
  Future<void> _handleGoogleSignIn(BuildContext context, WidgetRef ref) async {
    // AuthNotifier로 로그인 수행 (백엔드 응답 포함)
    final signInResponse = await ref
        .read(authNotifierProvider.notifier)
        .signInWithGoogle();

    // 에러 체크 및 SnackBar 표시
    if (!context.mounted) return;

    final authState = ref.read(authNotifierProvider);

    if (authState.hasError) {
      final errorMessage = authState.error is AuthException
          ? (authState.error as AuthException).message
          : '로그인 중 오류가 발생했습니다.';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage, style: AppTextStyles.toast),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    // 로그인 성공 시 온보딩 여부에 따라 리다이렉트
    if (signInResponse != null) {
      _navigateAfterLogin(context, signInResponse);
    }
  }

  /// Apple 로그인 버튼 핸들러
  ///
  /// Apple 로그인을 수행하고 에러 발생 시 SnackBar를 표시합니다.
  Future<void> _handleAppleSignIn(BuildContext context, WidgetRef ref) async {
    // AuthNotifier로 로그인 수행 (백엔드 응답 포함)
    final signInResponse = await ref
        .read(authNotifierProvider.notifier)
        .signInWithApple();

    // 에러 체크 및 SnackBar 표시
    if (!context.mounted) return;

    final authState = ref.read(authNotifierProvider);

    if (authState.hasError) {
      final errorMessage = authState.error is AuthException
          ? (authState.error as AuthException).message
          : 'Apple 로그인 중 오류가 발생했습니다.';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage, style: AppTextStyles.toast),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    // 로그인 성공 시 온보딩 여부에 따라 리다이렉트
    if (signInResponse != null) {
      _navigateAfterLogin(context, signInResponse);
    }
  }

  /// 로그인 성공 후 네비게이션 처리
  ///
  /// 온보딩 필요 여부에 따라 적절한 화면으로 이동합니다.
  void _navigateAfterLogin(BuildContext context, SignInResponse response) {
    if (response.requiresOnboarding) {
      // 온보딩이 필요한 경우 현재 단계로 이동
      final step = OnboardingStep.fromString(response.onboardingStep);
      switch (step) {
        case OnboardingStep.terms:
          context.go(RoutePaths.onboardingTerms);
          break;
        case OnboardingStep.birthDate:
          context.go(RoutePaths.onboardingBirthDate);
          break;
        case OnboardingStep.gender:
          context.go(RoutePaths.onboardingGender);
          break;
        case OnboardingStep.nickname:
          context.go(RoutePaths.onboardingNickname);
          break;
        case OnboardingStep.completed:
          context.go(RoutePaths.home);
          break;
      }
    } else {
      // 온보딩이 완료된 경우 홈으로 이동
      context.go(RoutePaths.home);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.horizontal20,
          child: Column(
            children: [
              const Spacer(flex: 3),

              ClipRRect(
                borderRadius: AppRadius.xxlarge,
                child: Image.asset(
                  'assets/app_icon.png',
                  width: 120.w,
                  height: 120.w,
                ),
              ),

              const Spacer(flex: 4),

              // Google 로그인 버튼
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: OutlinedButton(
                  onPressed: authState.isLoading
                      ? null
                      : () => _handleGoogleSignIn(context, ref),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.textPrimary,
                    side: const BorderSide(color: AppColors.gray300),
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadius.medium,
                    ),
                  ),
                  child: Text('Google로 계속하기', style: AppTextStyles.label),
                ),
              ),

              // iOS에서만 Apple 로그인 버튼 표시
              if (Platform.isIOS) ...[
                SizedBox(height: AppSpacing.vertical12),
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton.icon(
                    onPressed: authState.isLoading
                        ? null
                        : () => _handleAppleSignIn(context, ref),
                    icon: const Icon(Icons.apple, size: 22),
                    label: Text('Apple로 계속하기', style: AppTextStyles.label),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppRadius.medium,
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],

              if (authState.isLoading)
                Padding(
                  padding: EdgeInsets.only(top: AppSpacing.vertical20),
                  child: const CircularProgressIndicator(),
                ),

              if (authState.hasError && !authState.isLoading)
                Padding(
                  padding: EdgeInsets.only(top: AppSpacing.vertical12),
                  child: Text(
                    authState.error is AuthException
                        ? (authState.error as AuthException).message
                        : '로그인에 실패했습니다.',
                    style: AppTextStyles.callout.copyWith(
                      color: AppColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              SizedBox(height: AppSpacing.vertical16),

              Text(
                '계속 진행하면 서비스 이용약관 및\n개인정보 처리방침에 동의하는 것으로 간주합니다.',
                style: AppTextStyles.calloutSmall.copyWith(
                  color: AppColors.textDisabled,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: AppSpacing.vertical32),
            ],
          ),
        ),
      ),
    );
  }
}
