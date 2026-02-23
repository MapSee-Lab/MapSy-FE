import 'models/create_folder_request.dart';
import 'models/folder_model.dart';
import 'models/folder_place_model.dart';
import 'models/update_folder_request.dart';

/// 저장 장소 / 폴더 Repository 인터페이스
abstract class SavedPlacesRepository {
  /// 폴더 목록 조회
  Future<GetFoldersResponse> getFolders();

  /// 폴더 생성
  Future<CreateFolderResponse> createFolder(CreateFolderRequest request);

  /// 폴더 수정
  Future<UpdateFolderResponse> updateFolder(
    String folderId,
    UpdateFolderRequest request,
  );

  /// 폴더 삭제
  Future<void> deleteFolder(String folderId);

  /// 폴더 내 장소 목록 조회
  Future<GetFolderPlacesResponse> getFolderPlaces(String folderId);

  /// 폴더에 장소 추가
  Future<AddFolderPlaceResponse> addPlaceToFolder(
    String folderId,
    String placeId,
  );

  /// 폴더에서 장소 제거
  Future<void> removePlaceFromFolder(String folderId, String placeId);
}
