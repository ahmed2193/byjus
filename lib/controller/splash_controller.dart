import 'dart:async';
import 'package:byjus/screen/Welcome/welcome_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () => Get.to((WelcomeScreen())));
    super.onInit();
  }
}