import 'package:byjus/features/auth/data/models/user_model.dart';
import 'package:byjus/features/auth/domain/usecases/otp_verify.dart';
import 'package:byjus/features/auth/presentation/screens/fillDetails/fill_details_screen.dart';
import 'package:byjus/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/api/base_response.dart';
import '../../../../../core/api/status_code.dart';
import '../../../../../core/error/failures.dart';

class OtpVerifyController extends GetxController {
  final OtpVerify otpVerifyUseCase;

  OtpVerifyController({required this.otpVerifyUseCase});
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  UserModel? authenticatedUser;

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

          Get.to(FillDetailsScreen());
        } else {
          isError.value = true;
          errorMessage.value = response.message!;
          Constants.showError(context, errorMessage.value);
        }
      },
    );
  }

  
}
