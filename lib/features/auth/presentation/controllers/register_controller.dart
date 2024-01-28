import 'dart:io';

import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/api/status_code.dart';
import 'package:byjus/features/auth/data/models/user_model.dart';
import 'package:byjus/features/auth/domain/usecases/register.dart';
import 'package:byjus/features/auth/presentation/controllers/user_info_controller.dart';
import 'package:byjus/features/auth/presentation/screens/enter_otp_screen.dart';
import 'package:byjus/utils/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/app_state.dart';
import '../../../../core/error/failures.dart';

class RegisterController extends GetxController {
  final Register registerUseCase;
  RegisterController({
    required this.registerUseCase,
  });
  var state = ApiState.initial.obs; // Default to loading state
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  int selectedIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  UserModel? authenticatedUser;
  final formKey = GlobalKey<FormState>();
  final TextEditingController useNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  RxString classId = ''.obs;
  RxString boardId = ''.obs;
  var selectedGender = ''.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var streetAddress = "".obs;
  var detailedAddress = "".obs;
  final UserInfoController userInfoController = Get.find();

  void setGender(String value) {
    selectedGender.value = value;
  }

  Future<void> getCurrentLocation() async {
    try {
      state.value = ApiState.loading;
      var status = await Permission.location.status;
      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        latitude.value = position.latitude;
        longitude.value = position.longitude;

        List<Placemark> placemarks =
            await placemarkFromCoordinates(latitude.value, longitude.value);

        if (placemarks.isNotEmpty) {
          Placemark place = placemarks.first;
          streetAddress.value = '${place.administrativeArea} ${place.country}';
          detailedAddress.value =
              "${place.subThoroughfare} ${place.thoroughfare}, ${place.locality}, ${place.administrativeArea} ${place.postalCode}, ${place.country}";
          state.value = ApiState.success;
        } else {
          streetAddress.value = "Address not found";
          detailedAddress.value = "";
          state.value = ApiState.error;
        }
      } else {
        // If permission is not granted, request it
        await Permission.location.request();
        state.value = ApiState.error;
      }
    } catch (e) {
      print("Error getting location: $e");
      state.value = ApiState.error;
    }
  }

  Future<void> register(
      {
      // required GlobalKey<FormState> formKey,

      required String countryCode,
      required String phone,
      required String dviceType,
      required String userId,
      required String deviceToken,
      required BuildContext context,
      File? profileImage}) async {
    isError.value = false;
    isLoading.value = true;

    final Either<Failure, BaseResponse> response = await registerUseCase.call(
      RegisterParams(
          countryCode: countryCode,
          phone: phone,
          // dviceType: dviceType,
          // signUpType: signUpType,
          deviceToken: deviceToken,
          username: useNameController.text,
          latitude: latitude.value.toString(),
          longitude: longitude.value.toString(),
          deviceType: dviceType,
          board: boardId.value,
          classValue: classId.value,
          schoolName: schoolNameController.text,
          gender: selectedGender.value.toString(),
          address: streetAddress.value.toString(),
          userId: userId,
          zipcode: zipCodeController.text,
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
          // useNameController.clear();
          // emailController.clear();
          // selectedGender = ''.obs;
          // longitude.value = 0.0;
          // longitude.value = 0.0;
          // boardId.value = '';
          // classId.value = '';
          // selectedGender.value = '';
          // streetAddress.value = '';

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
