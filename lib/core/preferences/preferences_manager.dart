import 'dart:convert';

import 'package:byjus/core/preferences/preferences_utils.dart';
import 'package:byjus/features/auth/data/models/user_model.dart';
import 'package:byjus/utils/app_strings.dart';

import 'preferences_keys.dart';

class PreferencesManager {
  Future<bool> clearData() async {
    return await PreferencesUtils.clearData();
  }

  Future<void> setLogOut() async {
    await PreferencesUtils.setBool(PreferencesKeys.isLoggedIn.name, false);
  }

  Future<UserModel?> getSavedLoginCredentials() async {
    final String? userDataString =
        await PreferencesUtils.getString(AppStrings.user);

    if (userDataString != null) {
      final userData = await json.decode(userDataString);
      return UserModel.fromJson(userData);
    } else {
      return null;
    }
  }

  Future<bool> saveLoginCredentials({required UserModel userModel}) async =>
      PreferencesUtils.setString(AppStrings.user, json.encode(userModel));

  logout() async {
    return PreferencesUtils.delete(AppStrings.user);
  }

  Future<bool> setLocale(String data) async {
    return await PreferencesUtils.setString(PreferencesKeys.lang.name, data);
  }

  Future<Object?> getLocale() async {
    return await PreferencesUtils.getString(PreferencesKeys.lang.name);
  }

  Future<void> setLoggedIn() async {
    await PreferencesUtils.setBool(PreferencesKeys.isLoggedIn.name, true);
  }

  Future<bool> isLoggedIn() async {
    return await PreferencesUtils.getBool(PreferencesKeys.isLoggedIn.name);
  }

  Future<void> setAccessToken(String data) async {
    await PreferencesUtils.setString(PreferencesKeys.accessToken.name, data);
  }

  Future<Object?> getAccessToken() async {
    return await PreferencesUtils.getString(PreferencesKeys.accessToken.name);
  }

  Future<Object?> getOnBoarding() async {
    return await PreferencesUtils.getString(PreferencesKeys.onBoarding.name);
  }

  Future<void> setOnBoardingDone() async {
    await PreferencesUtils.setString(PreferencesKeys.onBoarding.name, "done");
  }

  Future<void> clearToken() async {
    await PreferencesUtils.delete(PreferencesKeys.accessToken.name);
  }
}
