import 'package:byjus/features/auth/presentation/controllers/user_info_controller.dart';
import 'package:byjus/screen/splash/splash_screen.dart';

import 'features/auth/presentation/controllers/register_controller.dart';

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
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
