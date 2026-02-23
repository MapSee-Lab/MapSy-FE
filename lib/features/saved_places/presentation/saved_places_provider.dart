import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/create_folder_request.dart';
import '../data/models/folder_model.dart';
import '../data/models/update_folder_request.dart';
import '../../../../common/models/place_model.dart';
import '../data/saved_places_repository_impl.dart';

part 'saved_places_provider.freezed.dart';
part 'saved_places_provider.g.dart';

/// 저장 장소 화면 상태
@freezed
class SavedPlacesState with _$SavedPlacesState {
  const factory SavedPlacesState({
    @Default([]) List<FolderModel> folders,
    @Default(false) bool isFoldersLoading,
    String? foldersError,

    String? selectedFolderId,
    @Default([]) List<PlaceModel> places,
    @Default(false) bool isPlacesLoading,
    String? placesError,
  }) = _SavedPlacesState;
}

/// 저장 장소 Notifier
@riverpod
class SavedPlacesNotifier extends _$SavedPlacesNotifier {
  @override
  SavedPlacesState build() {
    return const SavedPlacesState();
  }

  /// 폴더 목록 로드
  Future<void> loadFolders() async {
    state = state.copyWith(isFoldersLoading: true, foldersError: null);

    try {
      final repository = ref.read(savedPlacesRepositoryProvider);
      final response = await repository.getFolders();

      state = state.copyWith(
        folders: response.folders,
        isFoldersLoading: false,
      );

      if (state.selectedFolderId == null && response.folders.isNotEmpty) {
        final defaultFolder = response.folders.firstWhere(
          (f) => f.isDefault,
          orElse: () => response.folders.first,
        );
        selectFolder(defaultFolder.id);
      }
    } catch (e) {
      debugPrint('❌ SavedPlaces: Failed to load folders: $e');
      state = state.copyWith(
        isFoldersLoading: false,
        foldersError: '폴더 목록을 불러올 수 없습니다.',
      );
    }
  }

  /// 폴더 선택 및 해당 폴더의 장소 로드
  Future<void> selectFolder(String folderId) async {
    state = state.copyWith(
      selectedFolderId: folderId,
      isPlacesLoading: true,
      placesError: null,
    );

    try {
      final repository = ref.read(savedPlacesRepositoryProvider);
      final response = await repository.getFolderPlaces(folderId);

      state = state.copyWith(
        places: response.places,
        isPlacesLoading: false,
      );
    } catch (e) {
      debugPrint('❌ SavedPlaces: Failed to load folder places: $e');
      state = state.copyWith(
        isPlacesLoading: false,
        placesError: '장소 목록을 불러올 수 없습니다.',
      );
    }
  }

  /// 폴더 생성
  Future<bool> createFolder({
    required String name,
    String visibility = 'PRIVATE',
  }) async {
    try {
      final repository = ref.read(savedPlacesRepositoryProvider);
      await repository.createFolder(
        CreateFolderRequest(name: name, visibility: visibility),
      );
      await loadFolders();
      return true;
    } catch (e) {
      debugPrint('❌ SavedPlaces: Failed to create folder: $e');
      return false;
    }
  }

  /// 폴더 수정
  Future<bool> updateFolder({
    required String folderId,
    String? name,
    String? visibility,
  }) async {
    try {
      final repository = ref.read(savedPlacesRepositoryProvider);
      await repository.updateFolder(
        folderId,
        UpdateFolderRequest(name: name, visibility: visibility),
      );
      await loadFolders();
      return true;
    } catch (e) {
      debugPrint('❌ SavedPlaces: Failed to update folder: $e');
      return false;
    }
  }

  /// 폴더 삭제
  Future<bool> deleteFolder(String folderId) async {
    try {
      final repository = ref.read(savedPlacesRepositoryProvider);
      await repository.deleteFolder(folderId);
      await loadFolders();
      return true;
    } catch (e) {
      debugPrint('❌ SavedPlaces: Failed to delete folder: $e');
      return false;
    }
  }

  /// 폴더에서 장소 제거
  Future<bool> removePlaceFromFolder(String folderId, String placeId) async {
    try {
      final repository = ref.read(savedPlacesRepositoryProvider);
      await repository.removePlaceFromFolder(folderId, placeId);

      if (state.selectedFolderId == folderId) {
        await selectFolder(folderId);
      }
      await loadFolders();
      return true;
    } catch (e) {
      debugPrint('❌ SavedPlaces: Failed to remove place: $e');
      return false;
    }
  }

  /// 폴더에 장소 추가
  Future<bool> addPlaceToFolder(String folderId, String placeId) async {
    try {
      final repository = ref.read(savedPlacesRepositoryProvider);
      await repository.addPlaceToFolder(folderId, placeId);

      if (state.selectedFolderId == folderId) {
        await selectFolder(folderId);
      }
      await loadFolders();
      return true;
    } catch (e) {
      debugPrint('❌ SavedPlaces: Failed to add place to folder: $e');
      return false;
    }
  }
}
