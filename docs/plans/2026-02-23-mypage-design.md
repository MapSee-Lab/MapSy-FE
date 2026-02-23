# 마이페이지 설계 문서

## 개요

마이페이지 기능 구현. 프로필 조회/닉네임 수정, 알림 설정, 이용약관, 로그아웃/회원탈퇴를 단일 페이지 + 인라인 수정 방식으로 구현.

**관련 이슈**: https://github.com/MapSee-Lab/MapSy-FE/issues/26

## 화면 구성

### 마이페이지 (MypagePage) - 메인

단일 ScrollView, 3개 섹션:

```
┌─────────────────────────────────┐
│  AppBar: "마이페이지"             │
├─────────────────────────────────┤
│  ┌───────────────────────────┐  │
│  │ 👤  홍길동            >   │  │
│  │     user@gmail.com        │  │
│  └───────────────────────────┘  │
│                                 │
│  ─ 앱 설정 ─────────────────── │
│  알림 설정               [토글] │
│                                 │
│  ─ 정보 ───────────────────── │
│  이용약관                    >  │
│  개인정보처리방침              >  │
│  오픈소스 라이선스             >  │
│  앱 버전                v1.0.41 │
│                                 │
│  ─ 계정 ───────────────────── │
│  로그아웃                       │
│  회원탈퇴                       │
└─────────────────────────────────┘
```

### 닉네임 수정 - 바텀시트

프로필 카드 탭 → 바텀시트:

- 현재 닉네임이 채워진 TextField
- 2~20자, 한글/영문/숫자 검증
- 중복확인은 변경하기 버튼 클릭 시 자동 수행
- 성공 시 바텀시트 닫힘 + 토스트

### 이용약관 / 개인정보처리방침 - 별도 페이지

앱 내 하드코딩 텍스트 표시 (AppBar + 스크롤 텍스트).

### 오픈소스 라이선스

`showLicensePage()` 호출 (별도 구현 불필요).

## 아키텍처

### 파일 구조

```
lib/features/mypage/
├── data/
│   ├── mypage_repository.dart
│   ├── mypage_repository_impl.dart
│   ├── mypage_remote_datasource.dart
│   └── models/
│       ├── profile_update_request.dart
│       └── check_name_response.dart
├── presentation/
│   ├── mypage_provider.dart
│   ├── pages/
│   │   ├── mypage_page.dart (기존 수정)
│   │   ├── terms_page.dart
│   │   └── privacy_policy_page.dart
│   └── widgets/
│       ├── profile_card.dart
│       ├── setting_tile.dart
│       └── nickname_edit_bottom_sheet.dart
```

### 데이터 흐름

1. **마이페이지 진입**: TokenStorage에서 사용자 정보 로드 + SharedPreferences에서 알림 설정 로드
2. **닉네임 수정**: 클라이언트 검증 → GET check-name → POST profile → 상태 갱신
3. **로그아웃/탈퇴**: 확인 다이얼로그 → AuthNotifier 메서드 호출 → 자동 리다이렉트

### 상태 관리

- 사용자 정보: 기존 AuthNotifier의 MemberDto에서 읽기
- 알림 설정: SharedPreferences 로컬 저장
- 닉네임 수정: MypageRepository → API 호출 후 AuthNotifier 상태도 갱신
- 로그아웃/탈퇴: 기존 AuthNotifier 재사용

### 라우팅

```
/mypage                  (기존)
/mypage/terms            (신규)
/mypage/privacy-policy   (신규)
```

## 에러 처리

### 닉네임 수정

| 상황 | 처리 |
|------|------|
| 현재 닉네임과 동일 | 버튼 비활성화 |
| 2자 미만 / 20자 초과 | TextField 하단 에러 텍스트 |
| 특수문자/공백 포함 | TextField 하단 에러 텍스트 |
| 닉네임 중복 | "이미 사용 중인 닉네임입니다" |
| 네트워크 오류 | 토스트 "네트워크 연결을 확인해주세요" |

### 로그아웃 / 회원탈퇴

- 확인 다이얼로그 필수 (회원탈퇴는 빨간색 강조)
- 실패 시 토스트로 에러 안내

### 알림 설정

- 토글 ON: 시스템 알림 권한 확인 → 권한 없으면 설정 앱 안내
- 토글 OFF: SharedPreferences에 즉시 저장

## 구현 범위

### 포함

- 프로필 카드 (닉네임, 이메일 표시)
- 닉네임 수정 바텀시트
- 알림 ON/OFF 토글 1개
- 이용약관 페이지 (앱 내 텍스트)
- 개인정보처리방침 페이지 (앱 내 텍스트)
- 오픈소스 라이선스 (showLicensePage)
- 앱 버전 표시 (package_info_plus)
- 로그아웃 (확인 다이얼로그)
- 회원탈퇴 (확인 다이얼로그)

### 제외 (YAGNI)

- 프로필 이미지
- 성별/생년월일 수정
- 알림 카테고리별 설정
- 다크모드/언어 설정
- 캐시 삭제

## 의존하는 기존 코드 (수정 없이 재사용)

- AuthNotifier: signOut(), withdraw()
- TokenStorage: 사용자 정보 읽기
- AuthInterceptor: 토큰 자동 갱신
- AppColors, HomeColors, AppTextStyles: 디자인 시스템
