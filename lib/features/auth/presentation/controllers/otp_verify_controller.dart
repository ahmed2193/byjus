import 'package:byjus/core/preferences/preferences_manager.dart';
import 'package:byjus/features/auth/data/models/user_model.dart';
import 'package:byjus/features/auth/domain/usecases/otp_verify.dart';
import 'package:byjus/features/auth/presentation/controllers/login_controller.dart';
import 'package:byjus/features/auth/presentation/controllers/user_info_controller.dart';
import 'package:byjus/features/home/presentation/screens/home_screen.dart';
import 'package:byjus/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/api/base_response.dart';
import '../../../../../core/api/status_code.dart';
import '../../../../../core/error/failures.dart';
import 'package:byjus/injection_container.dart' as di;

import '../../../home/presentation/controllers/get_subject_controller.dart';
import '../../../subject/presentation/controllers/get_subject_chapter_controller.dart';


class OtpVerifyController extends GetxController {
  final OtpVerify otpVerifyUseCase;

  OtpVerifyController({required this.otpVerifyUseCase});
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  UserModel? authenticatedUser;
  final LoginController loginController = Get.find();
  final UserInfoController userInfoController = Get.find();

  Future<void> otpVerify({
    required String userId,
    required String otpCode,
    required BuildContext context,
  }) async {
    isError.value = false;
    isLoading.value = true;

    final Either<Failure, BaseResponse> response = await otpVerifyUseCase.call(
      OtpVerifyParams(
        otpCode: otpCode,
        userId: userId,
      ),
    );
    isLoading.value = false;
    response.fold(
      (failure) {
        isError.value = true;

        return errorMessage.value = failure.message!;
      },
      (response) async {
        if (response.statusCode == StatusCode.ok && response.message == null) {
          authenticatedUser = response.data;
          Constants.showToast(message: authenticatedUser!.message!);

          await di
              .sl<PreferencesManager>()
              .setAccessToken(authenticatedUser!.data!.token!);
          await userInfoController.saveLoginCredentials(
              userModel: authenticatedUser!);
             Get.put(
    di.sl<SubjectController>(),
  );
          Get.to(HomeScreen());
        } else {
          isError.value = true;
          errorMessage.value = response.message!;
          Constants.showError(context, errorMessage.value);
        }
      },
    );
  }
}
