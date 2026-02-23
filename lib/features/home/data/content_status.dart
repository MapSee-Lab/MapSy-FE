/// 콘텐츠 처리 상태
enum ContentStatus {
  /// AI 분석 대기 중
  pending,

  /// AI 분석 중
  processing,

  /// 분석 완료
  completed,

  /// 분석 실패
  failed;

  /// JSON 문자열에서 ContentStatus로 변환
  static ContentStatus fromString(String value) {
    return ContentStatus.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => ContentStatus.pending,
    );
  }

  /// ContentStatus를 JSON 문자열로 변환
  String toJson() => name.toUpperCase();
}
