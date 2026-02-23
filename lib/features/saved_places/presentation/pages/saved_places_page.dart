import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../data/models/folder_model.dart';
import '../saved_places_provider.dart';
import '../widgets/create_folder_bottom_sheet.dart';
import '../widgets/edit_folder_bottom_sheet.dart';
import '../widgets/empty_folder_state.dart';
import '../widgets/folder_place_card.dart';
import '../widgets/folder_tab_bar.dart';

class SavedPlacesPage extends ConsumerStatefulWidget {
  const SavedPlacesPage({super.key});

  @override
  ConsumerState<SavedPlacesPage> createState() => _SavedPlacesPageState();
}

class _SavedPlacesPageState extends ConsumerState<SavedPlacesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(savedPlacesNotifierProvider.notifier).loadFolders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(savedPlacesNotifierProvider);

    return Scaffold(
      backgroundColor: HomeColors.background,
      appBar: AppBar(
        backgroundColor: HomeColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          '내 저장 장소',
          style: AppTextStyles.heading02.copyWith(
            color: HomeColors.textPrimary,
          ),
        ),
        actions: [
          // 폴더 추가 버튼
          IconButton(
            onPressed: () => _onCreateFolder(),
            icon: Icon(
              Icons.create_new_folder_outlined,
              color: HomeColors.iconPrimary,
              size: 24.sp,
            ),
          ),
          // 현재 폴더 편집 버튼 (기본 폴더 제외)
          Builder(builder: (_) {
            final folder = _selectedFolder(state);
            if (folder == null || folder.isDefault) {
              return const SizedBox.shrink();
            }
            return IconButton(
              onPressed: () => _onEditFolder(),
              icon: Icon(
                Icons.settings_outlined,
                color: HomeColors.iconPrimary,
                size: 24.sp,
              ),
            );
          }),
        ],
      ),
      body: state.isFoldersLoading
          ? const Center(child: CircularProgressIndicator())
          : state.foldersError != null
              ? _buildErrorState(state.foldersError!)
              : _buildContent(state),
    );
  }

  Widget _buildContent(SavedPlacesState state) {
    return Column(
      children: [
        // 폴더 탭 바
        if (state.folders.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
            child: FolderTabBar(
              folders: state.folders,
              selectedFolderId: state.selectedFolderId,
              onFolderSelected: (folderId) {
                ref
                    .read(savedPlacesNotifierProvider.notifier)
                    .selectFolder(folderId);
              },
            ),
          ),

        // 구분선
        Divider(height: 1, color: HomeColors.divider),

        // 장소 목록
        Expanded(
          child: state.isPlacesLoading
              ? const Center(child: CircularProgressIndicator())
              : state.placesError != null
                  ? _buildErrorState(state.placesError!)
                  : state.places.isEmpty
                      ? const EmptyFolderState()
                      : _buildPlaceList(state),
        ),
      ],
    );
  }

  Widget _buildPlaceList(SavedPlacesState state) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: state.places.length,
      itemBuilder: (context, index) {
        final place = state.places[index];
        return FolderPlaceCard(
          place: place,
          onRemove: () => _onRemovePlace(place.placeId.toString()),
        );
      },
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48.sp,
              color: HomeColors.error,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: AppTextStyles.paragraph.copyWith(
                color: HomeColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            TextButton(
              onPressed: () {
                ref.read(savedPlacesNotifierProvider.notifier).loadFolders();
              },
              child: Text(
                '다시 시도',
                style: AppTextStyles.label.copyWith(
                  color: HomeColors.retryButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 현재 선택된 폴더 객체
  FolderModel? _selectedFolder(SavedPlacesState state) {
    if (state.selectedFolderId == null) return null;
    try {
      return state.folders.firstWhere((f) => f.id == state.selectedFolderId);
    } catch (_) {
      return null;
    }
  }

  /// 폴더 생성
  Future<void> _onCreateFolder() async {
    final result = await showCreateFolderBottomSheet(context);
    if (result == null) return;

    final success = await ref
        .read(savedPlacesNotifierProvider.notifier)
        .createFolder(
          name: result['name']!,
          visibility: result['visibility']!,
        );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('폴더가 생성되었습니다.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  /// 폴더 편집
  Future<void> _onEditFolder() async {
    final state = ref.read(savedPlacesNotifierProvider);
    final folder = _selectedFolder(state);
    if (folder == null) return;

    final result = await showEditFolderBottomSheet(context, folder: folder);
    if (result == null) return;

    final notifier = ref.read(savedPlacesNotifierProvider.notifier);

    if (result.action == EditFolderAction.delete) {
      final success = await notifier.deleteFolder(folder.id);
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('폴더가 삭제되었습니다.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      final success = await notifier.updateFolder(
        folderId: folder.id,
        name: result.name,
        visibility: result.visibility,
      );
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('폴더가 수정되었습니다.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  /// 장소 제거
  Future<void> _onRemovePlace(String placeId) async {
    final state = ref.read(savedPlacesNotifierProvider);
    if (state.selectedFolderId == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('장소 제거'),
        content: const Text('이 장소를 폴더에서 제거하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('제거'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await ref
          .read(savedPlacesNotifierProvider.notifier)
          .removePlaceFromFolder(state.selectedFolderId!, placeId);

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('장소가 제거되었습니다.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
