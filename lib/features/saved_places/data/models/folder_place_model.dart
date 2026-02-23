import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/models/place_model.dart';

part 'folder_place_model.freezed.dart';
part 'folder_place_model.g.dart';

/// 폴더 내 장소 목록 응답
@freezed
class GetFolderPlacesResponse with _$GetFolderPlacesResponse {
  const factory GetFolderPlacesResponse({
    required String folderId,
    required String folderName,
    @Default([]) List<PlaceModel> places,
  }) = _GetFolderPlacesResponse;

  factory GetFolderPlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFolderPlacesResponseFromJson(json);
}

/// 폴더에 장소 추가 요청 DTO
@freezed
class AddFolderPlaceRequest with _$AddFolderPlaceRequest {
  const factory AddFolderPlaceRequest({
    required String placeId,
  }) = _AddFolderPlaceRequest;

  factory AddFolderPlaceRequest.fromJson(Map<String, dynamic> json) =>
      _$AddFolderPlaceRequestFromJson(json);
}

/// 폴더에 장소 추가 응답 DTO
@freezed
class AddFolderPlaceResponse with _$AddFolderPlaceResponse {
  const factory AddFolderPlaceResponse({
    required String id,
    required String folderId,
    required String placeId,
    int? position,
    String? createdAt,
  }) = _AddFolderPlaceResponse;

  factory AddFolderPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$AddFolderPlaceResponseFromJson(json);
}
