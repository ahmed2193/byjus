import 'package:byjus/features/auth/data/models/user_model.dart';
import 'package:get/get.dart';
import '../../../../core/app_state.dart';
import 'package:byjus/injection_container.dart' as di;

import '../../../../core/preferences/preferences_manager.dart';

class UserInfoController extends GetxController {
  var prefs = di.sl<PreferencesManager>();

  var apiState = Rx<ApiState>(ApiState.initial);

  Rx<UserModel?> userInfo = Rx<UserModel?>(null);

  getSavedLoginCredentials() async {
    apiState.value = ApiState.loading;
    try {
      userInfo.value = await prefs.getSavedLoginCredentials();
      apiState.value = ApiState.success;
    } catch (error) {
      apiState.value = ApiState.error;
      print("Error: $error");
    }
  }

  saveLoginCredentials({required UserModel userModel}) async {
    apiState.value = ApiState.loading;
    try {
      await prefs.saveLoginCredentials(userModel: userModel);
      userInfo.value = userModel;
      apiState.value = ApiState.success;
    } catch (error) {
      apiState.value = ApiState.error;
      print("Error: $error");
    }
  }

  upateCredentials({required UserModel userModel}) async {
    apiState.value = ApiState.loading;
    try {
      await prefs.logout();
      await di
          .sl<PreferencesManager>()
          .saveLoginCredentials(userModel: userModel);
      getSavedLoginCredentials();
      apiState.value = ApiState.success;
    } catch (error) {
      apiState.value = ApiState.error;
      print("Error: $error");
    }
  }
}
