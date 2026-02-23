// lib/features/mypage/presentation/pages/mypage_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../../../routing/route_paths.dart';
import '../../../auth/presentation/auth_provider.dart';
import '../mypage_provider.dart';
import '../widgets/nickname_edit_bottom_sheet.dart';
import '../widgets/profile_card.dart';
import '../widgets/setting_tile.dart';

class MypagePage extends ConsumerWidget {
  const MypagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final appVersion = ref.watch(appVersionProvider);
    final notificationSetting = ref.watch(notificationSettingProvider);

    // 사용자 정보 (Firebase User에서)
    final user = authState.valueOrNull;
    final nickname = user?.displayName ?? '사용자';
    final email = user?.email ?? '';

    return Scaffold(
      backgroundColor: HomeColors.background,
      appBar: AppBar(
        backgroundColor: HomeColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          '마이페이지',
          style: AppTextStyles.heading02.copyWith(
            color: HomeColors.textPrimary,
          ),
        ),
      ),
      body: ListView(
        children: [
          // ─── 프로필 카드 ───
          ProfileCard(
            nickname: nickname,
            email: email,
            onTap: () => _onProfileTap(context, ref, nickname),
          ),

          _buildDivider(),

          // ─── 앱 설정 섹션 ───
          _buildSectionTitle('앱 설정'),
          SettingTile(
            title: '알림 설정',
            trailing: Switch.adaptive(
              value: notificationSetting.valueOrNull ?? true,
              onChanged: (_) =>
                  ref.read(notificationSettingProvider.notifier).toggle(),
              activeTrackColor: AppColors.primary,
            ),
          ),

          _buildDivider(),

          // ─── 정보 섹션 ───
          _buildSectionTitle('정보'),
          SettingTile(
            title: '이용약관',
            onTap: () => context.push(RoutePaths.mypageTerms),
          ),
          SettingTile(
            title: '개인정보처리방침',
            onTap: () => context.push(RoutePaths.mypagePrivacyPolicy),
          ),
          SettingTile(
            title: '오픈소스 라이선스',
            onTap: () => showLicensePage(
              context: context,
              applicationName: '맵시',
              applicationVersion: appVersion.valueOrNull ?? '',
            ),
          ),
          SettingTile(
            title: '앱 버전',
            trailing: Text(
              'v${appVersion.valueOrNull ?? '-'}',
              style: AppTextStyles.callout.copyWith(
                color: HomeColors.textSecondary,
              ),
            ),
          ),

          _buildDivider(),

          // ─── 계정 섹션 ───
          _buildSectionTitle('계정'),
          SettingTile(
            title: '로그아웃',
            onTap: () => _onLogout(context, ref),
          ),
          SettingTile(
            title: '회원탈퇴',
            titleColor: AppColors.error,
            onTap: () => _onWithdraw(context, ref),
          ),

          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 16.h, bottom: 4.h),
      child: Text(
        title,
        style: AppTextStyles.callout.copyWith(
          color: HomeColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 8.h,
      color: HomeColors.surfaceLight,
    );
  }

  /// 프로필 카드 탭 → 닉네임 수정 바텀시트
  Future<void> _onProfileTap(
    BuildContext context,
    WidgetRef ref,
    String currentNickname,
  ) async {
    ref.read(nicknameEditorProvider.notifier).reset();

    final result = await showNicknameEditBottomSheet(
      context,
      currentNickname: currentNickname,
    );

    if (result == true && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('닉네임이 변경되었습니다.'),
          duration: Duration(seconds: 2),
        ),
      );
      ref.invalidate(authNotifierProvider);
    }
  }

  /// 로그아웃 확인 다이얼로그
  Future<void> _onLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('로그아웃'),
        content: const Text('로그아웃 하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('로그아웃'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(authNotifierProvider.notifier).signOut();
    }
  }

  /// 회원탈퇴 확인 다이얼로그
  Future<void> _onWithdraw(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('회원탈퇴'),
        content: const Text('정말 탈퇴하시겠습니까?\n모든 데이터가 삭제됩니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('탈퇴하기'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(authNotifierProvider.notifier).withdraw();
    }
  }
}
