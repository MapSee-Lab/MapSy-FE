import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_folder_request.freezed.dart';
part 'create_folder_request.g.dart';

/// 폴더 생성 요청 DTO
@freezed
class CreateFolderRequest with _$CreateFolderRequest {
  const factory CreateFolderRequest({
    /// 폴더 이름 (최대 100자)
    required String name,

    /// 공개 설정 (PRIVATE / SHARED)
    @Default('PRIVATE') String visibility,
  }) = _CreateFolderRequest;

  factory CreateFolderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFolderRequestFromJson(json);
}

/// 폴더 생성 응답 DTO
@freezed
class CreateFolderResponse with _$CreateFolderResponse {
  const factory CreateFolderResponse({
    required String id,
    required String name,
    required String visibility,
    @Default(false) bool isDefault,
    String? createdAt,
  }) = _CreateFolderResponse;

  factory CreateFolderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFolderResponseFromJson(json);
}
