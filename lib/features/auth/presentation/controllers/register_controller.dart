import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/api/status_code.dart';
import 'package:byjus/core/preferences/preferences_manager.dart';
import 'package:byjus/features/auth/data/models/user_model.dart';
import 'package:byjus/features/auth/domain/usecases/register.dart';
import 'package:byjus/features/auth/presentation/controllers/app_state.dart';
import 'package:byjus/features/auth/presentation/screens/fillDetails/registration_screen.dart';
import 'package:byjus/screen/home/home_screen.dart';
import 'package:byjus/utils/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/error/failures.dart';
import 'package:byjus/injection_container.dart' as di;

class RegisterController extends GetxController {
  final Register registerUseCase;
  RegisterController(
      {required this.registerUseCase,});
  var state = ApiState.initial.obs; // Default to loading state
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  UserModel? authenticatedUser;
  final formKey = GlobalKey<FormState>();
  final TextEditingController useNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  RxString className = ''.obs;
  RxString boardName = ''.obs;
  var selectedGender = ''.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var streetAddress = "".obs;
  var detailedAddress = "".obs;
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

        if (placemarks != null && placemarks.isNotEmpty) {
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

  Future<void> register({
    // required GlobalKey<FormState> formKey,

    required String countryCode,
    required String phone,
    required String dviceType,
    required String userId,
    required String deviceToken,
    required BuildContext context,
  }) async {
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
          longitude: longitude.toString(),
          deviceType: dviceType,
          board: boardName.value,
          classValue: className.value,
          schoolName: 'test',
          gender: selectedGender.value.toString(),
          address: streetAddress.value.toString(),
          userId: userId),
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
          await di.sl<PreferencesManager>()
              .setAccessToken(authenticatedUser!.data!.token!);
          Get.offAll(HomeScreen());
        } else {
          isError.value = true;
          errorMessage.value = response.message!;
          Constants.showError(context, errorMessage.value);
        }
      },
    );
  }
}
