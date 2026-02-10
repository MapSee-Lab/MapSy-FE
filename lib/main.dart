import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'core/services/fcm/firebase_messaging_service.dart';
import 'core/services/fcm/local_notifications_service.dart';
import 'router/app_router.dart';

/// MapSy 앱 진입점
/// Firebase, Crashlytics, FCM 초기화 후 앱 실행
void main() async {
  // ═══════════════════════════════════════════════════════════════════════
  // 1. Flutter 엔진 초기화 (Firebase 호출 전 필수)
  // ═══════════════════════════════════════════════════════════════════════
  WidgetsFlutterBinding.ensureInitialized();

  // ═══════════════════════════════════════════════════════════════════════
  // 2. 환경 변수 로드 (.env 파일)
  // ═══════════════════════════════════════════════════════════════════════
  await dotenv.load(fileName: '.env');

  // ═══════════════════════════════════════════════════════════════════════
  // 3. Firebase 초기화 (플랫폼별 설정 자동 적용)
  // ═══════════════════════════════════════════════════════════════════════
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // ═══════════════════════════════════════════════════════════════════════
  // 4. Firebase Crashlytics 설정
  // ═══════════════════════════════════════════════════════════════════════
  // Flutter 프레임워크 에러를 Crashlytics에 자동 전송
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // 비동기 에러를 Crashlytics에 자동 전송
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // ═══════════════════════════════════════════════════════════════════════
  // 5. FCM 및 로컬 알림 서비스 초기화
  // ═══════════════════════════════════════════════════════════════════════
  final localNotificationsService = LocalNotificationsService.instance();
  await localNotificationsService.init();

  await FirebaseMessagingService.instance().init(
    localNotificationsService: localNotificationsService,
  );

  // ═══════════════════════════════════════════════════════════════════════
  // 6. 앱 실행
  // ═══════════════════════════════════════════════════════════════════════
  runApp(const ProviderScope(child: MyApp()));
}

/// MapSy 앱의 루트 위젯
///
/// GoRouter를 통해 선언적 라우팅을 제공하며,
/// Riverpod Provider를 통해 인증 상태를 관리합니다.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ScreenUtilInit(
      // 디자인 기준 화면 크기 (iPhone 16 기준)
      // Base design screen size (iPhone 16 standard)
      designSize: const Size(393, 852),

      // 텍스트 크기 자동 조정 (접근성 설정 반영)
      // Automatic text size adaptation (respects accessibility settings)
      minTextAdapt: true,

      // 멀티윈도우/폴더블 디바이스 대응
      // Support for multi-window and foldable devices
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp.router(
          title: 'MapSy',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
