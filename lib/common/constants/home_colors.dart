import 'package:flutter/material.dart';

/// 홈 화면 전용 컬러 상수
/// Home Screen Color Palette (블랙 모노톤 모던 디자인)
///
/// 사용법:
/// - Container(color: HomeColors.background)
class HomeColors {
  // Private 생성자 - 인스턴스화 방지
  HomeColors._();

  // ============================================
  // 배경 색상 (Background Colors)
  // ============================================

  /// 메인 배경색 (순수 블랙)
  static const Color background = Color(0xFF000000);

  /// 서피스 배경색 (카드, 섹션)
  static const Color surface = Color(0xFF1A1A1A);

  /// 서피스 밝은 톤 (호버, 선택 상태)
  static const Color surfaceLight = Color(0xFF2A2A2A);

  // ============================================
  // 텍스트 색상 (Text Colors)
  // ============================================

  /// 주요 텍스트 (화이트)
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// 보조 텍스트 (밝은 회색)
  static const Color textSecondary = Color(0xFFB0B0B0);

  /// 비활성 텍스트 (어두운 회색)
  static const Color textDisabled = Color(0xFF666666);

  // ============================================
  // 카드 색상 (Card Colors)
  // ============================================

  /// 카드 배경색
  static const Color cardBackground = Color(0xFF1A1A1A);

  /// 카드 오버레이 그라데이션 시작 (투명)
  static const Color cardOverlayStart = Color(0x00000000);

  /// 카드 오버레이 그라데이션 끝 (반투명 블랙)
  static const Color cardOverlayEnd = Color(0xCC000000);

  // ============================================
  // 태그/칩 색상 (Tag/Chip Colors)
  // ============================================

  /// 태그 배경색
  static const Color tagBackground = Color(0xFF2A2A2A);

  /// 태그 텍스트 색상
  static const Color tagText = Color(0xFFB0B0B0);

  // ============================================
  // 구분선/보더 색상 (Divider/Border Colors)
  // ============================================

  /// 구분선 색상
  static const Color divider = Color(0xFF2A2A2A);

  /// 보더 색상
  static const Color border = Color(0xFF333333);

  // ============================================
  // 스켈레톤 색상 (Shimmer/Skeleton Colors)
  // ============================================

  /// 스켈레톤 기본 색상
  static const Color shimmerBase = Color(0xFF1A1A1A);

  /// 스켈레톤 하이라이트 색상
  static const Color shimmerHighlight = Color(0xFF333333);

  // ============================================
  // 아이콘 색상 (Icon Colors)
  // ============================================

  /// 아이콘 기본 색상
  static const Color iconPrimary = Color(0xFFFFFFFF);

  /// 아이콘 보조 색상
  static const Color iconSecondary = Color(0xFF888888);

  // ============================================
  // 에러/상태 색상 (Status Colors)
  // ============================================

  /// 에러 색상
  static const Color error = Color(0xFFFF4D4D);

  /// 재시도 버튼 색상
  static const Color retryButton = Color(0xFF4A90E2);
}
