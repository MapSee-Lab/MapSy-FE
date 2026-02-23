import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/services/token_storage.dart';
import 'onboarding_repository.dart';
import 'onboarding_remote_datasource.dart';
import 'models/terms_request.dart';
import 'models/birth_date_request.dart';
import 'models/gender_request.dart';
import 'models/profile_request.dart';

part 'onboarding_repository_impl.g.dart';

/// OnboardingRepository Provider
@riverpod
OnboardingRepository onboardingRepository(Ref ref) {
  final remoteDataSource = ref.watch(onboardingRemoteDataSourceProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return OnboardingRepositoryImpl(remoteDataSource, tokenStorage);
}

/// 온보딩 Repository 구현체
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource _remoteDataSource;
  final TokenStorage _tokenStorage;

  OnboardingRepositoryImpl(this._remoteDataSource, this._tokenStorage);

  @override
  Future<void> submitTerms({
    required bool serviceAgreement,
    required bool privacyAgreement,
    bool marketingAgreement = false,
  }) async {
    debugPrint('📝 OnboardingRepository: Submitting terms...');

    final request = TermsRequest(
      isServiceTermsAndPrivacyAgreed: serviceAgreement && privacyAgreement,
      isMarketingAgreed: marketingAgreement,
    );

    await _remoteDataSource.submitTerms(request);

    // 온보딩 단계 업데이트: TERMS → BIRTH_DATE
    await _tokenStorage.saveOnboardingState(
      requiresOnboarding: true,
      onboardingStep: 'BIRTH_DATE',
    );

    debugPrint('✅ Terms submitted, next step: BIRTH_DATE');
  }

  @override
  Future<void> submitBirthDate(DateTime birthDate) async {
    debugPrint('📝 OnboardingRepository: Submitting birth date...');

    // DateTime을 YYYY-MM-DD 형식으로 변환
    final year = birthDate.year.toString();
    final month = birthDate.month.toString().padLeft(2, '0');
    final day = birthDate.day.toString().padLeft(2, '0');
    final formattedDate = '$year-$month-$day';

    final request = BirthDateRequest(birthDate: formattedDate);
    await _remoteDataSource.submitBirthDate(request);

    // 온보딩 단계 업데이트: BIRTH_DATE → GENDER
    await _tokenStorage.saveOnboardingState(
      requiresOnboarding: true,
      onboardingStep: 'GENDER',
    );

    debugPrint('✅ Birth date submitted, next step: GENDER');
  }

  @override
  Future<String?> submitGender(Gender gender) async {
    debugPrint('📝 OnboardingRepository: Submitting gender...');

    final request = GenderRequest(gender: gender);
    final tempNickname = await _remoteDataSource.submitGender(request);

    // 온보딩 단계 업데이트: GENDER → NICKNAME
    await _tokenStorage.saveOnboardingState(
      requiresOnboarding: true,
      onboardingStep: 'NICKNAME',
    );

    debugPrint('✅ Gender submitted, next step: NICKNAME');
    return tempNickname;
  }

  @override
  Future<void> submitProfile(
    String name, {
    Gender? gender,
    DateTime? birthDate,
  }) async {
    debugPrint('📝 OnboardingRepository: Submitting profile...');

    // 생년월일을 YYYY-MM-DD 형식으로 변환
    String? formattedBirthDate;
    if (birthDate != null) {
      final year = birthDate.year.toString();
      final month = birthDate.month.toString().padLeft(2, '0');
      final day = birthDate.day.toString().padLeft(2, '0');
      formattedBirthDate = '$year-$month-$day';
    }

    final request = ProfileRequest(
      name: name,
      gender: gender,
      birthDate: formattedBirthDate,
    );
    await _remoteDataSource.submitProfile(request);

    // 온보딩 완료
    await completeOnboarding();

    debugPrint('✅ Profile submitted, onboarding completed');
  }

  @override
  Future<CheckNameResponse> checkName(String name) async {
    return await _remoteDataSource.checkName(name);
  }

  @override
  Future<void> completeOnboarding() async {
    debugPrint('🎉 OnboardingRepository: Completing onboarding...');

    await _tokenStorage.saveOnboardingState(
      requiresOnboarding: false,
      onboardingStep: 'COMPLETED',
    );

    debugPrint('✅ Onboarding completed');
  }
}
