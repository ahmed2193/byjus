import 'package:byjus/features/auth/presentation/screens/login_screen.dart';

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
    return GetMaterialApp(
      home:
          //  EnterOtpScreen(),
           LoginScreen(),
          // SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
