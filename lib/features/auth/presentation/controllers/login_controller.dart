import 'package:byjus/features/auth/data/models/user_model.dart';
import 'package:byjus/features/auth/domain/usecases/login.dart';
import 'package:byjus/features/auth/presentation/screens/enter_otp_screen.dart';
import 'package:byjus/utils/constants.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/api/base_response.dart';
import '../../../../../core/api/status_code.dart';
import '../../../../../core/error/failures.dart';

class LoginController extends GetxController {
  final Login loginUseCase;

  LoginController({required this.loginUseCase});
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  UserModel? authenticatedUser;

  RxString selectedCountryCode = "+91".obs;

  void onCountryCodeChanged(CountryCode country) {
    selectedCountryCode.value = country.dialCode!;
  }

  Future<void> login({
    // required GlobalKey<FormState> formKey,

    required String countryCode,
    required String phone,
    required String dviceType,
    required String signUpType,
    required String deviceToken,
    required BuildContext context,
  }) async {
    isError.value = false;
    isLoading.value = true;

    final Either<Failure, BaseResponse> response = await loginUseCase.call(
      LoginParams(
          countryCode: countryCode,
          phone: phone,
          dviceType: dviceType,
          signUpType: signUpType,
          deviceToken: deviceToken),
    );
    // var deviceid = await FlutterUdid.udid;
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
          
                    Get.to(EnterOtpScreen());

          
        } else {
          isError.value = true;
          errorMessage.value = response.message!;
          Constants.showError(context, errorMessage.value);
        }
      },
    );
  }
}
