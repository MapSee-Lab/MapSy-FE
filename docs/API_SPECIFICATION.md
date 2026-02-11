# Mapsy API 명세서

> OpenAPI 3.1.0 기반 | 최종 업데이트: 2026-02-10
> 소스: `docs/api-docs.json`

---

## 목차

1. [개요](#1-개요)
2. [인증 방식](#2-인증-방식)
3. [인증 API](#3-인증-api)
4. [회원 관리 API](#4-회원-관리-api)
5. [콘텐츠 API](#5-콘텐츠-api)
6. [장소 API](#6-장소-api)
7. [AI 서버 API](#7-ai-서버-api)
8. [공통 스키마](#8-공통-스키마)
9. [에러코드 총정리](#9-에러코드-총정리)

---

## 1. 개요

| 항목 | 값 |
|------|-----|
| **서비스명** | Mapsy |
| **API 버전** | OpenAPI 3.1.0 |
| **Content-Type** | `application/json;charset=UTF-8` |
| **인증 방식** | Bearer Token (JWT) |

### 서버 정보

| 환경 | URL | 설명 |
|------|-----|------|
| Production | (비공개) | 메인 서버 |
| Local | (비공개) | 로컬 서버 |

### API 도메인 분류

| 태그 | 설명 |
|------|------|
| **인증 API** | 회원 인증(소셜 로그인) 관련 API |
| **회원 관리** | 회원 생성, 조회 등의 기능 API |
| **content-controller** | SNS 콘텐츠 관리 API |
| **place-controller** | 장소 관리 API |
| **AI 서버 API** | AI 서버 연동 관련 API |

---

## 2. 인증 방식

### JWT Bearer Token

```
Authorization: Bearer {accessToken}
```

- **AccessToken 유효기간**: 1시간
- **RefreshToken 유효기간**: 7일
- 만료 시 `/api/auth/reissue`로 재발급

### API Key (AI 서버 전용)

```
X-API-Key: {api-key}
```

- AI Webhook Callback 전용 인증

---

## 3. 인증 API

### 3.1 소셜 로그인

```
POST /api/auth/sign-in
```

**인증**: 불필요

#### Request Body (`SignInRequest`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `firebaseIdToken` | `string` | O | Firebase ID Token (클라이언트에서 Firebase 인증 후 전달) |
| `fcmToken` | `string` | X | FCM 푸시 알림 토큰 |
| `deviceType` | `string` | X* | 디바이스 타입. enum: `IOS`, `ANDROID` |
| `deviceId` | `string` | X* | 디바이스 고유 식별자 (UUID) |

> *fcmToken 제공 시 deviceType, deviceId 모두 필수

#### Response (`SignInResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `accessToken` | `string` | 액세스 토큰 |
| `refreshToken` | `string` | 리프레시 토큰 |
| `isFirstLogin` | `boolean` | 첫 로그인 여부 |
| `requiresOnboarding` | `boolean` | 온보딩 필요 여부 |
| `onboardingStep` | `string` | 현재 온보딩 단계 (예: `TERMS`) |

#### 에러코드

| 코드 | 설명 |
|------|------|
| `INVALID_SOCIAL_TOKEN` | 유효하지 않은 소셜 인증 토큰 |
| `SOCIAL_AUTH_FAILED` | 소셜 로그인 인증 실패 |
| `MEMBER_NOT_FOUND` | 회원 정보를 찾을 수 없음 |
| `INVALID_INPUT_VALUE` | FCM 토큰 관련 필드 오류 |

---

### 3.2 토큰 재발급

```
POST /api/auth/reissue
```

**인증**: 불필요

#### Request Body (`ReissueRequest`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `refreshToken` | `string` | O | 리프레시 토큰 |

#### Response (`ReissueResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `accessToken` | `string` | 재발급된 액세스 토큰 |
| `refreshToken` | `string` | 리프레시 토큰 (변경되지 않음) |
| `isFirstLogin` | `boolean` | 첫 로그인 여부 |

#### 에러코드

| 코드 | 설명 |
|------|------|
| `REFRESH_TOKEN_NOT_FOUND` | 리프레시 토큰을 찾을 수 없음 |
| `INVALID_REFRESH_TOKEN` | 유효하지 않은 리프레시 토큰 |
| `EXPIRED_REFRESH_TOKEN` | 만료된 리프레시 토큰 |
| `MEMBER_NOT_FOUND` | 회원 정보를 찾을 수 없음 |

---

### 3.3 로그아웃

```
POST /api/auth/logout
```

**인증**: JWT 필요

#### Headers

| 이름 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `Authorization` | `string` | X | Bearer 토큰 (자동 추출) |

#### Request Body (`AuthRequest`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `socialPlatform` | `string` | X | 로그인 플랫폼. enum: `NORMAL`, `KAKAO`, `GOOGLE` |
| `email` | `string` | X | 이메일 |
| `name` | `string` | X | 닉네임 |
| `profileUrl` | `string` | X | 프로필 URL |
| `fcmToken` | `string` | X | FCM 토큰 |
| `deviceType` | `string` | X | 디바이스 타입. enum: `IOS`, `ANDROID` |
| `deviceId` | `string` | X | 디바이스 고유 식별자 |

#### Response

- **200 OK**: 빈 응답 본문

#### 동작

- 액세스 토큰을 블랙리스트에 등록하여 무효화
- Redis에 저장된 리프레시 토큰 삭제

#### 에러코드

| 코드 | 설명 |
|------|------|
| `INVALID_TOKEN` | 유효하지 않은 토큰 |
| `UNAUTHORIZED` | 인증이 필요한 요청 |

---

### 3.4 회원 탈퇴

```
DELETE /api/auth/withdraw
```

**인증**: JWT 필요

#### Headers

| 이름 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `Authorization` | `string` | X | Bearer 토큰 |

#### Response

- **204 No Content**: 탈퇴 성공

#### 동작

- 소프트 삭제 방식
- 이메일/닉네임에 타임스탬프 추가 (예: `email_2025_01_19_143022`)
- 동일 이메일/닉네임으로 재가입 가능
- 회원의 관심사 함께 소프트 삭제
- AccessToken 블랙리스트 등록, RefreshToken Redis에서 삭제

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |
| `MEMBER_ALREADY_WITHDRAWN` | 이미 탈퇴한 회원 |
| `UNAUTHORIZED` | 인증이 필요 |

---

## 4. 회원 관리 API

### 4.1 전체 회원 목록 조회

```
GET /api/members
```

**인증**: 불필요

#### Response

- **200 OK**: `MemberDto[]` (전체 회원 목록)

> 삭제되지 않은 회원만 조회

---

### 4.2 회원 생성

```
POST /api/members
```

**인증**: 불필요

#### Request Body (`MemberDto`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `email` | `string` | O | 회원 이메일 |
| `name` | `string` | O | 회원 닉네임 (2~50자) |
| `profileImageUrl` | `string` | X | 프로필 이미지 URL |
| `socialPlatform` | `string` | X | 소셜 플랫폼 (`KAKAO`, `GOOGLE`) |
| `memberRole` | `string` | X | 회원 권한 (`ROLE_USER`, `ROLE_ADMIN`) |
| `status` | `string` | X | 회원 상태 (`ACTIVE`, `INACTIVE`, `DELETED`) |

#### Response (`MemberDto`)

`MemberDto` 객체 반환 (8. 공통 스키마 참조)

#### 에러코드

| 코드 | 설명 |
|------|------|
| `EMAIL_ALREADY_EXISTS` | 이미 가입된 이메일 |
| `INVALID_INPUT_VALUE` | 유효하지 않은 입력값 |

---

### 4.3 회원 단건 조회 (ID)

```
GET /api/members/{memberId}
```

**인증**: 불필요

#### Path Parameters

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| `memberId` | `string (uuid)` | O | 회원 ID |

#### Response (`MemberDto`)

`MemberDto` 객체 반환

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |
| `INVALID_INPUT_VALUE` | 유효하지 않은 입력값 |

---

### 4.4 회원 단건 조회 (Email)

```
GET /api/members/email/{email}
```

**인증**: 불필요

#### Path Parameters

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| `email` | `string` | O | 회원 이메일 |

#### Response (`MemberDto`)

`MemberDto` 객체 반환

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |
| `INVALID_INPUT_VALUE` | 유효하지 않은 입력값 |

---

### 4.5 닉네임 중복 확인

```
GET /api/members/check-name
```

**인증**: 불필요

#### Query Parameters

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| `name` | `string` | O | 확인할 닉네임 (2~50자) |

#### Response (`CheckNameResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `isAvailable` | `boolean` | 사용 가능 여부 (`true`: 가능, `false`: 중복) |
| `name` | `string` | 확인한 닉네임 |

#### 에러코드

| 코드 | 설명 |
|------|------|
| `INVALID_NAME_LENGTH` | 닉네임은 2자 이상 50자 이하 |
| `INVALID_INPUT_VALUE` | 유효하지 않은 입력값 |

---

### 4.6 회원 프로필 설정(수정)

```
POST /api/members/profile
```

**인증**: JWT 필요

#### Request Body (`ProfileUpdateRequest`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `name` | `string` | O | 이름 |
| `gender` | `string` | X | 성별. enum: `MALE`, `FEMALE`, `NOT_SELECTED` |
| `birthDate` | `string (date)` | X | 생년월일 (LocalDate) |

#### Response (`MemberDto`)

업데이트된 회원 정보 반환

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |
| `NAME_ALREADY_EXISTS` | 이미 사용 중인 이름 |
| `INVALID_INPUT_VALUE` | 유효하지 않은 입력값 |

---

### 4.7 온보딩 - 약관 동의

```
POST /api/members/onboarding/terms
```

**인증**: JWT 필요

#### Request Body (`UpdateServiceAgreementTermsRequest`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `isServiceTermsAndPrivacyAgreed` | `boolean` | O | 서비스 이용약관 및 개인정보처리방침 동의 |
| `isMarketingAgreed` | `boolean` | X | 마케팅 수신 동의 |

#### Response (`UpdateServiceAgreementTermsResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `currentStep` | `string` | 현재 온보딩 단계. enum: `TERMS`, `BIRTH_DATE`, `GENDER`, `COMPLETED` |
| `onboardingStatus` | `string` | 온보딩 상태 (예: `IN_PROGRESS`) |
| `member` | `MemberDto` | 회원 정보 (디버깅용) |

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |
| `MEMBER_TERMS_REQUIRED_NOT_AGREED` | 필수 약관 미동의 |

---

### 4.8 온보딩 - 생년월일 설정

```
POST /api/members/onboarding/birth-date
```

**인증**: JWT 필요

#### Request Body (`UpdateBirthDateRequest`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `birthDate` | `string (date)` | O | 생년월일 (예: `1990-01-01`) |

#### Response (`OnboardingResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `currentStep` | `string` | 현재 온보딩 단계. enum: `TERMS`, `BIRTH_DATE`, `GENDER`, `COMPLETED` |
| `onboardingStatus` | `string` | 온보딩 상태 |
| `member` | `MemberDto` | 회원 정보 (디버깅용) |

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |
| `INVALID_INPUT_VALUE` | 유효하지 않은 입력값 |

---

### 4.9 온보딩 - 성별 설정

```
POST /api/members/onboarding/gender
```

**인증**: JWT 필요

#### Request Body (`UpdateGenderRequest`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `gender` | `string` | O | 성별. enum: `MALE`, `FEMALE`, `NOT_SELECTED` |

#### Response (`OnboardingResponse`)

`OnboardingResponse` 객체 반환 (4.8과 동일 구조)

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |
| `INVALID_INPUT_VALUE` | 유효하지 않은 입력값 |

---

## 5. 콘텐츠 API

### 5.1 SNS URL로 콘텐츠 생성 및 장소 추출 요청

```
POST /api/content/analyze
```

**인증**: JWT 필요

#### Request Body (`RequestPlaceExtractionRequest`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `snsUrl` | `string` | O | SNS URL (Instagram, YouTube Shorts 등) |

#### Response (`RequestPlaceExtractionResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `contentId` | `string (uuid)` | 생성된 콘텐츠 ID |
| `memberId` | `string (uuid)` | 회원 ID |
| `status` | `string` | 상태. enum: `PENDING`, `ANALYZING`, `COMPLETED`, `FAILED`, `DELETED` |

#### 동작

- SNS URL을 받아 콘텐츠를 생성하고 AI 서버에 장소 추출 요청
- 초기 상태는 `PENDING`
- AI 서버 처리 완료 시 Webhook으로 상태 업데이트

---

### 5.2 단일 SNS 콘텐츠 정보 조회

```
GET /api/content/{contentId}
```

**인증**: JWT 필요

#### Path Parameters

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| `contentId` | `string (uuid)` | O | 콘텐츠 ID |

#### Response (`GetContentInfoResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `content` | `ContentDto` | 콘텐츠 상세 정보 |
| `places` | `PlaceDto[]` | 연관된 장소 목록 (position 순서) |

---

### 5.3 최근 SNS 콘텐츠 목록 조회

```
GET /api/content/recent
```

**인증**: JWT 필요

#### Response (`GetRecentContentResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `contents` | `ContentDto[]` | 최근 10개 콘텐츠 목록 (생성일시 내림차순) |

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |

---

### 5.4 회원 콘텐츠 목록 조회 (페이지네이션)

```
GET /api/content/member
```

**인증**: JWT 필요

#### Query Parameters

| 파라미터 | 타입 | 필수 | 기본값 | 설명 |
|----------|------|------|--------|------|
| `pageSize` | `integer` | X | 10 | 페이지 크기 |

#### Response (`GetMemberContentPageResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `contentPage` | `PageContentDto` | 콘텐츠 페이지 정보 (최신순) |

**PageContentDto 구조:**

| 필드 | 타입 | 설명 |
|------|------|------|
| `content` | `ContentDto[]` | 콘텐츠 목록 |
| `totalElements` | `integer (int64)` | 전체 콘텐츠 개수 |
| `totalPages` | `integer` | 전체 페이지 수 |
| `number` | `integer` | 현재 페이지 번호 (0부터) |
| `size` | `integer` | 페이지 크기 |
| `first` | `boolean` | 첫 페이지 여부 |
| `last` | `boolean` | 마지막 페이지 여부 |
| `empty` | `boolean` | 비어있는지 여부 |

---

### 5.5 최근 장소 목록 조회 (콘텐츠 기반)

```
GET /api/content/place/saved
```

**인증**: JWT 필요

#### Response (`GetSavedPlacesResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `places` | `PlaceDto[]` | 장소 목록 (최신순, 최대 10개) |

> 장소의 사진 URL은 최대 10개까지 반환

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |

---

## 6. 장소 API

### 6.1 장소 세부정보 조회

```
GET /api/place/{placeId}
```

**인증**: JWT 필요

#### Path Parameters

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| `placeId` | `string (uuid)` | O | 장소 ID |

#### Response (`PlaceDetailDto`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `id` | `string (uuid)` | 장소 ID |
| `name` | `string` | 장소명 |
| `address` | `string` | 주소 |
| `country` | `string` | 국가 코드 (ISO 3166-1 alpha-2) |
| `latitude` | `number` | 위도 |
| `longitude` | `number` | 경도 |
| `businessType` | `string` | 업종 |
| `phone` | `string` | 전화번호 |
| `description` | `string` | 장소 설명 |
| `types` | `string[]` | 장소 유형 배열 |
| `businessStatus` | `string` | 영업 상태 |
| `iconUrl` | `string` | Google 아이콘 URL |
| `rating` | `number` | 평점 (0.0~5.0) |
| `userRatingsTotal` | `integer` | 리뷰 수 |
| `photoUrls` | `string[]` | 사진 URL 배열 |
| `platformReferences` | `PlacePlatformReferenceDto[]` | 플랫폼별 참조 정보 |
| `businessHours` | `PlaceBusinessHourDto[]` | 영업시간 목록 |
| `medias` | `PlaceMediaDto[]` | 추가 미디어 목록 |

#### 에러코드

| 코드 | 설명 |
|------|------|
| `PLACE_NOT_FOUND` | 장소를 찾을 수 없음 |

---

### 6.2 장소 저장

```
POST /api/place/{placeId}/save
```

**인증**: JWT 필요

#### Path Parameters

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| `placeId` | `string (uuid)` | O | 저장할 장소 ID |

#### Response (`SavePlaceResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `memberPlaceId` | `string (uuid)` | 회원 장소 ID |
| `placeId` | `string (uuid)` | 장소 ID |
| `savedStatus` | `string` | 저장 상태 (`SAVED`) |
| `savedAt` | `string (date-time)` | 저장 일시 |

#### 동작

- 임시 저장 상태(`TEMPORARY`)의 장소를 저장 상태(`SAVED`)로 변경

#### 에러코드

| 코드 | 설명 |
|------|------|
| `PLACE_NOT_FOUND` | 장소를 찾을 수 없음 |
| `MEMBER_PLACE_NOT_FOUND` | 회원의 장소 정보를 찾을 수 없음 |
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |

---

### 6.3 임시 저장 장소 목록 조회

```
GET /api/place/temporary
```

**인증**: JWT 필요

#### Response (`GetTemporaryPlacesResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `places` | `PlaceDto[]` | 임시 저장 장소 목록 (최신순) |

> AI 분석으로 자동 생성된 장소들. 사용자가 아직 저장 여부를 결정하지 않은 상태

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |

---

### 6.4 저장한 장소 목록 조회

```
GET /api/place/saved
```

**인증**: JWT 필요

#### Response (`GetSavedPlacesResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `places` | `PlaceDto[]` | 저장한 장소 목록 (최신순) |

> MemberPlace 기반 조회. `/api/content/place/saved`와는 다른 조회 방식

#### 에러코드

| 코드 | 설명 |
|------|------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |

---

### 6.5 임시 저장 장소 삭제

```
DELETE /api/place/{placeId}/temporary
```

**인증**: JWT 필요

#### Path Parameters

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| `placeId` | `string (uuid)` | O | 삭제할 장소 ID |

#### Response

- **204 No Content**: 삭제 성공

#### 동작

- 임시 저장 상태(`TEMPORARY`)의 장소만 삭제 가능
- 저장된 상태(`SAVED`)의 장소는 삭제 불가
- Soft Delete 방식

#### 에러코드

| 코드 | 설명 |
|------|------|
| `PLACE_NOT_FOUND` | 장소를 찾을 수 없음 |
| `MEMBER_PLACE_NOT_FOUND` | 회원의 장소 정보를 찾을 수 없음 |
| `CANNOT_DELETE_SAVED_PLACE` | 임시 저장된 장소만 삭제 가능 |
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 |

---

## 7. AI 서버 API

### 7.1 AI 서버 Webhook Callback

```
POST /api/ai/callback
```

**인증**: API Key 필요 (`X-API-Key` 헤더)

#### Headers

| 이름 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `X-API-Key` | `string` | O | API Key |

#### Request Body (`AiCallbackRequest`)

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `contentId` | `string (uuid)` | O | Content UUID |
| `resultStatus` | `string` | O | 처리 결과. enum: `SUCCESS`, `FAILED` |
| `snsInfo` | `SnsInfoCallback` | X* | SNS 콘텐츠 정보 (*SUCCESS 시 필수) |
| `placeDetails` | `PlaceDetailCallback[]` | X | 추출된 장소 상세 목록 |
| `statistics` | `ExtractionStatistics` | X | 추출 처리 통계 |
| `errorMessage` | `string` | X | 실패 사유 (FAILED 시) |

**SnsInfoCallback:**

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `platform` | `string` | O | SNS 플랫폼. enum: `INSTAGRAM`, `YOUTUBE`, `YOUTUBE_SHORTS`, `TIKTOK`, `FACEBOOK`, `TWITTER` |
| `contentType` | `string` | O | 콘텐츠 타입 (예: `reel`) |
| `url` | `string` | O | 원본 SNS URL |
| `author` | `string` | X | 작성자 ID |
| `caption` | `string` | X | 게시물 본문 |
| `likesCount` | `integer` | X | 좋아요 수 |
| `commentsCount` | `integer` | X | 댓글 수 |
| `postedAt` | `string` | X | 게시 날짜 (ISO 8601) |
| `hashtags` | `string[]` | X | 해시태그 리스트 |
| `thumbnailUrl` | `string` | X | 썸네일 URL |
| `imageUrls` | `string[]` | X | 이미지 URL 리스트 |
| `authorProfileImageUrl` | `string` | X | 작성자 프로필 이미지 URL |

**PlaceDetailCallback:**

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `placeId` | `string` | O | 네이버 Place ID |
| `name` | `string` | O | 장소명 |
| `category` | `string` | X | 카테고리 |
| `description` | `string` | X | 한줄 설명 |
| `latitude` | `number (double)` | X | 위도 |
| `longitude` | `number (double)` | X | 경도 |
| `address` | `string` | X | 지번 주소 |
| `roadAddress` | `string` | X | 도로명 주소 |
| `subwayInfo` | `string` | X | 지하철 정보 |
| `directionsText` | `string` | X | 찾아가는 길 |
| `rating` | `number (double)` | X | 별점 (0.0~5.0) |
| `visitorReviewCount` | `integer` | X | 방문자 리뷰 수 |
| `blogReviewCount` | `integer` | X | 블로그 리뷰 수 |
| `businessStatus` | `string` | X | 영업 상태 |
| `businessHours` | `string` | X | 영업 시간 요약 |
| `openHoursDetail` | `string[]` | X | 요일별 상세 영업시간 |
| `holidayInfo` | `string` | X | 휴무일 정보 |
| `phoneNumber` | `string` | X | 전화번호 |
| `homepageUrl` | `string` | X | 홈페이지 URL |
| `naverMapUrl` | `string` | X | 네이버 지도 URL |
| `reservationAvailable` | `boolean` | X | 예약 가능 여부 |
| `amenities` | `string[]` | X | 편의시설 목록 |
| `keywords` | `string[]` | X | 키워드/태그 |
| `tvAppearances` | `string[]` | X | TV 방송 출연 정보 |
| `menuInfo` | `string[]` | X | 대표 메뉴 |
| `imageUrl` | `string` | X | 대표 이미지 URL |
| `imageUrls` | `string[]` | X | 이미지 URL 목록 |

**ExtractionStatistics:**

| 필드 | 타입 | 설명 |
|------|------|------|
| `extractedPlaceNames` | `string[]` | LLM이 추출한 장소명 리스트 |
| `totalExtracted` | `integer` | LLM이 추출한 장소 수 |
| `totalFound` | `integer` | 네이버 지도에서 찾은 장소 수 |
| `failedSearches` | `string[]` | 검색 실패한 장소명 |

#### Response (`AiCallbackResponse`)

| 필드 | 타입 | 설명 |
|------|------|------|
| `received` | `boolean` | 수신 여부 (`true`) |
| `contentId` | `string (uuid)` | Content UUID |

#### 동작

- AI 서버가 장소 추출 분석 완료 후 Webhook 호출
- Content 상태: `ANALYZING` → `COMPLETED` / `FAILED`
- SUCCESS 시:
  - ContentInfo로 Content 메타데이터 업데이트
  - Place 생성 및 Content-Place 연결
  - snsPlatform 값으로 Content.platform 동기화

#### 에러코드

| 코드 | 설명 |
|------|------|
| `INVALID_API_KEY` | 유효하지 않은 API Key |
| `CONTENT_NOT_FOUND` | 콘텐츠를 찾을 수 없음 |
| `INVALID_REQUEST` | 잘못된 요청 |

---

## 8. 공통 스키마

### MemberDto

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `id` | `string (uuid)` | - | 회원 ID |
| `email` | `string` | O | 이메일 |
| `name` | `string` | O | 닉네임 (2~50자) |
| `onboardingStatus` | `string` | - | 온보딩 상태 (예: `NOT_STARTED`) |
| `isServiceTermsAndPrivacyAgreed` | `boolean` | - | 서비스 약관 동의 여부 |
| `isMarketingAgreed` | `boolean` | - | 마케팅 수신 동의 여부 |
| `birthDate` | `string (date)` | O | 생년월일 |
| `gender` | `string` | - | 성별. enum: `MALE`, `FEMALE`, `NOT_SELECTED` |

### ContentDto

| 필드 | 타입 | 설명 |
|------|------|------|
| `id` | `string (uuid)` | 콘텐츠 ID |
| `platform` | `string` | 플랫폼. enum: `INSTAGRAM`, `TIKTOK`, `YOUTUBE`, `YOUTUBE_SHORTS`, `FACEBOOK`, `TWITTER` |
| `status` | `string` | 상태. enum: `PENDING`, `ANALYZING`, `COMPLETED`, `FAILED`, `DELETED` |
| `platformUploader` | `string` | 업로더 이름 |
| `caption` | `string` | 캡션 |
| `thumbnailUrl` | `string` | 썸네일 URL |
| `originalUrl` | `string` | 원본 SNS URL |
| `title` | `string` | 제목 |
| `summary` | `string` | 요약 설명 |
| `lastCheckedAt` | `string (date-time)` | 마지막 확인 시각 |

### PlaceDto

| 필드 | 타입 | 설명 |
|------|------|------|
| `placeId` | `string (uuid)` | 장소 ID |
| `name` | `string` | 장소명 |
| `address` | `string` | 주소 |
| `rating` | `number` | 별점 (0.0~5.0) |
| `userRatingsTotal` | `integer` | 리뷰 수 |
| `photoUrls` | `string[]` | 사진 URL 배열 (최대 10개) |
| `description` | `string` | 장소 요약 설명 |

### PlacePlatformReferenceDto

| 필드 | 타입 | 설명 |
|------|------|------|
| `placePlatform` | `string` | 플랫폼 타입. enum: `NAVER`, `GOOGLE`, `KAKAO` |
| `placePlatformId` | `string` | 플랫폼 장소 ID |

### PlaceBusinessHourDto

| 필드 | 타입 | 설명 |
|------|------|------|
| `weekday` | `string` | 요일. enum: `MON`, `TUE`, `WED`, `THU`, `FRI`, `SAT`, `SUN` |
| `openTime` | `LocalTime` | 오픈 시간 |
| `closeTime` | `LocalTime` | 마감 시간 |

### PlaceMediaDto

| 필드 | 타입 | 설명 |
|------|------|------|
| `id` | `string (uuid)` | 미디어 ID |
| `url` | `string` | 미디어 URL |
| `mimeType` | `string` | MIME 타입 |
| `position` | `integer` | 정렬 순서 |

---

## 9. 에러코드 총정리

### 인증 관련

| 코드 | 설명 | 발생 API |
|------|------|----------|
| `INVALID_SOCIAL_TOKEN` | 유효하지 않은 소셜 인증 토큰 | 소셜 로그인 |
| `SOCIAL_AUTH_FAILED` | 소셜 로그인 인증 실패 | 소셜 로그인 |
| `INVALID_TOKEN` | 유효하지 않은 토큰 | 로그아웃 |
| `UNAUTHORIZED` | 인증이 필요한 요청 | 로그아웃, 회원 탈퇴 |
| `REFRESH_TOKEN_NOT_FOUND` | 리프레시 토큰을 찾을 수 없음 | 토큰 재발급 |
| `INVALID_REFRESH_TOKEN` | 유효하지 않은 리프레시 토큰 | 토큰 재발급 |
| `EXPIRED_REFRESH_TOKEN` | 만료된 리프레시 토큰 | 토큰 재발급 |

### 회원 관련

| 코드 | 설명 | 발생 API |
|------|------|----------|
| `MEMBER_NOT_FOUND` | 회원을 찾을 수 없음 | 대부분 API |
| `EMAIL_ALREADY_EXISTS` | 이미 가입된 이메일 | 회원 생성 |
| `NAME_ALREADY_EXISTS` | 이미 사용 중인 이름 | 프로필 수정 |
| `INVALID_NAME_LENGTH` | 닉네임 길이 오류 (2~50자) | 닉네임 중복 확인 |
| `MEMBER_ALREADY_WITHDRAWN` | 이미 탈퇴한 회원 | 회원 탈퇴 |
| `MEMBER_TERMS_REQUIRED_NOT_AGREED` | 필수 약관 미동의 | 약관 동의 |

### 장소 관련

| 코드 | 설명 | 발생 API |
|------|------|----------|
| `PLACE_NOT_FOUND` | 장소를 찾을 수 없음 | 장소 조회/저장/삭제 |
| `MEMBER_PLACE_NOT_FOUND` | 회원의 장소 정보를 찾을 수 없음 | 장소 저장/삭제 |
| `CANNOT_DELETE_SAVED_PLACE` | 임시 저장 장소만 삭제 가능 | 임시 장소 삭제 |

### AI 서버 관련

| 코드 | 설명 | 발생 API |
|------|------|----------|
| `INVALID_API_KEY` | 유효하지 않은 API Key | AI Callback |
| `CONTENT_NOT_FOUND` | 콘텐츠를 찾을 수 없음 | AI Callback |
| `INVALID_REQUEST` | 잘못된 요청 | AI Callback |

### 공통

| 코드 | 설명 | 발생 API |
|------|------|----------|
| `INVALID_INPUT_VALUE` | 유효하지 않은 입력값 | 전체 |
| `INTERNAL_SERVER_ERROR` | 서버 내부 오류 | 전체 |

---

## API 엔드포인트 요약 (Quick Reference)

| Method | Endpoint | 인증 | 설명 |
|--------|----------|------|------|
| `POST` | `/api/auth/sign-in` | X | 소셜 로그인 |
| `POST` | `/api/auth/reissue` | X | 토큰 재발급 |
| `POST` | `/api/auth/logout` | JWT | 로그아웃 |
| `DELETE` | `/api/auth/withdraw` | JWT | 회원 탈퇴 |
| `GET` | `/api/members` | X | 전체 회원 목록 조회 |
| `POST` | `/api/members` | X | 회원 생성 |
| `GET` | `/api/members/{memberId}` | X | 회원 단건 조회 (ID) |
| `GET` | `/api/members/email/{email}` | X | 회원 단건 조회 (Email) |
| `GET` | `/api/members/check-name` | X | 닉네임 중복 확인 |
| `POST` | `/api/members/profile` | JWT | 프로필 설정/수정 |
| `POST` | `/api/members/onboarding/terms` | JWT | 약관 동의 |
| `POST` | `/api/members/onboarding/birth-date` | JWT | 생년월일 설정 |
| `POST` | `/api/members/onboarding/gender` | JWT | 성별 설정 |
| `POST` | `/api/content/analyze` | JWT | SNS URL 분석 요청 |
| `GET` | `/api/content/{contentId}` | JWT | 콘텐츠 정보 조회 |
| `GET` | `/api/content/recent` | JWT | 최근 콘텐츠 목록 |
| `GET` | `/api/content/member` | JWT | 회원 콘텐츠 목록 |
| `GET` | `/api/content/place/saved` | JWT | 최근 장소 목록 (콘텐츠 기반) |
| `GET` | `/api/place/{placeId}` | JWT | 장소 세부정보 조회 |
| `POST` | `/api/place/{placeId}/save` | JWT | 장소 저장 |
| `GET` | `/api/place/temporary` | JWT | 임시 저장 장소 목록 |
| `GET` | `/api/place/saved` | JWT | 저장한 장소 목록 |
| `DELETE` | `/api/place/{placeId}/temporary` | JWT | 임시 장소 삭제 |
| `POST` | `/api/ai/callback` | API Key | AI Webhook Callback |
