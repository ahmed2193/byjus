import 'package:byjus/features/auth/domain/usecases/logout.dart';
import 'package:byjus/features/auth/presentation/screens/login_screen.dart';
import 'package:byjus/utils/app_strings.dart';
import 'package:byjus/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../core/preferences/preferences_manager.dart';
import 'package:byjus/injection_container.dart' as di;

import '../../data/models/user_model.dart';

class LogoutController extends GetxController {
  final Logout logoutUseCase;

  LogoutController({required this.logoutUseCase});
  RxBool isLoading = false.obs;

  Future<void> logout({
    required BuildContext context,
  }) async {
    isLoading.value = true;
    final prefs = di.sl<PreferencesManager>();
    UserModel? userInfo = await prefs.getSavedLoginCredentials();

    final Either<Failure, bool> response =
        await logoutUseCase.call(int.parse(userInfo!.data!.id!));
    isLoading.value = false;

    response.fold((falilure) {
      Constants.showToast(message: AppStrings.serverFailure);
    }, (response) {
      Get.offAll(LoginScreen());

      logoutUseCase.call(int.parse(userInfo!.data!.id!));
    });
  }
}
