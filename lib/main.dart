import 'injection_container.dart' as di;
import 'package:byjus/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:
          //  TermsAndConditionsScreen(),
          SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
