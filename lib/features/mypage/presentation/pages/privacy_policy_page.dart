import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.background,
      appBar: AppBar(
        backgroundColor: HomeColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          '개인정보처리방침',
          style: AppTextStyles.heading02.copyWith(
            color: HomeColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Text(
          _privacyPolicyText,
          style: AppTextStyles.paragraph.copyWith(
            color: HomeColors.textPrimary,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}

const _privacyPolicyText = '''
1. 개인정보의 수집 및 이용 목적
맵시(이하 "회사")는 다음의 목적을 위하여 개인정보를 처리합니다.
- 회원 가입 및 관리
- 서비스 제공 및 운영
- 서비스 개선 및 개발

2. 수집하는 개인정보의 항목
- 필수: 이메일, 닉네임, 성별, 생년월일
- 선택: 마케팅 수신 동의 여부
- 자동 수집: 기기 정보, 접속 로그

3. 개인정보의 보유 및 이용 기간
- 회원 탈퇴 시까지 보유 (탈퇴 후 즉시 파기)
- 관련 법령에 따른 보존이 필요한 경우 해당 기간 동안 보유

4. 개인정보의 파기
회사는 개인정보 보유 기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.

5. 이용자의 권리
이용자는 언제든지 자신의 개인정보에 대해 열람, 수정, 삭제, 처리 정지를 요청할 수 있습니다.

6. 개인정보의 안전성 확보 조치
회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취합니다.
- 개인정보의 암호화
- 접근 권한 관리
- 보안 프로그램 설치 및 운영

7. 개인정보 보호책임자
성명: 맵시 개인정보 보호팀
이메일: privacy@mapsee.com
''';
