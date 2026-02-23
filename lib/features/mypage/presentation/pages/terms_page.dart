import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/home_colors.dart';
import '../../../../common/constants/text_styles.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.background,
      appBar: AppBar(
        backgroundColor: HomeColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          '이용약관',
          style: AppTextStyles.heading02.copyWith(
            color: HomeColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Text(
          _termsText,
          style: AppTextStyles.paragraph.copyWith(
            color: HomeColors.textPrimary,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}

const _termsText = '''
제1조 (목적)
이 약관은 맵시(이하 "회사")가 제공하는 서비스의 이용과 관련하여 회사와 이용자 간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.

제2조 (정의)
1. "서비스"란 회사가 제공하는 AI 기반 장소 추출 플랫폼을 말합니다.
2. "이용자"란 이 약관에 따라 회사가 제공하는 서비스를 받는 자를 말합니다.
3. "콘텐츠"란 이용자가 서비스를 이용하면서 생성하거나 저장한 모든 정보를 말합니다.

제3조 (약관의 효력 및 변경)
1. 이 약관은 서비스 화면에 게시하거나 기타의 방법으로 이용자에게 공지함으로써 효력이 발생합니다.
2. 회사는 필요한 경우 관련 법령에 위배되지 않는 범위 안에서 이 약관을 개정할 수 있습니다.

제4조 (서비스의 제공)
1. 회사는 다음과 같은 서비스를 제공합니다.
   - SNS URL 기반 AI 장소 추출 서비스
   - 장소 정보 저장 및 관리 서비스
   - 기타 회사가 정하는 서비스

제5조 (이용자의 의무)
1. 이용자는 서비스를 이용할 때 다음 행위를 하여서는 안 됩니다.
   - 타인의 정보를 도용하는 행위
   - 서비스의 운영을 방해하는 행위
   - 기타 관련 법령에 위반되는 행위

제6조 (개인정보 보호)
회사는 이용자의 개인정보를 보호하기 위해 개인정보처리방침을 수립하고 이를 준수합니다.

제7조 (면책사항)
1. 회사는 천재지변 등 불가항력으로 서비스를 제공할 수 없는 경우 책임이 면제됩니다.
2. 회사는 이용자의 귀책사유로 인한 서비스 이용 장애에 대해 책임을 지지 않습니다.
''';
