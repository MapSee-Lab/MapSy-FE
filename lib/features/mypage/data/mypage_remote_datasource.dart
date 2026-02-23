import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api_endpoints.dart';
import '../../../common/services/api_client.dart';
import 'models/check_name_response.dart';
import 'models/profile_update_request.dart';

part 'mypage_remote_datasource.g.dart';

@riverpod
MypageRemoteDataSource mypageRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return MypageRemoteDataSource(dio);
}

class MypageRemoteDataSource {
  final Dio _dio;

  MypageRemoteDataSource(this._dio);

  /// 닉네임 중복 확인
  /// GET /api/members/check-name?name={name}
  Future<CheckNameResponse> checkName(String name) async {
    debugPrint('📤 Mypage: Checking name availability: $name');

    final response = await _dio.get(
      ApiEndpoints.checkName,
      queryParameters: {'name': name},
    );

    final result = CheckNameResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    debugPrint('✅ Name check result: isAvailable=${result.isAvailable}');
    return result;
  }

  /// 프로필 업데이트 (닉네임 변경)
  /// POST /api/members/profile
  Future<void> updateProfile(ProfileUpdateRequest request) async {
    debugPrint('📤 Mypage: Updating profile: ${request.name}');

    await _dio.post(
      ApiEndpoints.memberProfile,
      data: request.toJson(),
    );

    debugPrint('✅ Profile updated successfully');
  }
}
