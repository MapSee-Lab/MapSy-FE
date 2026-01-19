# iOS 빌드 스크립트 설정 가이드

## 📋 개요

이 문서는 MapSy Flutter 프로젝트의 iOS 빌드 설정을 안내합니다.
특히 **FlutterFire Crashlytics 심볼 업로드 스크립트**를 Xcode Build Phases에 연결하는 방법을 설명합니다.

---

## 🎯 목적

- **문제**: CI 환경에서 `flutterfire` CLI가 없어서 빌드가 실패함
- **해결**: 조건부 실행 스크립트로 CI 환경에서는 업로드를 건너뜀
- **효과**: 로컬 개발 환경에서는 정상 작동, CI에서는 빌드 차단하지 않음

---

## 🔧 설정 방법

### 1단계: Xcode에서 프로젝트 열기

```bash
cd ios
open Runner.xcworkspace
```

⚠️ **주의**: `Runner.xcodeproj`가 아닌 `Runner.xcworkspace`를 열어야 합니다!

---

### 2단계: Build Phases에서 FlutterFire 스크립트 찾기

1. Xcode 좌측 **Project Navigator**에서 **Runner** 프로젝트 선택
2. 상단 **TARGETS**에서 **Runner** 타겟 선택
3. 상단 탭에서 **Build Phases** 클릭
4. **Run Script** 목록에서 다음 이름의 스크립트 찾기:
   - `FlutterFire: "flutterfire upload-crashlytics-symbols"`
   - 또는 유사한 이름의 FlutterFire 관련 스크립트

---

### 3단계: 스크립트 내용 수정

**기존 스크립트** (문제 있는 버전):
```bash
#!/bin/bash
flutterfire upload-crashlytics-symbols
```

**새 스크립트** (조건부 실행 버전):
```bash
#!/bin/bash

# 스크립트 파일 경로
SCRIPT_PATH="${SRCROOT}/scripts/upload_crashlytics_symbols.sh"

# 스크립트 파일 존재 확인
if [ -f "$SCRIPT_PATH" ]; then
  echo "🔥 FlutterFire 업로드 스크립트 실행: $SCRIPT_PATH"
  bash "$SCRIPT_PATH"
else
  echo "⚠️  업로드 스크립트를 찾을 수 없습니다: $SCRIPT_PATH"
  echo "   CI 환경이므로 계속 진행합니다."
  exit 0
fi
```

---

### 4단계: 스크립트 저장 및 빌드 테스트

1. 스크립트 수정 완료 후 **Xcode 파일 저장** (Cmd+S)
2. 로컬에서 빌드 테스트:
   ```bash
   cd ..  # 프로젝트 루트로 이동
   flutter build ios --release --no-codesign
   ```

---

## ✅ 검증 방법

### 로컬 환경 테스트

```bash
# 1. FlutterFire CLI 설치 여부 확인
flutterfire --version

# 2. 설치되지 않았다면 (선택사항)
dart pub global activate flutterfire_cli
export PATH="$PATH:$HOME/.pub-cache/bin"

# 3. 빌드 실행
flutter build ios --release --no-codesign
```

**예상 결과**:
- FlutterFire CLI 있음: 심볼 업로드 실행 후 성공
- FlutterFire CLI 없음: 경고 메시지 출력 후 빌드 계속 진행

---

### CI 환경 테스트

GitHub Actions, Bitrise, Codemagic 등 CI 환경에서:

**예상 결과**:
```
⚠️  CI 환경이 감지되었습니다.
ℹ️  flutterfire 명령을 찾을 수 없습니다.
   CI 환경에서 Crashlytics 심볼 업로드를 건너뜁니다.
   빌드는 계속 진행됩니다.
```

빌드가 **성공적으로 완료**되어야 합니다!

---

## 🔍 트러블슈팅

### 문제 1: 스크립트 파일을 찾을 수 없음

**에러 메시지**:
```
⚠️  업로드 스크립트를 찾을 수 없습니다: /path/to/scripts/upload_crashlytics_symbols.sh
```

**해결**:
1. 스크립트 파일이 올바른 위치에 있는지 확인:
   ```bash
   ls -la ios/scripts/upload_crashlytics_symbols.sh
   ```

2. 실행 권한 확인:
   ```bash
   chmod +x ios/scripts/upload_crashlytics_symbols.sh
   ```

---

### 문제 2: 여전히 빌드 실패

**원인**: Xcode Build Phases 스크립트가 아직 수정되지 않음

**해결**:
1. Xcode에서 Build Phases → Run Script 다시 확인
2. 스크립트 내용이 정확히 수정되었는지 검증
3. Xcode 재시작 후 다시 시도

---

### 문제 3: Deployment Target 경고

**에러 메시지**:
```
warning: The iOS deployment target 'IPHONEOS_DEPLOYMENT_TARGET' is set to 26.0
```

**해결**: Podfile 수정이 적용되었는지 확인
```bash
cd ios
pod deintegrate
pod install
```

---

## 📚 관련 파일

| 파일 | 설명 |
|------|------|
| `scripts/upload_crashlytics_symbols.sh` | FlutterFire 업로드 스크립트 (CI 환경 감지) |
| `Podfile` | CocoaPods 의존성 + Deployment Target 통일 설정 |
| `com.elipair.mapsy.share/Info.plist` | Share Extension 활성화 규칙 (TRUEPREDICATE 수정) |

---

## 🚀 요약

1. ✅ **스크립트 생성 완료**: `ios/scripts/upload_crashlytics_symbols.sh`
2. ⚠️ **Xcode 설정 필요**: Build Phases에서 스크립트 연결 (수동)
3. ✅ **Podfile 수정 완료**: Deployment Target 통일
4. ✅ **Info.plist 수정 완료**: TRUEPREDICATE → 구체적 activation rule

---

## 💡 추가 개선 사항 (선택)

### FlutterFire CLI 자동 설치 (CI용)

GitHub Actions에서 자동으로 FlutterFire CLI를 설치하려면:

```yaml
# .github/workflows/ios-build.yml

steps:
  - name: Install FlutterFire CLI (Optional)
    run: |
      dart pub global activate flutterfire_cli
      echo "$HOME/.pub-cache/bin" >> $GITHUB_PATH
    continue-on-error: true  # 실패해도 빌드 계속
```

---

## 📞 문제 해결 지원

문제가 계속되면 다음 정보를 포함하여 보고하세요:

1. 빌드 환경 (로컬 / CI)
2. Xcode 버전: `xcodebuild -version`
3. Flutter 버전: `flutter --version`
4. 전체 에러 로그

---

**마지막 업데이트**: 2026-01-19
**작성자**: Claude Code Agent
