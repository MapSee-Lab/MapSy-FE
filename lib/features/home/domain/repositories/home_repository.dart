import '../../data/models/content_response.dart';

/// 홈 화면 Repository 인터페이스
abstract class HomeRepository {
  /// 최근 콘텐츠 목록 조회
  Future<ContentListResponse> getRecentContent({int? cursor, int size = 20});

  /// 회원 콘텐츠 목록 조회 (인기 장소)
  Future<ContentListResponse> getMemberContent({int? cursor, int size = 30});
}
