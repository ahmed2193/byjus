import 'dart:async';
import 'package:byjus/core/preferences/preferences_manager.dart';
import 'package:byjus/features/auth/presentation/screens/login_screen.dart';
import 'package:byjus/features/home/presentation/screens/home_screen.dart';
import 'package:byjus/features/Welcome/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:byjus/injection_container.dart' as di;

class SplashController extends GetxController{

  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () =>startScreen() );
    super.onInit();
  }

   startScreen() async {
  final prefs = di.sl<PreferencesManager>();
  final token = await prefs.getAccessToken();
  final onBoarding = await prefs.getOnBoarding();
  if (onBoarding == null) {
    return  Get.to(WelcomeScreen()) ;
  } else if (token != null) {
    return Get.to(HomeScreen());
  } else {
    return Get.to(LoginScreen()) ;
  }
}
}