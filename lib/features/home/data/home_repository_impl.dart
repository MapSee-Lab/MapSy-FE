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
  Future<ContentListResponse> getRecentContent({
    int? cursor,
    int size = 20,
  }) async {
    debugPrint('📝 HomeRepository: Getting recent content...');
    return await _remoteDataSource.fetchRecentContent(
      cursor: cursor,
      size: size,
    );
  }

  @override
  Future<ContentListResponse> getMemberContent({
    int? cursor,
    int size = 30,
  }) async {
    debugPrint('📝 HomeRepository: Getting member content...');
    return await _remoteDataSource.fetchMemberContent(
      cursor: cursor,
      size: size,
    );
  }
}
