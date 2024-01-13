import 'dart:developer';

import 'package:byjus/features/auth/data/models/user_model.dart';
import 'package:byjus/features/auth/domain/usecases/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/api/base_response.dart';
import '../../../../../core/api/status_code.dart';
import '../../../../../core/error/failures.dart';

class LoginController extends GetxController {
  final Login loginUseCase;

  LoginController({required this.loginUseCase});
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  UserModel? authenticatedUser;
  Future<void> login({
    // required GlobalKey<FormState> formKey,
    required String email,
    required String password,
    required bool isRememberMe,
  }) async {
    isLoading.value = true;
    isError.value = false;
    final Either<Failure, BaseResponse> response = await loginUseCase.call(
      LoginParams(
        email: email,
        password: password,
      ),
    );
    var deviceid = await FlutterUdid.udid;
    log(deviceid);
    isLoading.value = false;
    response.fold(
      (failure) {
        isError.value = true;

        return errorMessage.value = authenticatedUser!.msg!;
      },
      (response) async {
        if (response.statusCode == StatusCode.ok) {
          authenticatedUser = response.data;
          if (authenticatedUser!.status!) {
            // await rememberMe(isRememberMe, email, password);

            // await saveLoginCredentials
            //     .call(SaveLoginCredentialsParams(user: authenticatedUser!));

            // authenticated();
          } else {
            isError.value = true;
            errorMessage.value = authenticatedUser!.msg!;
          }
        } else {
          isError.value = true;
          errorMessage.value = response!.message!;

          // unauthenticated(message: response.message! ?? "error");
        }
      },
    );
  }

  // else {
  //   validateLogin();
  // }
}
