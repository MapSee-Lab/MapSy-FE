import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request.freezed.dart';
part 'auth_request.g.dart';

/// 인증 요청 DTO (로그아웃/회원탈퇴 등에서 사용)
///
/// 백엔드 AuthRequest 스키마에 대응하는 모델입니다.
/// 모든 필드가 선택이지만, 서버에서 request body 자체는 필수입니다.
@freezed
class AuthRequest with _$AuthRequest {
  const factory AuthRequest({
    /// 로그인 플랫폼 (GOOGLE, KAKAO, NORMAL)
    String? socialPlatform,

    /// 소셜 로그인 이메일
    String? email,

    /// 소셜 로그인 닉네임
    String? name,

    /// 프로필 이미지 URL
    String? profileUrl,

    /// FCM 푸시 알림 토큰
    String? fcmToken,

    /// 디바이스 타입 (IOS, ANDROID)
    String? deviceType,

    /// 디바이스 고유 식별자 (UUID)
    String? deviceId,
  }) = _AuthRequest;

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
}
