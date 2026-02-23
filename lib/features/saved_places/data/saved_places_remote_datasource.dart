import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api_endpoints.dart';
import '../../../common/services/api_client.dart';
import 'models/create_folder_request.dart';
import 'models/folder_model.dart';
import 'models/folder_place_model.dart';
import 'models/update_folder_request.dart';

part 'saved_places_remote_datasource.g.dart';

@riverpod
SavedPlacesRemoteDataSource savedPlacesRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return SavedPlacesRemoteDataSource(dio);
}

/// 저장 장소 / 폴더 Remote DataSource
class SavedPlacesRemoteDataSource {
  final Dio _dio;

  SavedPlacesRemoteDataSource(this._dio);

  /// 폴더 목록 조회
  /// GET /api/folders
  Future<GetFoldersResponse> getFolders() async {
    debugPrint('📤 SavedPlaces: Fetching folders');

    final response = await _dio.get(ApiEndpoints.folders);

    final result = GetFoldersResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Folders fetched: ${result.folders.length}개');
    return result;
  }

  /// 폴더 생성
  /// POST /api/folders
  Future<CreateFolderResponse> createFolder(CreateFolderRequest request) async {
    debugPrint('📤 SavedPlaces: Creating folder: ${request.name}');

    final response = await _dio.post(
      ApiEndpoints.folders,
      data: request.toJson(),
    );

    final result = CreateFolderResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Folder created: id=${result.id}');
    return result;
  }

  /// 폴더 수정
  /// PUT /api/folders/{folderId}
  Future<UpdateFolderResponse> updateFolder(
    String folderId,
    UpdateFolderRequest request,
  ) async {
    debugPrint('📤 SavedPlaces: Updating folder: $folderId');

    final response = await _dio.put(
      ApiEndpoints.folderDetail(folderId),
      data: request.toJson(),
    );

    final result = UpdateFolderResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Folder updated: id=${result.id}');
    return result;
  }

  /// 폴더 삭제
  /// DELETE /api/folders/{folderId}
  Future<void> deleteFolder(String folderId) async {
    debugPrint('📤 SavedPlaces: Deleting folder: $folderId');

    await _dio.delete(ApiEndpoints.folderDetail(folderId));

    debugPrint('✅ Folder deleted: $folderId');
  }

  /// 폴더 내 장소 목록 조회
  /// GET /api/folders/{folderId}/places
  Future<GetFolderPlacesResponse> getFolderPlaces(String folderId) async {
    debugPrint('📤 SavedPlaces: Fetching places for folder: $folderId');

    final response = await _dio.get(ApiEndpoints.folderPlaces(folderId));

    final result = GetFolderPlacesResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Folder places fetched: ${result.places.length}개');
    return result;
  }

  /// 폴더에 장소 추가
  /// POST /api/folders/{folderId}/places
  Future<AddFolderPlaceResponse> addPlaceToFolder(
    String folderId,
    String placeId,
  ) async {
    debugPrint('📤 SavedPlaces: Adding place $placeId to folder $folderId');

    final request = AddFolderPlaceRequest(placeId: placeId);
    final response = await _dio.post(
      ApiEndpoints.folderPlaces(folderId),
      data: request.toJson(),
    );

    final result = AddFolderPlaceResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Place added to folder: ${result.id}');
    return result;
  }

  /// 폴더에서 장소 제거
  /// DELETE /api/folders/{folderId}/places/{placeId}
  Future<void> removePlaceFromFolder(String folderId, String placeId) async {
    debugPrint('📤 SavedPlaces: Removing place $placeId from folder $folderId');

    await _dio.delete(ApiEndpoints.folderPlaceDetail(folderId, placeId));

    debugPrint('✅ Place removed from folder');
  }
}
