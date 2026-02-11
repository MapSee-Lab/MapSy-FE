# Fix Nickname Submit Button Not Enabling

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Fix the "완료" button being permanently disabled when user keeps the server-assigned random nickname without changes.

**Architecture:** The bug is a missing `setState()` in `addPostFrameCallback`. On the first `build()`, `_initialNickname` is null, so `_isNicknameChanged` returns true, which requires `nicknameAvailable == true` for `canSubmit` - but it's null. After `addPostFrameCallback` sets `_initialNickname`, no rebuild occurs, so the button stays disabled.

**Tech Stack:** Flutter, Riverpod

---

### Task 1: Add `setState` in `addPostFrameCallback`

**Files:**
- Modify: `lib/features/onboarding/presentation/pages/nickname_step_page.dart:28-38`

**Step 1: Add setState after setting _initialNickname**

Change lines 28-38 from:
```dart
  @override
  void initState() {
    super.initState();
    // 서버에서 배정받은 임시 닉네임으로 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(onboardingNotifierProvider);
      if (state.nickname != null && state.nickname!.isNotEmpty) {
        _controller.text = state.nickname!;
        _initialNickname = state.nickname;
      }
      _focusNode.requestFocus();
    });
  }
```

To:
```dart
  @override
  void initState() {
    super.initState();
    // 서버에서 배정받은 임시 닉네임으로 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(onboardingNotifierProvider);
      if (state.nickname != null && state.nickname!.isNotEmpty) {
        _controller.text = state.nickname!;
        _initialNickname = state.nickname;
      }
      _focusNode.requestFocus();
      setState(() {}); // canSubmit 재계산을 위한 rebuild 트리거
    });
  }
```

**Why this fixes it:**
- First build: `_initialNickname` = null → `_isNicknameChanged` = true → `canSubmit` = false
- addPostFrameCallback: `_initialNickname` = "랜덤닉네임" → `setState()` → rebuild
- Second build: `_isNicknameChanged` = false → `canSubmit` = `nickname.isNotEmpty && isFormatValid` = true → 완료 ENABLED

---

### Task 2: Verify build

Run: `flutter analyze`
Expected: No errors

---

### Task 3: Commit

```bash
git add lib/features/onboarding/presentation/pages/nickname_step_page.dart
git commit -m "온보딩 닉네임 완료 버튼 활성화 버그 수정 : fix : addPostFrameCallback 후 setState 누락으로 canSubmit 재계산 안되던 문제"
```
