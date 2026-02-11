import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_client.dart';
import '../models/terms_request.dart';
import '../models/birth_date_request.dart';
import '../models/gender_request.dart';
import '../models/profile_request.dart';

part 'onboarding_remote_datasource.g.dart';

/// OnboardingRemoteDataSource Provider
@riverpod
OnboardingRemoteDataSource onboardingRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return OnboardingRemoteDataSource(dio);
}

/// 온보딩 Remote DataSource
///
/// 백엔드 온보딩 API를 호출합니다.
class OnboardingRemoteDataSource {
  final Dio _dio;

  OnboardingRemoteDataSource(this._dio);

  /// 약관 동의 제출
  ///
  /// POST /api/members/onboarding/terms
  Future<void> submitTerms(TermsRequest request) async {
    debugPrint('📤 OnboardingRemoteDataSource: Submitting terms agreement...');

    await _dio.post(ApiEndpoints.onboardingTerms, data: request.toJson());

    debugPrint('✅ Terms agreement submitted successfully');
  }

  /// 생년월일 제출
  ///
  /// POST /api/members/onboarding/birth-date
  Future<void> submitBirthDate(BirthDateRequest request) async {
    debugPrint('📤 OnboardingRemoteDataSource: Submitting birth date...');

    await _dio.post(ApiEndpoints.onboardingBirthDate, data: request.toJson());

    debugPrint('✅ Birth date submitted successfully');
  }

  /// 성별 제출
  ///
  /// POST /api/members/onboarding/gender
  /// 응답의 member.name에서 백엔드 자동 생성 닉네임을 반환
  Future<String?> submitGender(GenderRequest request) async {
    debugPrint('📤 OnboardingRemoteDataSource: Submitting gender...');

    final response = await _dio.post(
      ApiEndpoints.onboardingGender,
      data: request.toJson(),
    );

    // 응답에서 member.name (임시 닉네임) 추출
    String? tempNickname;
    if (response.data is Map<String, dynamic>) {
      final member = response.data['member'];
      if (member is Map<String, dynamic>) {
        tempNickname = member['name'] as String?;
        debugPrint('📛 Temporary nickname from server: $tempNickname');
      }
    }

    debugPrint('✅ Gender submitted successfully');
    return tempNickname;
  }

  /// 프로필(닉네임) 제출
  ///
  /// POST /api/members/profile
  /// null 필드는 JSON에서 제외 (백엔드가 기존 저장값을 유지하도록)
  Future<void> submitProfile(ProfileRequest request) async {
    debugPrint('📤 OnboardingRemoteDataSource: Submitting profile...');

    final data = request.toJson()..removeWhere((_, v) => v == null);
    await _dio.post(ApiEndpoints.memberProfile, data: data);

    debugPrint('✅ Profile submitted successfully');
  }

  /// 닉네임 중복 확인
  ///
  /// GET /api/members/check-name?name=xxx
  Future<CheckNameResponse> checkName(String name) async {
    debugPrint('📤 OnboardingRemoteDataSource: Checking name availability...');

    final response = await _dio.get(
      ApiEndpoints.checkName,
      queryParameters: {'name': name},
    );

    final checkNameResponse = CheckNameResponse.fromJson(response.data);
    debugPrint('✅ Name check result: ${checkNameResponse.isAvailable}');

    return checkNameResponse;
  }
}
