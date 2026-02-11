# Remove Onboarding Back Navigation & Animations

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Remove all backward navigation (back buttons) and slide animations from the onboarding flow. Onboarding is a forward-only flow controlled by `currentStep`.

**Architecture:** Onboarding uses GoRouter with 4 step pages (Terms → BirthDate → Gender → Nickname). Currently each page (except Terms) has a back button and all pages use `_buildOnboardingPage()` for slide animations with `extra: 'back'`/`extra: 'forward'` direction control. We remove all back buttons, remove the custom animation helper, and switch routes from `pageBuilder` to `builder`.

**Tech Stack:** Flutter, GoRouter, Riverpod

---

### Task 1: Remove back buttons from BirthDateStepPage

**Files:**
- Modify: `lib/features/onboarding/presentation/pages/birth_date_step_page.dart:38-45`

**Step 1: Replace AppBar with back button → AppBar without back button**

Change lines 38-45 from:
```dart
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.gray700),
          onPressed: () => context.go(RoutePaths.onboardingTerms, extra: 'back'),
        ),
      ),
```

To:
```dart
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
```

**Step 2: Remove unused import (if `AppColors` is only used by back button icon)**

Check if `AppColors.gray700` is used elsewhere in the file. If so, keep the import. (It is used in other places in this file, so keep it.)

---

### Task 2: Remove back button from GenderStepPage

**Files:**
- Modify: `lib/features/onboarding/presentation/pages/gender_step_page.dart:24-31`

**Step 1: Replace AppBar with back button → AppBar without back button**

Change lines 24-31 from:
```dart
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.gray700),
          onPressed: () => context.go(RoutePaths.onboardingBirthDate, extra: 'back'),
        ),
      ),
```

To:
```dart
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
```

---

### Task 3: Remove back button from NicknameStepPage

**Files:**
- Modify: `lib/features/onboarding/presentation/pages/nickname_step_page.dart:82-89`

**Step 1: Replace AppBar with back button → AppBar without back button**

Change lines 82-89 from:
```dart
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.gray700),
          onPressed: () => context.go(RoutePaths.onboardingGender, extra: 'back'),
        ),
      ),
```

To:
```dart
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
```

---

### Task 4: Remove `extra: 'forward'` from all forward navigation calls

The `extra` parameter is only needed for the slide animation direction. Since we're removing animations, remove `extra` from all `context.go()` calls in onboarding pages.

**Files:**
- Modify: `lib/features/onboarding/presentation/pages/terms_step_page.dart:108`
- Modify: `lib/features/onboarding/presentation/pages/birth_date_step_page.dart:117`
- Modify: `lib/features/onboarding/presentation/pages/gender_step_page.dart:108`

**Step 1: terms_step_page.dart line 108**

Change:
```dart
context.go(RoutePaths.onboardingBirthDate, extra: 'forward');
```
To:
```dart
context.go(RoutePaths.onboardingBirthDate);
```

**Step 2: birth_date_step_page.dart line 117**

Change:
```dart
context.go(RoutePaths.onboardingGender, extra: 'forward');
```
To:
```dart
context.go(RoutePaths.onboardingGender);
```

**Step 3: gender_step_page.dart line 108**

Change:
```dart
context.go(RoutePaths.onboardingNickname, extra: 'forward');
```
To:
```dart
context.go(RoutePaths.onboardingNickname);
```

(nickname_step_page.dart line 218 `context.go(RoutePaths.home)` already has no `extra` - no change needed.)

---

### Task 5: Remove slide animation from router and switch to plain `builder`

**Files:**
- Modify: `lib/router/app_router.dart:141-178` (route definitions)
- Delete: `lib/router/app_router.dart:222-253` (`_buildOnboardingPage` helper + comments)

**Step 1: Replace `pageBuilder` with `builder` for all 4 onboarding routes**

Change lines 141-178 from:
```dart
      // ====================================================================
      // Onboarding Step Routes (슬라이드 전환 애니메이션 적용)
      // ====================================================================
      GoRoute(
        path: RoutePaths.onboardingTerms,
        name: RoutePaths.onboardingTermsName,
        pageBuilder: (context, state) => _buildOnboardingPage(
          state: state,
          child: const TermsStepPage(),
        ),
      ),

      GoRoute(
        path: RoutePaths.onboardingBirthDate,
        name: RoutePaths.onboardingBirthDateName,
        pageBuilder: (context, state) => _buildOnboardingPage(
          state: state,
          child: const BirthDateStepPage(),
        ),
      ),

      GoRoute(
        path: RoutePaths.onboardingGender,
        name: RoutePaths.onboardingGenderName,
        pageBuilder: (context, state) => _buildOnboardingPage(
          state: state,
          child: const GenderStepPage(),
        ),
      ),

      GoRoute(
        path: RoutePaths.onboardingNickname,
        name: RoutePaths.onboardingNicknameName,
        pageBuilder: (context, state) => _buildOnboardingPage(
          state: state,
          child: const NicknameStepPage(),
        ),
      ),
```

To:
```dart
      // ====================================================================
      // Onboarding Step Routes
      // ====================================================================
      GoRoute(
        path: RoutePaths.onboardingTerms,
        name: RoutePaths.onboardingTermsName,
        builder: (context, state) => const TermsStepPage(),
      ),

      GoRoute(
        path: RoutePaths.onboardingBirthDate,
        name: RoutePaths.onboardingBirthDateName,
        builder: (context, state) => const BirthDateStepPage(),
      ),

      GoRoute(
        path: RoutePaths.onboardingGender,
        name: RoutePaths.onboardingGenderName,
        builder: (context, state) => const GenderStepPage(),
      ),

      GoRoute(
        path: RoutePaths.onboardingNickname,
        name: RoutePaths.onboardingNicknameName,
        builder: (context, state) => const NicknameStepPage(),
      ),
```

**Step 2: Delete the `_buildOnboardingPage` helper function**

Delete lines 222-253 (the entire helper function and its surrounding comments):
```dart
// ============================================================================
// 온보딩 슬라이드 전환 애니메이션 헬퍼
// ============================================================================

/// 온보딩 페이지 슬라이드 전환을 생성하는 헬퍼 함수
///
/// [state.extra]가 'back'이면 좌→우 슬라이드, 그 외에는 우→좌 슬라이드
CustomTransitionPage<void> _buildOnboardingPage({
  required GoRouterState state,
  required Widget child,
}) {
  ... (entire function)
}
```

---

### Task 6: Verify build passes

**Step 1: Run flutter analyze**

Run: `cd /Users/luca/workspace/Flutter_Project/mapsy && flutter analyze`
Expected: No errors (warnings OK)

**Step 2: Run build**

Run: `cd /Users/luca/workspace/Flutter_Project/mapsy && flutter build apk --debug 2>&1 | tail -5`
Expected: BUILD SUCCESSFUL

---

### Task 7: Commit

```bash
git add lib/features/onboarding/presentation/pages/birth_date_step_page.dart \
        lib/features/onboarding/presentation/pages/gender_step_page.dart \
        lib/features/onboarding/presentation/pages/nickname_step_page.dart \
        lib/features/onboarding/presentation/pages/terms_step_page.dart \
        lib/router/app_router.dart
git commit -m "온보딩 뒤로가기 및 슬라이드 애니메이션 제거 : refactor : 온보딩 forward-only 흐름으로 변경"
```

---

## Summary of Changes

| File | Change |
|------|--------|
| `birth_date_step_page.dart` | Remove back button (IconButton → automaticallyImplyLeading: false) |
| `gender_step_page.dart` | Remove back button |
| `nickname_step_page.dart` | Remove back button |
| `terms_step_page.dart` | Remove `extra: 'forward'` from navigation |
| `birth_date_step_page.dart` | Remove `extra: 'forward'` from navigation |
| `gender_step_page.dart` | Remove `extra: 'forward'` from navigation |
| `app_router.dart` | `pageBuilder` → `builder` for 4 routes, delete `_buildOnboardingPage()` |
