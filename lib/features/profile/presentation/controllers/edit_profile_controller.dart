import 'dart:developer';
import 'dart:io';

import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/api/status_code.dart';
import 'package:byjus/features/auth/data/models/user_model.dart';
import 'package:byjus/features/auth/presentation/controllers/user_info_controller.dart';
import 'package:byjus/utils/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/app_state.dart';
import '../../../../core/error/failures.dart';

import '../../domain/usecases/edit_profile.dart';

class EditProfileController extends GetxController {
  final EditProfile editProfileUseCase;
  EditProfileController({
    required this.editProfileUseCase,
  });
  var state = ApiState.initial.obs; // Default to loading state
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  int? selectedIndex;
  UserModel? userModel;
  final formKey = GlobalKey<FormState>();

  final UserInfoController userInfoController = Get.find();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController dateController = TextEditingController();
  String? profileImage;
  String? userId;
  String? countryCode;

  var selectedGender = ''.obs;

  @override
  void onInit() {
    var userInfo = userInfoController.userInfo.value!.data!;
    log('userInfo.address!');
    log(userInfo.address!);
    userId = userInfo.id;
    countryCode = userInfo.countryCode;
    nameController.text = userInfo.username!;
    profileImage = userInfo.profileImage;
    genderController.text = userInfo.schoolName!;

    mobileController.text = '${userInfo.countryCode!}-${userInfo.phone!}';

    emailController.text = userInfo.email!;

    addressController.text = userInfo.address!;

    dateController.text = userInfo.birthDate!;
    log(userInfo.gender!);
    userInfo.gender!.contains('Male')
        ? selectedGender.value = 'Male'
        : selectedGender.value = 'Female';
    super.onInit();
  }

  void setGender(String value) {
    selectedGender.value = value;
  }

  Future<void> editProfile(
      {required BuildContext context, File? profileImage}) async {
    isError.value = false;
    isLoading.value = true;

    final Either<Failure, BaseResponse> response =
        await editProfileUseCase.call(
      EditProfileParams(
          countryCode: countryCode!,
          phone: mobileController.text,
          username: nameController.text,
          schoolName: genderController.text,
          gender: selectedGender.value.toString(),
          address: addressController.text,
          userId: userId!,
          profileImage: profileImage,
          email: emailController.text),
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
          userModel = response.data;
          Constants.showToast(message: userModel!.message!);

          await userInfoController.upateCredentials(userModel: userModel!);
        } else {
          isError.value = true;
          errorMessage.value = response.message!;
          Constants.showError(context, errorMessage.value);
        }
      },
    );
  }
}
