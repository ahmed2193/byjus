import 'package:byjus/core/preferences/preferences_utils.dart';

import 'preferences_keys.dart';

class PreferencesManager {
  Future<bool> clearData() async {
    return await PreferencesUtils.clearData();
  }

  Future<void> setLogOut() async {
    await PreferencesUtils.setBool(PreferencesKeys.isLoggedIn.name, false);
  }

  Future<bool> setLocale(String data) async {
    return await PreferencesUtils.setString(PreferencesKeys.lang.name, data);
  }

  Future<String?> getLocale() async {
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

  Future<String?> getAccessToken() async {
    return await PreferencesUtils.getString(PreferencesKeys.accessToken.name);
  }

  Future<String?> getOnBoarding() async {
    return await PreferencesUtils.getString(PreferencesKeys.onBoarding.name);
  }

  Future<void> setOnBoardingDone() async {
    await PreferencesUtils.setString(PreferencesKeys.onBoarding.name, "done");
  }

  Future<void> clearToken() async {
    await PreferencesUtils.delete(PreferencesKeys.accessToken.name);
  }
}
