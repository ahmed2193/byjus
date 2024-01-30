import 'package:byjus/features/auth/presentation/controllers/user_info_controller.dart';
import 'package:byjus/screen/splash/splash_screen.dart';
import 'package:byjus/test_2.dart';

import 'features/subject/presentation/screens/subScreen/video/video_screen.dart';
import 'injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      di.sl<UserInfoController>(),
    );
    return GetMaterialApp(
      // home: VideoScreen(),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
