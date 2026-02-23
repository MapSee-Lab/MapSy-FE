import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'saved_places_repository.dart';
import 'saved_places_remote_datasource.dart';
import 'models/create_folder_request.dart';
import 'models/folder_model.dart';
import 'models/folder_place_model.dart';
import 'models/update_folder_request.dart';

part 'saved_places_repository_impl.g.dart';

@riverpod
SavedPlacesRepository savedPlacesRepository(Ref ref) {
  final remoteDataSource = ref.watch(savedPlacesRemoteDataSourceProvider);
  return SavedPlacesRepositoryImpl(remoteDataSource);
}

/// 저장 장소 / 폴더 Repository 구현체
class SavedPlacesRepositoryImpl implements SavedPlacesRepository {
  final SavedPlacesRemoteDataSource _remoteDataSource;

  SavedPlacesRepositoryImpl(this._remoteDataSource);

  @override
  Future<GetFoldersResponse> getFolders() async {
    debugPrint('📝 SavedPlacesRepo: Getting folders...');
    return await _remoteDataSource.getFolders();
  }

  @override
  Future<CreateFolderResponse> createFolder(
    CreateFolderRequest request,
  ) async {
    debugPrint('📝 SavedPlacesRepo: Creating folder...');
    return await _remoteDataSource.createFolder(request);
  }

  @override
  Future<UpdateFolderResponse> updateFolder(
    String folderId,
    UpdateFolderRequest request,
  ) async {
    debugPrint('📝 SavedPlacesRepo: Updating folder...');
    return await _remoteDataSource.updateFolder(folderId, request);
  }

  @override
  Future<void> deleteFolder(String folderId) async {
    debugPrint('📝 SavedPlacesRepo: Deleting folder...');
    return await _remoteDataSource.deleteFolder(folderId);
  }

  @override
  Future<GetFolderPlacesResponse> getFolderPlaces(String folderId) async {
    debugPrint('📝 SavedPlacesRepo: Getting folder places...');
    return await _remoteDataSource.getFolderPlaces(folderId);
  }

  @override
  Future<AddFolderPlaceResponse> addPlaceToFolder(
    String folderId,
    String placeId,
  ) async {
    debugPrint('📝 SavedPlacesRepo: Adding place to folder...');
    return await _remoteDataSource.addPlaceToFolder(folderId, placeId);
  }

  @override
  Future<void> removePlaceFromFolder(String folderId, String placeId) async {
    debugPrint('📝 SavedPlacesRepo: Removing place from folder...');
    return await _remoteDataSource.removePlaceFromFolder(folderId, placeId);
  }
}
