#!/bin/bash
# ===================================================================
# FlutterFire Crashlytics 심볼 업로드 스크립트
# ===================================================================
#
# 목적:
#   - Firebase Crashlytics에 iOS 빌드 심볼을 업로드
#   - CI 환경에서는 flutterfire CLI가 없을 수 있으므로 조건부 실행
#
# 사용 위치:
#   - Xcode Build Phases에서 "FlutterFire: upload-crashlytics-symbols" 단계에서 호출
#
# 에러 처리:
#   - CI 환경에서는 flutterfire 명령이 없어도 빌드 실패하지 않음
#   - 로컬 개발 환경에서도 flutterfire가 없으면 경고만 출력
#
# ===================================================================

set -e  # 에러 발생 시 중단 (단, CI 환경 체크는 예외)

echo "🔥 FlutterFire Crashlytics 심볼 업로드 시작..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# CI 환경 감지
# GitHub Actions, Bitrise, Codemagic, CircleCI, Travis CI, Jenkins 등
if [ "$CI" = "true" ] || [ "$GITHUB_ACTIONS" = "true" ] || [ "$BITRISE_IO" = "true" ] || [ "$CODEMAGIC" = "true" ]; then
  echo "⚠️  CI 환경이 감지되었습니다."
  echo "   FlutterFire CLI가 설치되지 않은 경우 심볼 업로드를 건너뜁니다."
  echo ""

  # CI 환경에서는 flutterfire가 없으면 경고만 출력하고 성공 처리
  if ! command -v flutterfire &> /dev/null; then
    echo "ℹ️  flutterfire 명령을 찾을 수 없습니다."
    echo "   CI 환경에서 Crashlytics 심볼 업로드를 건너뜁니다."
    echo "   빌드는 계속 진행됩니다."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 0  # 성공으로 처리 (빌드 차단하지 않음)
  fi
else
  echo "💻 로컬 개발 환경이 감지되었습니다."
  echo ""
fi

# flutterfire CLI 존재 여부 확인
if ! command -v flutterfire &> /dev/null; then
  echo "⚠️  경고: flutterfire 명령을 찾을 수 없습니다."
  echo ""
  echo "   Firebase Crashlytics 심볼 업로드를 건너뜁니다."
  echo "   심볼 업로드를 활성화하려면 아래 명령으로 FlutterFire CLI를 설치하세요:"
  echo ""
  echo "   $ dart pub global activate flutterfire_cli"
  echo ""
  echo "   설치 후 PATH에 추가:"
  echo "   $ export PATH=\"\$PATH:\$HOME/.pub-cache/bin\""
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  exit 0  # 로컬에서도 경고만 하고 빌드는 계속 진행
fi

# flutterfire 버전 확인
FLUTTERFIRE_VERSION=$(flutterfire --version 2>/dev/null || echo "unknown")
echo "✅ FlutterFire CLI 발견: $FLUTTERFIRE_VERSION"
echo ""

# Crashlytics 심볼 업로드 실행
echo "📤 Crashlytics 심볼 업로드 중..."
echo ""

if flutterfire upload-crashlytics-symbols; then
  echo ""
  echo "✅ Crashlytics 심볼 업로드 성공!"
else
  echo ""
  echo "❌ Crashlytics 심볼 업로드 실패!"
  echo "   하지만 빌드는 계속 진행됩니다."
  echo ""

  # 업로드 실패해도 빌드는 차단하지 않음 (선택적 기능)
  exit 0
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
