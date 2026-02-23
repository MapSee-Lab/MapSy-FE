import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'mypage_remote_datasource.dart';
import 'mypage_repository.dart';
import 'models/check_name_response.dart';
import 'models/profile_update_request.dart';

part 'mypage_repository_impl.g.dart';

@riverpod
MypageRepository mypageRepository(Ref ref) {
  final remoteDataSource = ref.watch(mypageRemoteDataSourceProvider);
  return MypageRepositoryImpl(remoteDataSource);
}

class MypageRepositoryImpl implements MypageRepository {
  final MypageRemoteDataSource _remoteDataSource;

  MypageRepositoryImpl(this._remoteDataSource);

  @override
  Future<CheckNameResponse> checkName(String name) async {
    debugPrint('📝 MypageRepo: Checking name...');
    return await _remoteDataSource.checkName(name);
  }

  @override
  Future<void> updateNickname(String name) async {
    debugPrint('📝 MypageRepo: Updating nickname...');
    await _remoteDataSource.updateProfile(
      ProfileUpdateRequest(name: name),
    );
  }
}
