import 'package:freezed_annotation/freezed_annotation.dart';

import 'gender_request.dart';

part 'profile_request.freezed.dart';
part 'profile_request.g.dart';

/// 프로필 업데이트 요청 모델
///
/// POST /api/members/profile 요청 바디
/// 백엔드 스키마: ProfileUpdateRequest
@freezed
class ProfileRequest with _$ProfileRequest {
  const factory ProfileRequest({
    /// 닉네임
    required String name,

    /// 성별 (MALE, FEMALE, NOT_SELECTED)
    Gender? gender,

    /// 생년월일 (YYYY-MM-DD 형식)
    String? birthDate,
  }) = _ProfileRequest;

  factory ProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestFromJson(json);
}

/// 닉네임 중복 확인 응답 모델
///
/// GET /api/members/check-name?name=xxx
/// 백엔드 스키마: CheckNameResponse
@freezed
class CheckNameResponse with _$CheckNameResponse {
  const factory CheckNameResponse({
    /// 사용 가능 여부
    required bool isAvailable,

    /// 확인한 닉네임
    String? name,
  }) = _CheckNameResponse;

  factory CheckNameResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckNameResponseFromJson(json);
}
