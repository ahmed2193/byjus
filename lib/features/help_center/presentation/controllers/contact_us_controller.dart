
import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/api/status_code.dart';
import 'package:byjus/features/auth/presentation/controllers/user_info_controller.dart';
import 'package:byjus/utils/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/app_state.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/contact_us_usecase.dart';

class ContactUsController extends GetxController {
  final ContactUsUseCase contactUsUseCase;
  ContactUsController({
    required this.contactUsUseCase,
  });
  var state = ApiState.initial.obs; // Default to loading state
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  final formKey = GlobalKey<FormState>();
  final TextEditingController msgController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final UserInfoController userInfoController = Get.find();

  Future<void> contactUs({
    required BuildContext context,
  }) async {
    isError.value = false;
    isLoading.value = true;

    final Either<Failure, BaseResponse> response = await contactUsUseCase.call(
      ContactUsParams(
          title: 'title',
          userType: 'poster',
          msg: msgController.text,
          userId: userInfoController.userInfo.value!.data!.id!,
          email: emailController.text),
    );
    // var deviceid = await FlutterUdid.udid;
    isLoading.value = false;
    response.fold(
      (failure) {
        isError.value = true;
        Constants.showError(context, failure.message!);
        clearData();
      },
      (response) async {
        if (response.statusCode == StatusCode.ok && response.message == null) {
          clearData();
          Constants.showToast(message: response.message!);
          // Get.to(EnterOtpScreen());
        } else {
          isError.value = true;
          errorMessage.value = response.message!;
                  clearData();

          Constants.showError(context, errorMessage.value);
        }
      },
    );
  }

  clearData() {
    emailController.clear();
    msgController.clear();
  }
}
