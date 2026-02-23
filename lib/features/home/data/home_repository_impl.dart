import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_repository.dart';
import 'home_remote_datasource.dart';
import 'models/content_response.dart';

part 'home_repository_impl.g.dart';

/// HomeRepository Provider
@riverpod
HomeRepository homeRepository(Ref ref) {
  final remoteDataSource = ref.watch(homeRemoteDataSourceProvider);
  return HomeRepositoryImpl(remoteDataSource);
}

/// 홈 화면 Repository 구현체
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<RecentContentResponse> getRecentContent() async {
    debugPrint('📝 HomeRepository: Getting recent content...');
    return await _remoteDataSource.fetchRecentContent();
  }

  @override
  Future<MemberContentPageResponse> getMemberContent({
    int pageSize = 10,
  }) async {
    debugPrint('📝 HomeRepository: Getting member content...');
    return await _remoteDataSource.fetchMemberContent(pageSize: pageSize);
  }
}
