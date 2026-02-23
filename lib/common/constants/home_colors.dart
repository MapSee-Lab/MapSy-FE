import 'package:flutter/material.dart';

/// 홈 화면 전용 컬러 상수
/// Home Screen Color Palette (씀 스타일 라이트 모노톤 미니멀 디자인)
///
/// 사용법:
/// - Container(color: HomeColors.background)
class HomeColors {
  HomeColors._();

  // ============================================
  // 배경 색상 (Background Colors)
  // ============================================

  /// 메인 배경색 (순수 화이트)
  static const Color background = Color(0xFFFFFFFF);

  /// 서피스 배경색 (미세 구분용)
  static const Color surface = Color(0xFFFAFAFA);

  /// 서피스 밝은 톤 (스켈레톤 베이스, placeholder)
  static const Color surfaceLight = Color(0xFFF5F5F5);

  // ============================================
  // 텍스트 색상 (Text Colors)
  // ============================================

  /// 주요 텍스트 (거의 블랙)
  static const Color textPrimary = Color(0xFF1A1A1A);

  /// 보조 텍스트 (미디엄 그레이)
  static const Color textSecondary = Color(0xFF888888);

  /// 비활성 텍스트 (연한 그레이)
  static const Color textDisabled = Color(0xFFBDBDBD);

  // ============================================
  // 카드 색상 (Card Colors)
  // ============================================

  /// 카드 배경색
  static const Color cardBackground = Color(0xFFFFFFFF);

  /// 카드 보더 색상
  static const Color cardBorder = Color(0xFFE5E5E5);

  // ============================================
  // 태그/칩 색상 (Tag/Chip Colors)
  // ============================================

  /// 태그 배경색
  static const Color tagBackground = Color(0xFFF5F5F5);

  /// 태그 텍스트 색상
  static const Color tagText = Color(0xFF666666);

  // ============================================
  // 구분선 색상 (Divider Colors)
  // ============================================

  /// 구분선 색상
  static const Color divider = Color(0xFFF0F0F0);

  // ============================================
  // 스켈레톤 색상 (Shimmer/Skeleton Colors)
  // ============================================

  /// 스켈레톤 기본 색상
  static const Color shimmerBase = Color(0xFFF5F5F5);

  /// 스켈레톤 하이라이트 색상
  static const Color shimmerHighlight = Color(0xFFEBEBEB);

  // ============================================
  // 아이콘 색상 (Icon Colors)
  // ============================================

  /// 아이콘 기본 색상
  static const Color iconPrimary = Color(0xFF1A1A1A);

  /// 아이콘 보조 색상
  static const Color iconSecondary = Color(0xFFAAAAAA);

  // ============================================
  // 에러/상태 색상 (Status Colors)
  // ============================================

  /// 에러 색상
  static const Color error = Color(0xFFD32F2F);

  /// 재시도 버튼 색상
  static const Color retryButton = Color(0xFF1A1A1A);

  // ============================================
  // 평점 색상 (Rating Colors)
  // ============================================

  /// 별점 아이콘 색상
  static const Color starRating = Color(0xFFFFC107);
}
