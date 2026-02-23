import 'models/content_response.dart';

/// 홈 화면 Repository 인터페이스
abstract class HomeRepository {
  /// 최근 콘텐츠 목록 조회
  Future<RecentContentResponse> getRecentContent();

  /// 회원 콘텐츠 목록 조회
  Future<MemberContentPageResponse> getMemberContent({int pageSize = 10});
}
