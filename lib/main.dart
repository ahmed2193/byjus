import 'package:byjus/features/auth/presentation/screens/login_screen.dart';
import 'package:byjus/test_2.dart';

import 'features/auth/presentation/controllers/register_controller.dart';
import 'features/auth/presentation/screens/fillDetails/fill_details_screen.dart';
import 'features/auth/presentation/screens/fillDetails/registration_screen.dart';
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
    final RegisterController controller = Get.put(di.sl<RegisterController>());

    return GetMaterialApp(
      home: FillDetailsScreen(),
      //  LoginScreen(),
      // SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
