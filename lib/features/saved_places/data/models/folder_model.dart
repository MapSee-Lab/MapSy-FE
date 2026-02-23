import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_model.freezed.dart';
part 'folder_model.g.dart';

/// 폴더 DTO (목록 조회용)
@freezed
class FolderModel with _$FolderModel {
  const factory FolderModel({
    /// 폴더 ID
    required String id,

    /// 폴더 이름
    required String name,

    /// 공개 설정 (PRIVATE / SHARED)
    required String visibility,

    /// 썸네일 URL
    String? thumbnailUrl,

    /// 기본 폴더 여부
    @Default(false) bool isDefault,

    /// 폴더 내 장소 수
    @Default(0) int placeCount,

    /// 생성일시
    String? createdAt,
  }) = _FolderModel;

  factory FolderModel.fromJson(Map<String, dynamic> json) =>
      _$FolderModelFromJson(json);
}

/// 폴더 목록 응답
@freezed
class GetFoldersResponse with _$GetFoldersResponse {
  const factory GetFoldersResponse({
    @Default([]) List<FolderModel> folders,
  }) = _GetFoldersResponse;

  factory GetFoldersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFoldersResponseFromJson(json);
}
