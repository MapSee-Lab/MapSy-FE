# Gender "선택 안 함" UI Change

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Change "선택안함" from a full-width card button (same style as 남성/여성) to a subtle underlined text link, visually differentiating it as a secondary/skip action.

**Architecture:** Replace the `_GenderButton` widget for NOT_SELECTED with a centered underlined text. When selected, the text color changes to primary to indicate active state. This is a single-file change.

**Tech Stack:** Flutter, flutter_screenutil

---

### Task 1: Replace "선택안함" card button with underlined text link

**Files:**
- Modify: `lib/features/onboarding/presentation/pages/gender_step_page.dart:78-84`

**Step 1: Replace the _GenderButton for 선택안함**

Change lines 78-84 from:
```dart
              SizedBox(height: 12.h),
              _GenderButton(
                label: '선택안함',
                icon: Icons.person_outline,
                isSelected: state.gender == Gender.notSelected,
                onTap: () => notifier.setGender(Gender.notSelected),
              ),
```

To:
```dart
              SizedBox(height: 16.h),
              Center(
                child: GestureDetector(
                  onTap: () => notifier.setGender(Gender.notSelected),
                  child: Text(
                    '선택 안 함',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: state.gender == Gender.notSelected
                          ? AppColors.primary
                          : AppColors.gray500,
                      decoration: TextDecoration.underline,
                      decorationColor: state.gender == Gender.notSelected
                          ? AppColors.primary
                          : AppColors.gray500,
                    ),
                  ),
                ),
              ),
```

**Result:** "선택 안 함" appears as a small underlined text link centered below the gender cards. When selected, it turns primary blue. Visually distinct from the card-style 남성/여성 buttons.

---

### Task 2: Verify build

**Step 1: Run flutter analyze**

Run: `cd /Users/luca/workspace/Flutter_Project/mapsy && flutter analyze`
Expected: No errors

---

### Task 3: Commit

```bash
git add lib/features/onboarding/presentation/pages/gender_step_page.dart
git commit -m "온보딩 성별 선택 UI 개선 : refactor : '선택 안 함' 옵션을 카드 버튼에서 언더라인 텍스트로 변경"
```
