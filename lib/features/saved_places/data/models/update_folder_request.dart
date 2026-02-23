import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_folder_request.freezed.dart';
part 'update_folder_request.g.dart';

/// 폴더 수정 요청 DTO
@freezed
class UpdateFolderRequest with _$UpdateFolderRequest {
  const factory UpdateFolderRequest({
    /// 폴더 이름 (선택)
    String? name,

    /// 공개 설정 (선택)
    String? visibility,
  }) = _UpdateFolderRequest;

  factory UpdateFolderRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateFolderRequestFromJson(json);
}

/// 폴더 수정 응답 DTO
@freezed
class UpdateFolderResponse with _$UpdateFolderResponse {
  const factory UpdateFolderResponse({
    required String id,
    required String name,
    required String visibility,
    @Default(false) bool isDefault,
    String? updatedAt,
  }) = _UpdateFolderResponse;

  factory UpdateFolderResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFolderResponseFromJson(json);
}
