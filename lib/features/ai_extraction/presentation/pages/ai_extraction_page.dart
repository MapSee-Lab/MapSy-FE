import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/spacing_and_radius.dart';
import '../../../../common/constants/text_styles.dart';
import '../ai_extraction_provider.dart';
import '../widgets/url_input_section.dart';
import '../widgets/analyzing_section.dart';
import '../widgets/place_result_section.dart';

/// AI 장소 추출 페이지 (단일 페이지, 상태 전환)
class AiExtractionPage extends ConsumerStatefulWidget {
  const AiExtractionPage({super.key});

  @override
  ConsumerState<AiExtractionPage> createState() => _AiExtractionPageState();
}

class _AiExtractionPageState extends ConsumerState<AiExtractionPage> {
  final _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _urlController.addListener(() {
      ref.read(aiExtractionNotifierProvider.notifier).updateUrl(
        _urlController.text,
      );
    });
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(aiExtractionNotifierProvider);
    final notifier = ref.read(aiExtractionNotifierProvider.notifier);

    // 저장 완료 시 스낵바 + 홈으로 이동
    ref.listen(aiExtractionNotifierProvider, (prev, next) {
      if (prev?.step != AiExtractionStep.saved &&
          next.step == AiExtractionStep.saved) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${next.selectedPlaceIds.length}개의 장소가 저장되었습니다',
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) context.pop();
        });
      }
    });

    return PopScope(
      canPop: state.step == AiExtractionStep.input ||
              state.step == AiExtractionStep.completed ||
              state.step == AiExtractionStep.error ||
              state.step == AiExtractionStep.saved,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          if (state.step == AiExtractionStep.analyzing) {
            notifier.cancel();
          } else if (state.step == AiExtractionStep.saving) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('저장이 진행 중입니다. 잠시만 기다려주세요.'),
                duration: Duration(seconds: 1),
              ),
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: HomeColors.background,
        appBar: AppBar(
          backgroundColor: HomeColors.background,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              if (state.step == AiExtractionStep.analyzing) {
                notifier.cancel();
              }
              Navigator.maybePop(context);
            },
            icon: Icon(Icons.arrow_back, color: HomeColors.textPrimary),
          ),
          title: Text(
            'AI 장소 추출',
            style: AppTextStyles.subHeading.copyWith(color: HomeColors.textPrimary),
          ),
          centerTitle: true,
        ),
        body: _buildBody(state, notifier),
      ),
    );
  }

  Widget _buildBody(AiExtractionState state, AiExtractionNotifier notifier) {
    switch (state.step) {
      case AiExtractionStep.input:
        return UrlInputSection(
          controller: _urlController,
          onAnalyze: () => notifier.analyze(),
          isValid: state.url.trim().isNotEmpty,
        );

      case AiExtractionStep.analyzing:
        return AnalyzingSection(
          onCancel: () => notifier.cancel(),
        );

      case AiExtractionStep.completed:
      case AiExtractionStep.saving:
        return PlaceResultSection(
          places: state.places,
          selectedPlaceIds: state.selectedPlaceIds,
          onTogglePlace: (id) => notifier.togglePlace(id),
          onToggleAll: () => notifier.toggleAll(),
          onSave: () => notifier.saveSelectedPlaces(),
          isSaving: state.step == AiExtractionStep.saving,
          saveProgress: state.saveProgress,
        );

      case AiExtractionStep.saved:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case AiExtractionStep.error:
        return _buildErrorSection(state, notifier);
    }
  }

  Widget _buildErrorSection(
    AiExtractionState state,
    AiExtractionNotifier notifier,
  ) {
    return Center(
      child: Padding(
        padding: AppPadding.all20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: HomeColors.textDisabled,
            ),
            SizedBox(height: 16.h),
            Text(
              state.errorMessage ?? '오류가 발생했습니다',
              style: AppTextStyles.label.copyWith(
                color: HomeColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () => notifier.retry(),
              style: ElevatedButton.styleFrom(
                backgroundColor: HomeColors.textPrimary,
                foregroundColor: HomeColors.background,
              ),
              child: Text('다시 시도', style: AppTextStyles.paragraph),
            ),
          ],
        ),
      ),
    );
  }
}
