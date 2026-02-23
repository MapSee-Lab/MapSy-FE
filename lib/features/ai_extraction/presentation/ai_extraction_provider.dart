import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/place_model.dart';
import '../data/ai_extraction_repository_impl.dart';
import '../data/models/analyze_request.dart';
import '../data/models/content_detail_response.dart';

part 'ai_extraction_provider.freezed.dart';
part 'ai_extraction_provider.g.dart';

/// AI 추출 화면 단계
enum AiExtractionStep {
  input,
  analyzing,
  completed,
  saving,
  saved,
  error,
}

/// AI 추출 화면 상태
@freezed
class AiExtractionState with _$AiExtractionState {
  const factory AiExtractionState({
    @Default(AiExtractionStep.input) AiExtractionStep step,
    @Default('') String url,
    int? contentId,
    @Default([]) List<PlaceModel> places,
    @Default({}) Set<int> selectedPlaceIds,
    String? errorMessage,
    @Default(0.0) double saveProgress,
  }) = _AiExtractionState;
}

/// AI 추출 화면 Notifier
@riverpod
class AiExtractionNotifier extends _$AiExtractionNotifier {
  Timer? _pollingTimer;
  bool _disposed = false;

  @override
  AiExtractionState build() {
    _disposed = false;
    ref.onDispose(() {
      _disposed = true;
      _pollingTimer?.cancel();
    });
    return const AiExtractionState();
  }

  void updateUrl(String url) {
    state = state.copyWith(url: url);
  }

  /// URL 유효성 검증
  bool _isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  Future<void> analyze() async {
    final trimmedUrl = state.url.trim();
    if (trimmedUrl.isEmpty) return;

    if (!_isValidUrl(trimmedUrl)) {
      state = state.copyWith(
        step: AiExtractionStep.error,
        errorMessage: '올바른 URL을 입력해주세요.',
      );
      return;
    }

    state = state.copyWith(
      step: AiExtractionStep.analyzing,
      errorMessage: null,
    );

    try {
      final repository = ref.read(aiExtractionRepositoryProvider);
      final response = await repository.analyze(
        AnalyzeRequest(sourceUrl: trimmedUrl),
      );

      if (_disposed) return;
      state = state.copyWith(contentId: response.contentId);
      _startPolling(response.contentId);
    } catch (e) {
      debugPrint('❌ AiExtraction: Analyze failed: $e');
      if (_disposed) return;
      state = state.copyWith(
        step: AiExtractionStep.error,
        errorMessage: 'URL 분석에 실패했습니다. 다시 시도해주세요.',
      );
    }
  }

  void _startPolling(int contentId) {
    int attempts = 0;
    int consecutiveFailures = 0;
    const maxAttempts = 60;
    const maxConsecutiveFailures = 3;

    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        if (_disposed) {
          timer.cancel();
          return;
        }

        attempts++;

        if (attempts > maxAttempts) {
          timer.cancel();
          if (_disposed) return;
          state = state.copyWith(
            step: AiExtractionStep.error,
            errorMessage: '분석 시간이 초과되었습니다. 다시 시도해주세요.',
          );
          return;
        }

        try {
          final repository = ref.read(aiExtractionRepositoryProvider);
          final detail = await repository.getContentDetail(contentId);

          if (_disposed) {
            timer.cancel();
            return;
          }

          consecutiveFailures = 0;

          if (detail.status.toUpperCase() == 'COMPLETED') {
            timer.cancel();
            final allPlaceIds = detail.places.map((p) => p.placeId).toSet();
            state = state.copyWith(
              step: AiExtractionStep.completed,
              places: detail.places,
              selectedPlaceIds: allPlaceIds,
            );
          } else if (detail.status.toUpperCase() == 'FAILED') {
            timer.cancel();
            state = state.copyWith(
              step: AiExtractionStep.error,
              errorMessage: '장소 추출에 실패했습니다. 다시 시도해주세요.',
            );
          }
        } catch (e) {
          debugPrint('❌ AiExtraction: Polling failed: $e');
          consecutiveFailures++;
          if (consecutiveFailures >= maxConsecutiveFailures) {
            timer.cancel();
            if (_disposed) return;
            state = state.copyWith(
              step: AiExtractionStep.error,
              errorMessage: '네트워크 오류가 발생했습니다. 다시 시도해주세요.',
            );
          }
        }
      },
    );
  }

  void togglePlace(int placeId) {
    final selected = Set<int>.from(state.selectedPlaceIds);
    if (selected.contains(placeId)) {
      selected.remove(placeId);
    } else {
      selected.add(placeId);
    }
    state = state.copyWith(selectedPlaceIds: selected);
  }

  void toggleAll() {
    if (state.selectedPlaceIds.length == state.places.length) {
      state = state.copyWith(selectedPlaceIds: {});
    } else {
      final allIds = state.places.map((p) => p.placeId).toSet();
      state = state.copyWith(selectedPlaceIds: allIds);
    }
  }

  Future<void> saveSelectedPlaces() async {
    if (state.selectedPlaceIds.isEmpty) return;

    state = state.copyWith(
      step: AiExtractionStep.saving,
      saveProgress: 0.0,
    );

    try {
      final repository = ref.read(aiExtractionRepositoryProvider);
      final placeIds = state.selectedPlaceIds.toList();
      final failedIds = <int>[];

      for (int i = 0; i < placeIds.length; i++) {
        try {
          await repository.savePlace(placeIds[i]);
        } catch (e) {
          debugPrint('❌ AiExtraction: Failed to save placeId=${placeIds[i]}: $e');
          failedIds.add(placeIds[i]);
        }
        if (_disposed) return;
        state = state.copyWith(
          saveProgress: (i + 1) / placeIds.length,
        );
      }

      if (_disposed) return;

      if (failedIds.isEmpty) {
        state = state.copyWith(step: AiExtractionStep.saved);
      } else {
        state = state.copyWith(
          step: AiExtractionStep.error,
          errorMessage: '${failedIds.length}개의 장소 저장에 실패했습니다.',
          selectedPlaceIds: failedIds.toSet(),
        );
      }
    } catch (e) {
      debugPrint('❌ AiExtraction: Save failed: $e');
      if (_disposed) return;
      state = state.copyWith(
        step: AiExtractionStep.error,
        errorMessage: '장소 저장에 실패했습니다. 다시 시도해주세요.',
      );
    }
  }

  void retry() {
    _pollingTimer?.cancel();
    state = const AiExtractionState();
  }

  void cancel() {
    _pollingTimer?.cancel();
    if (_disposed) return;
    state = state.copyWith(
      step: AiExtractionStep.input,
      errorMessage: null,
    );
  }
}
