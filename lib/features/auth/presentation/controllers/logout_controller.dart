import 'package:byjus/features/auth/domain/usecases/logout.dart';
import 'package:byjus/features/auth/presentation/screens/login_screen.dart';
import 'package:byjus/utils/app_strings.dart';
import 'package:byjus/utils/constants.dart';
import 'package:byjus/utils/usecases/usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

class LogoutController extends GetxController {
  final Logout logoutUseCase;

  LogoutController({required this.logoutUseCase});
  RxBool isLoading = false.obs;

  Future<void> logout({
    required BuildContext context,
  }) async {
    isLoading.value = true;

    final Either<Failure, bool> response = await logoutUseCase.call(NoParams());
    isLoading.value = false;

    response.fold((falilure) {
      Constants.showToast(message: AppStrings.serverFailure);
    }, (response) {
      Get.offAll(LoginScreen());

      logoutUseCase.call(NoParams());
    });
  }
}
