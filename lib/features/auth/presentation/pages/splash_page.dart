import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/route_paths.dart';
import '../../data/onboarding_step.dart';
import '../auth_provider.dart';

/// 앱 시작 시 초기 화면
///
/// 2초간 Splash 화면을 표시한 후 자동으로 적절한 화면으로 리다이렉트합니다.
/// - 비인증: login 화면으로 이동
/// - 인증 + 온보딩 미완료: onboarding 화면으로 이동
/// - 인증 + 온보딩 완료: home 화면으로 이동
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  /// 인증 상태를 확인하고 적절한 화면으로 이동
  Future<void> _navigateToNextScreen() async {
    // 최소 2초간 스플래시 표시
    await Future.delayed(const Duration(seconds: 2));

    // Widget이 여전히 마운트되어 있는지 확인 (메모리 누수 방지)
    if (!mounted) return;

    try {
      final authNotifier = ref.read(authNotifierProvider.notifier);

      // 1. 저장된 토큰으로 자동 로그인 시도
      final hasValidTokens = await authNotifier.tryAutoLogin();
      debugPrint('🔐 Auto-login check: hasValidTokens=$hasValidTokens');

      if (!mounted) return;

      if (!hasValidTokens) {
        // 토큰이 없거나 유효하지 않음 → 로그인 화면으로
        debugPrint('🔀 Navigating to login (no valid tokens)');
        context.go(RoutePaths.login);
        return;
      }

      // 2. 온보딩 필요 여부 확인
      final requiresOnboarding = await authNotifier.checkRequiresOnboarding();
      debugPrint('📋 Onboarding check: requiresOnboarding=$requiresOnboarding');

      if (!mounted) return;

      if (!requiresOnboarding) {
        // 온보딩 완료됨 → 홈 화면으로
        debugPrint('🔀 Navigating to home (onboarding completed)');
        context.go(RoutePaths.home);
        return;
      }

      // 3. 온보딩 미완료 → 현재 온보딩 단계로 이동
      final currentStep = await authNotifier.getCurrentOnboardingStep();
      debugPrint('📋 Current onboarding step: $currentStep');

      if (!mounted) return;

      if (currentStep != null && currentStep != OnboardingStep.completed) {
        // 해당 온보딩 단계로 이동
        final routePath = currentStep.toRoutePath();
        debugPrint('🔀 Navigating to onboarding step: $routePath');
        context.go(routePath);
      } else {
        // 단계를 알 수 없으면 약관 동의부터 시작
        debugPrint('🔀 Navigating to onboarding terms (default)');
        context.go(RoutePaths.onboardingTerms);
      }
    } catch (e) {
      // 에러 발생 시 로그인 화면으로 이동
      debugPrint('❌ Splash navigation error: $e');
      if (mounted) {
        context.go(RoutePaths.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Splash')));
  }
}
