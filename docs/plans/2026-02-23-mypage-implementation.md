# 마이페이지 구현 계획

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** 마이페이지에 프로필 조회/닉네임 수정, 알림 설정, 이용약관, 로그아웃/회원탈퇴 기능을 구현한다.

**Architecture:** 단일 페이지(MypagePage) + 인라인 수정(바텀시트) 방식. Feature-first 2-Layer 패턴에 따라 data(API+DTO)와 presentation(UI+상태)을 분리. 기존 AuthNotifier의 signOut/withdraw를 재사용하고, 닉네임 수정만 별도 MypageRepository를 통해 처리.

**Tech Stack:** Flutter 3.9.2, Riverpod 2.6.1 (@riverpod), Freezed 2.5.7, GoRouter 17.0.1, Dio 5.9.0, SharedPreferences, package_info_plus

**관련 이슈:** https://github.com/MapSee-Lab/MapSy-FE/issues/26
**설계 문서:** `docs/plans/2026-02-23-mypage-design.md`

---

## Task 1: Freezed DTO 모델 생성

**Files:**
- Create: `lib/features/mypage/data/models/profile_update_request.dart`
- Create: `lib/features/mypage/data/models/check_name_response.dart`

**Step 1: ProfileUpdateRequest DTO 작성**

```dart
// lib/features/mypage/data/models/profile_update_request.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update_request.freezed.dart';
part 'profile_update_request.g.dart';

@freezed
class ProfileUpdateRequest with _$ProfileUpdateRequest {
  const factory ProfileUpdateRequest({
    required String name,
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);
}
```

**Step 2: CheckNameResponse DTO 작성**

```dart
// lib/features/mypage/data/models/check_name_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_name_response.freezed.dart';
part 'check_name_response.g.dart';

@freezed
class CheckNameResponse with _$CheckNameResponse {
  const factory CheckNameResponse({
    required bool isAvailable,
    required String name,
  }) = _CheckNameResponse;

  factory CheckNameResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckNameResponseFromJson(json);
}
```

**Step 3: build_runner로 코드 생성**

Run: `flutter pub run build_runner build --delete-conflicting-outputs`
Expected: `.freezed.dart` + `.g.dart` 파일 4개 생성

**Step 4: 커밋**

```bash
git add lib/features/mypage/data/models/
git commit -m "프로필 조회/수정 설정 화면 필요 : feat : Freezed DTO 모델 생성 (ProfileUpdateRequest, CheckNameResponse) https://github.com/MapSee-Lab/MapSy-FE/issues/26"
```

---

## Task 2: Data Layer (RemoteDataSource + Repository)

**Files:**
- Create: `lib/features/mypage/data/mypage_remote_datasource.dart`
- Create: `lib/features/mypage/data/mypage_repository.dart`
- Create: `lib/features/mypage/data/mypage_repository_impl.dart`

**Step 1: MypageRemoteDataSource 작성**

```dart
// lib/features/mypage/data/mypage_remote_datasource.dart
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api_endpoints.dart';
import '../../../common/services/api_client.dart';
import 'models/check_name_response.dart';
import 'models/profile_update_request.dart';

part 'mypage_remote_datasource.g.dart';

@riverpod
MypageRemoteDataSource mypageRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return MypageRemoteDataSource(dio);
}

class MypageRemoteDataSource {
  final Dio _dio;

  MypageRemoteDataSource(this._dio);

  /// 닉네임 중복 확인
  /// GET /api/members/check-name?name={name}
  Future<CheckNameResponse> checkName(String name) async {
    debugPrint('📤 Mypage: Checking name availability: $name');

    final response = await _dio.get(
      ApiEndpoints.checkName,
      queryParameters: {'name': name},
    );

    final result = CheckNameResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Name check result: isAvailable=${result.isAvailable}');
    return result;
  }

  /// 프로필 업데이트 (닉네임 변경)
  /// POST /api/members/profile
  Future<void> updateProfile(ProfileUpdateRequest request) async {
    debugPrint('📤 Mypage: Updating profile: ${request.name}');

    await _dio.post(
      ApiEndpoints.memberProfile,
      data: request.toJson(),
    );

    debugPrint('✅ Profile updated successfully');
  }
}
```

**Step 2: MypageRepository 인터페이스 작성**

```dart
// lib/features/mypage/data/mypage_repository.dart
import 'models/check_name_response.dart';

abstract class MypageRepository {
  Future<CheckNameResponse> checkName(String name);
  Future<void> updateNickname(String name);
}
```

**Step 3: MypageRepositoryImpl 구현체 작성**

```dart
// lib/features/mypage/data/mypage_repository_impl.dart
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'mypage_remote_datasource.dart';
import 'mypage_repository.dart';
import 'models/check_name_response.dart';
import 'models/profile_update_request.dart';

part 'mypage_repository_impl.g.dart';

@riverpod
MypageRepository mypageRepository(Ref ref) {
  final remoteDataSource = ref.watch(mypageRemoteDataSourceProvider);
  return MypageRepositoryImpl(remoteDataSource);
}

class MypageRepositoryImpl implements MypageRepository {
  final MypageRemoteDataSource _remoteDataSource;

  MypageRepositoryImpl(this._remoteDataSource);

  @override
  Future<CheckNameResponse> checkName(String name) async {
    debugPrint('📝 MypageRepo: Checking name...');
    return await _remoteDataSource.checkName(name);
  }

  @override
  Future<void> updateNickname(String name) async {
    debugPrint('📝 MypageRepo: Updating nickname...');
    await _remoteDataSource.updateProfile(
      ProfileUpdateRequest(name: name),
    );
  }
}
```

**Step 4: build_runner로 코드 생성**

Run: `flutter pub run build_runner build --delete-conflicting-outputs`
Expected: `.g.dart` 파일 3개 생성 (datasource, repository_impl, + 기존)

**Step 5: 커밋**

```bash
git add lib/features/mypage/data/
git commit -m "프로필 조회/수정 설정 화면 필요 : feat : Data Layer 구현 (RemoteDataSource, Repository) https://github.com/MapSee-Lab/MapSy-FE/issues/26"
```

---

## Task 3: MypageProvider 상태 관리

**Files:**
- Create: `lib/features/mypage/presentation/mypage_provider.dart`

**참고 파일:**
- `lib/features/onboarding/presentation/onboarding_provider.dart` (닉네임 검증 로직 패턴)
- `lib/features/auth/presentation/auth_provider.dart` (AuthNotifier 재사용)

**Step 1: MypageProvider 작성**

```dart
// lib/features/mypage/presentation/mypage_provider.dart
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../auth/presentation/auth_provider.dart';
import '../data/mypage_repository_impl.dart';
import '../data/mypage_repository.dart';

part 'mypage_provider.g.dart';

/// 알림 설정 키
const _notificationEnabledKey = 'notification_enabled';

/// 앱 버전 Provider
@riverpod
Future<String> appVersion(Ref ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

/// 알림 설정 Provider
@riverpod
class NotificationSetting extends _$NotificationSetting {
  @override
  FutureOr<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_notificationEnabledKey) ?? true;
  }

  Future<void> toggle() async {
    final current = state.valueOrNull ?? true;
    final newValue = !current;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationEnabledKey, newValue);

    state = AsyncValue.data(newValue);
  }
}

/// 닉네임 수정 Provider
@riverpod
class NicknameEditor extends _$NicknameEditor {
  static const int _minLength = 2;
  static const int _maxLength = 20;
  static final RegExp _nicknameRegex = RegExp(r'^[가-힣a-zA-Z0-9]+$');

  @override
  NicknameEditState build() {
    return const NicknameEditState();
  }

  MypageRepository get _repository => ref.read(mypageRepositoryProvider);

  /// 닉네임 유효성 검증
  String? validate(String nickname) {
    if (nickname.isEmpty) return '닉네임을 입력해주세요.';
    if (nickname.length < _minLength) return '닉네임은 ${_minLength}자 이상이어야 합니다.';
    if (nickname.length > _maxLength) return '닉네임은 ${_maxLength}자 이하여야 합니다.';
    if (nickname.contains(' ')) return '닉네임에 공백을 사용할 수 없습니다.';
    if (!_nicknameRegex.hasMatch(nickname)) return '닉네임은 한글, 영문, 숫자만 사용할 수 있습니다.';
    return null;
  }

  /// 닉네임 변경 (중복확인 + 프로필 업데이트를 한 번에)
  Future<bool> updateNickname(String newNickname, String currentNickname) async {
    // 같은 닉네임이면 무시
    if (newNickname == currentNickname) return false;

    // 클라이언트 유효성 검증
    final error = validate(newNickname);
    if (error != null) {
      state = state.copyWith(errorMessage: error);
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      // 1. 중복 확인
      final checkResult = await _repository.checkName(newNickname);
      if (!checkResult.isAvailable) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: '이미 사용 중인 닉네임입니다.',
        );
        return false;
      }

      // 2. 프로필 업데이트
      await _repository.updateNickname(newNickname);

      state = state.copyWith(isLoading: false);
      debugPrint('✅ Nickname updated: $newNickname');
      return true;
    } catch (e) {
      debugPrint('❌ Nickname update failed: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: '닉네임 변경에 실패했습니다. 다시 시도해주세요.',
      );
      return false;
    }
  }

  /// 에러 초기화
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  /// 상태 초기화
  void reset() {
    state = const NicknameEditState();
  }
}

/// 닉네임 수정 상태 (Freezed 없이 간단하게)
class NicknameEditState {
  final bool isLoading;
  final String? errorMessage;

  const NicknameEditState({
    this.isLoading = false,
    this.errorMessage,
  });

  NicknameEditState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return NicknameEditState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
```

**Step 2: build_runner로 코드 생성**

Run: `flutter pub run build_runner build --delete-conflicting-outputs`
Expected: `mypage_provider.g.dart` 생성

**Step 3: 커밋**

```bash
git add lib/features/mypage/presentation/mypage_provider.dart
git commit -m "프로필 조회/수정 설정 화면 필요 : feat : MypageProvider 상태 관리 구현 https://github.com/MapSee-Lab/MapSy-FE/issues/26"
```

---

## Task 4: 공통 위젯 (SettingTile, ProfileCard)

**Files:**
- Create: `lib/features/mypage/presentation/widgets/setting_tile.dart`
- Create: `lib/features/mypage/presentation/widgets/profile_card.dart`

**Step 1: SettingTile 위젯 작성**

```dart
// lib/features/mypage/presentation/widgets/setting_tile.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

/// 마이페이지 설정 항목 위젯
///
/// [title]: 항목 이름
/// [onTap]: 탭 이벤트 (null이면 탭 비활성화)
/// [trailing]: 우측 위젯 (없으면 chevron 아이콘)
/// [titleColor]: 텍스트 색상 (기본: textPrimary)
class SettingTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? titleColor;

  const SettingTile({
    super.key,
    required this.title,
    this.onTap,
    this.trailing,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.paragraph.copyWith(
                  color: titleColor ?? HomeColors.textPrimary,
                ),
              ),
            ),
            if (trailing != null)
              trailing!
            else if (onTap != null)
              Icon(
                Icons.chevron_right,
                color: HomeColors.iconSecondary,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}
```

**Step 2: ProfileCard 위젯 작성**

```dart
// lib/features/mypage/presentation/widgets/profile_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

/// 프로필 카드 위젯
///
/// 닉네임과 이메일을 표시하고, 탭하면 닉네임 수정 바텀시트를 연다.
class ProfileCard extends StatelessWidget {
  final String nickname;
  final String email;
  final VoidCallback onTap;

  const ProfileCard({
    super.key,
    required this.nickname,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            // 프로필 아이콘
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.gray100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                color: AppColors.gray400,
                size: 28.sp,
              ),
            ),
            SizedBox(width: 16.w),
            // 닉네임 + 이메일
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nickname,
                    style: AppTextStyles.subHeading.copyWith(
                      color: HomeColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    email,
                    style: AppTextStyles.callout.copyWith(
                      color: HomeColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            // 화살표
            Icon(
              Icons.chevron_right,
              color: HomeColors.iconSecondary,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
```

**Step 3: 커밋**

```bash
git add lib/features/mypage/presentation/widgets/setting_tile.dart lib/features/mypage/presentation/widgets/profile_card.dart
git commit -m "프로필 조회/수정 설정 화면 필요 : feat : 공통 위젯 구현 (SettingTile, ProfileCard) https://github.com/MapSee-Lab/MapSy-FE/issues/26"
```

---

## Task 5: 닉네임 수정 바텀시트

**Files:**
- Create: `lib/features/mypage/presentation/widgets/nickname_edit_bottom_sheet.dart`

**참고 파일:**
- `lib/features/onboarding/presentation/pages/nickname_step_page.dart` (닉네임 UI 패턴)

**Step 1: NicknameEditBottomSheet 작성**

```dart
// lib/features/mypage/presentation/widgets/nickname_edit_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../mypage_provider.dart';

/// 닉네임 수정 바텀시트를 표시
Future<bool?> showNicknameEditBottomSheet(
  BuildContext context, {
  required String currentNickname,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: HomeColors.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (context) => NicknameEditBottomSheet(
      currentNickname: currentNickname,
    ),
  );
}

class NicknameEditBottomSheet extends ConsumerStatefulWidget {
  final String currentNickname;

  const NicknameEditBottomSheet({
    super.key,
    required this.currentNickname,
  });

  @override
  ConsumerState<NicknameEditBottomSheet> createState() =>
      _NicknameEditBottomSheetState();
}

class _NicknameEditBottomSheetState
    extends ConsumerState<NicknameEditBottomSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentNickname);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isChanged =>
      _controller.text.trim() != widget.currentNickname;

  Future<void> _onSubmit() async {
    final notifier = ref.read(nicknameEditorProvider.notifier);
    final success = await notifier.updateNickname(
      _controller.text.trim(),
      widget.currentNickname,
    );

    if (success && mounted) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final editState = ref.watch(nicknameEditorProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 24.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '닉네임 변경',
                style: AppTextStyles.heading02.copyWith(
                  color: HomeColors.textPrimary,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  color: HomeColors.textSecondary,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // 입력 필드
          TextField(
            controller: _controller,
            autofocus: true,
            maxLength: 20,
            onChanged: (_) => setState(() {}),
            style: TextStyle(fontSize: 16.sp, color: AppColors.gray900),
            decoration: InputDecoration(
              hintText: '닉네임 입력 (2-20자)',
              hintStyle: TextStyle(color: AppColors.gray400, fontSize: 16.sp),
              filled: true,
              fillColor: AppColors.gray50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: editState.errorMessage != null
                      ? AppColors.error
                      : AppColors.primary,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              counterText: '',
            ),
          ),

          // 에러 메시지
          if (editState.errorMessage != null) ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.error, color: AppColors.error, size: 16.sp),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    editState.errorMessage!,
                    style: TextStyle(fontSize: 12.sp, color: AppColors.error),
                  ),
                ),
              ],
            ),
          ],

          SizedBox(height: 20.h),

          // 변경하기 버튼
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: _isChanged && !editState.isLoading ? _onSubmit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor: AppColors.gray200,
                foregroundColor: Colors.white,
                disabledForegroundColor: AppColors.gray400,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: editState.isLoading
                  ? SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      '변경하기',
                      style: AppTextStyles.label.copyWith(color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
```

**Step 2: 커밋**

```bash
git add lib/features/mypage/presentation/widgets/nickname_edit_bottom_sheet.dart
git commit -m "프로필 조회/수정 설정 화면 필요 : feat : 닉네임 수정 바텀시트 구현 https://github.com/MapSee-Lab/MapSy-FE/issues/26"
```

---

## Task 6: 이용약관 & 개인정보처리방침 페이지

**Files:**
- Create: `lib/features/mypage/presentation/pages/terms_page.dart`
- Create: `lib/features/mypage/presentation/pages/privacy_policy_page.dart`

**Step 1: TermsPage 작성**

```dart
// lib/features/mypage/presentation/pages/terms_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.background,
      appBar: AppBar(
        backgroundColor: HomeColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          '이용약관',
          style: AppTextStyles.heading02.copyWith(
            color: HomeColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Text(
          _termsText,
          style: AppTextStyles.paragraph.copyWith(
            color: HomeColors.textPrimary,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}

const _termsText = '''
제1조 (목적)
이 약관은 맵시(이하 "회사")가 제공하는 서비스의 이용과 관련하여 회사와 이용자 간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.

제2조 (정의)
1. "서비스"란 회사가 제공하는 AI 기반 장소 추출 플랫폼을 말합니다.
2. "이용자"란 이 약관에 따라 회사가 제공하는 서비스를 받는 자를 말합니다.
3. "콘텐츠"란 이용자가 서비스를 이용하면서 생성하거나 저장한 모든 정보를 말합니다.

제3조 (약관의 효력 및 변경)
1. 이 약관은 서비스 화면에 게시하거나 기타의 방법으로 이용자에게 공지함으로써 효력이 발생합니다.
2. 회사는 필요한 경우 관련 법령에 위배되지 않는 범위 안에서 이 약관을 개정할 수 있습니다.

제4조 (서비스의 제공)
1. 회사는 다음과 같은 서비스를 제공합니다.
   - SNS URL 기반 AI 장소 추출 서비스
   - 장소 정보 저장 및 관리 서비스
   - 기타 회사가 정하는 서비스

제5조 (이용자의 의무)
1. 이용자는 서비스를 이용할 때 다음 행위를 하여서는 안 됩니다.
   - 타인의 정보를 도용하는 행위
   - 서비스의 운영을 방해하는 행위
   - 기타 관련 법령에 위반되는 행위

제6조 (개인정보 보호)
회사는 이용자의 개인정보를 보호하기 위해 개인정보처리방침을 수립하고 이를 준수합니다.

제7조 (면책사항)
1. 회사는 천재지변 등 불가항력으로 서비스를 제공할 수 없는 경우 책임이 면제됩니다.
2. 회사는 이용자의 귀책사유로 인한 서비스 이용 장애에 대해 책임을 지지 않습니다.
''';
```

**Step 2: PrivacyPolicyPage 작성**

```dart
// lib/features/mypage/presentation/pages/privacy_policy_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.background,
      appBar: AppBar(
        backgroundColor: HomeColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          '개인정보처리방침',
          style: AppTextStyles.heading02.copyWith(
            color: HomeColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Text(
          _privacyPolicyText,
          style: AppTextStyles.paragraph.copyWith(
            color: HomeColors.textPrimary,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}

const _privacyPolicyText = '''
1. 개인정보의 수집 및 이용 목적
맵시(이하 "회사")는 다음의 목적을 위하여 개인정보를 처리합니다.
- 회원 가입 및 관리
- 서비스 제공 및 운영
- 서비스 개선 및 개발

2. 수집하는 개인정보의 항목
- 필수: 이메일, 닉네임, 성별, 생년월일
- 선택: 마케팅 수신 동의 여부
- 자동 수집: 기기 정보, 접속 로그

3. 개인정보의 보유 및 이용 기간
- 회원 탈퇴 시까지 보유 (탈퇴 후 즉시 파기)
- 관련 법령에 따른 보존이 필요한 경우 해당 기간 동안 보유

4. 개인정보의 파기
회사는 개인정보 보유 기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.

5. 이용자의 권리
이용자는 언제든지 자신의 개인정보에 대해 열람, 수정, 삭제, 처리 정지를 요청할 수 있습니다.

6. 개인정보의 안전성 확보 조치
회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취합니다.
- 개인정보의 암호화
- 접근 권한 관리
- 보안 프로그램 설치 및 운영

7. 개인정보 보호책임자
성명: 맵시 개인정보 보호팀
이메일: privacy@mapsee.com
''';
```

**Step 3: 커밋**

```bash
git add lib/features/mypage/presentation/pages/terms_page.dart lib/features/mypage/presentation/pages/privacy_policy_page.dart
git commit -m "프로필 조회/수정 설정 화면 필요 : feat : 이용약관 및 개인정보처리방침 페이지 구현 https://github.com/MapSee-Lab/MapSy-FE/issues/26"
```

---

## Task 7: 라우팅 업데이트

**Files:**
- Modify: `lib/routing/route_paths.dart`
- Modify: `lib/routing/app_router.dart`

**Step 1: route_paths.dart에 마이페이지 하위 경로 추가**

`route_paths.dart` 의 마이페이지 경로 아래에 추가:

```dart
// 기존 mypage 아래에 추가
/// 마이페이지 - 이용약관
static const String mypageTerms = '/mypage/terms';

/// 마이페이지 - 개인정보처리방침
static const String mypagePrivacyPolicy = '/mypage/privacy-policy';

// Route Names 섹션에 추가
static const String mypageTermsName = 'mypage-terms';
static const String mypagePrivacyPolicyName = 'mypage-privacy-policy';
```

**Step 2: app_router.dart에 하위 라우트 등록**

`app_router.dart`의 마이페이지 StatefulShellBranch에 하위 라우트 추가:

```dart
// 기존 import에 추가
import '../features/mypage/presentation/pages/terms_page.dart';
import '../features/mypage/presentation/pages/privacy_policy_page.dart';

// Tab 4: 마이페이지 - GoRoute에 routes 추가
StatefulShellBranch(
  navigatorKey: mypageNavigatorKey,
  routes: [
    GoRoute(
      path: RoutePaths.mypage,
      name: RoutePaths.mypageName,
      builder: (context, state) => const MypagePage(),
      routes: [
        GoRoute(
          path: 'terms',
          name: RoutePaths.mypageTermsName,
          builder: (context, state) => const TermsPage(),
        ),
        GoRoute(
          path: 'privacy-policy',
          name: RoutePaths.mypagePrivacyPolicyName,
          builder: (context, state) => const PrivacyPolicyPage(),
        ),
      ],
    ),
  ],
),
```

**Step 3: 커밋**

```bash
git add lib/routing/route_paths.dart lib/routing/app_router.dart
git commit -m "프로필 조회/수정 설정 화면 필요 : feat : 마이페이지 하위 라우트 등록 (이용약관, 개인정보처리방침) https://github.com/MapSee-Lab/MapSy-FE/issues/26"
```

---

## Task 8: MypagePage 메인 화면 구현

**Files:**
- Modify: `lib/features/mypage/presentation/pages/mypage_page.dart`

**참고:** 현재 플레이스홀더 상태이므로 전체 교체.

**Step 1: MypagePage 전체 교체**

```dart
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
              activeColor: AppColors.primary,
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
    // 바텀시트 열기 전 에러 상태 초기화
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
      // AuthNotifier 상태 갱신을 위해 invalidate
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
```

**Step 2: build_runner 실행 (모든 .g.dart 재생성)**

Run: `flutter pub run build_runner build --delete-conflicting-outputs`

**Step 3: 커밋**

```bash
git add lib/features/mypage/presentation/pages/mypage_page.dart
git commit -m "프로필 조회/수정 설정 화면 필요 : feat : MypagePage 메인 화면 구현 https://github.com/MapSee-Lab/MapSy-FE/issues/26"
```

---

## Task 9: 빌드 검증 및 최종 커밋

**Step 1: 전체 build_runner 실행**

Run: `flutter pub run build_runner build --delete-conflicting-outputs`
Expected: 에러 없이 완료

**Step 2: Flutter 분석 실행**

Run: `flutter analyze`
Expected: 에러 없음 (warning은 허용)

**Step 3: 문제 수정**

import 경로, 타입 에러 등 발견되면 수정

**Step 4: 최종 커밋 (필요시)**

```bash
git add -A
git commit -m "프로필 조회/수정 설정 화면 필요 : fix : 빌드 에러 수정 https://github.com/MapSee-Lab/MapSy-FE/issues/26"
```

---

## 구현 순서 요약

| Task | 내용 | 의존성 |
|------|------|--------|
| 1 | Freezed DTO 모델 | 없음 |
| 2 | Data Layer (DataSource + Repository) | Task 1 |
| 3 | MypageProvider 상태 관리 | Task 2 |
| 4 | 공통 위젯 (SettingTile, ProfileCard) | 없음 |
| 5 | 닉네임 수정 바텀시트 | Task 3 |
| 6 | 이용약관 & 개인정보처리방침 페이지 | 없음 |
| 7 | 라우팅 업데이트 | Task 6 |
| 8 | MypagePage 메인 화면 | Task 3, 4, 5, 7 |
| 9 | 빌드 검증 | Task 8 |
