import 'package:byjus/core/api/end_points.dart';
import 'package:byjus/core/error/exceptions.dart';
import 'package:byjus/core/preferences/preferences_manager.dart';
import 'package:byjus/features/auth/data/models/board_and_class_model.dart';
import 'package:byjus/features/auth/domain/usecases/login.dart';
import 'package:byjus/features/auth/domain/usecases/otp_verify.dart';
import 'package:byjus/features/auth/domain/usecases/register.dart';
import 'package:byjus/utils/app_strings.dart';
import 'package:byjus/utils/constants.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/base_response.dart';
import '../../../../core/api/status_code.dart';

import '../models/user_model.dart';
import 'package:byjus/injection_container.dart' as di;

abstract class AuthRemoteDataSource {
  Future<BaseResponse> login({
    required LoginParams params,
  });

  Future<BaseResponse> otpVerify({
    required OtpVerifyParams params,
  });
  Future<BaseResponse> register({
    required RegisterParams params,
  });

  Future<BaseResponse> getBoardList();
  Future<BaseResponse> getClassList();
  Future<bool> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;
  AuthRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<BaseResponse> login({
    required LoginParams params,
  }) async {
    final response = await apiConsumer.post(
      EndPoints.login,
      formDataIsEnabled: true,
      body: {
        AppStrings.countryCcode: params.countryCode,
        AppStrings.phone: params.phone,
        AppStrings.deviceToken: params.deviceToken,
        AppStrings.deviceType: params.dviceType,
        AppStrings.signupType: params.signUpType,
      },
    );

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    final responseJson = Constants.decodeJson(response);

    if (response.statusCode == StatusCode.ok &&
            responseJson[AppStrings.code] == '4' ||
        responseJson[AppStrings.code] == '5' ||
        responseJson[AppStrings.code] == '1') {
      final UserModel userModel = UserModel.fromJson(responseJson);

      baseResponse.data = userModel;
    } else if (responseJson[AppStrings.code] == '0') {
      baseResponse.message = responseJson['message'];
    }
    return baseResponse;
  }

  @override
  Future<BaseResponse> otpVerify({required OtpVerifyParams params}) async {
    final response = await apiConsumer.post(
      EndPoints.otpVerify,
      formDataIsEnabled: true,
      body: {
        AppStrings.userId: params.userId,
        AppStrings.otpCode: params.otpCode,
      },
    );

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    final responseJson = Constants.decodeJson(response);

    if (response.statusCode == StatusCode.ok &&
        responseJson[AppStrings.code] == '1') {
      final UserModel userModel = UserModel.fromJson(responseJson);

      baseResponse.data = userModel;
    } else if (responseJson[AppStrings.code] == '0') {
      baseResponse.message = responseJson['message'];
    }
    return baseResponse;
  }

  @override
  Future<BaseResponse> register({required RegisterParams params}) async {
    var body = {
      AppStrings.userName: params.username,
      AppStrings.userId: params.userId,
      AppStrings.countryCcode: params.countryCode,
      AppStrings.phone: params.phone,
      AppStrings.latitude: params.latitude,
      AppStrings.longitude: params.longitude,
      AppStrings.deviceToken: params.deviceToken,
      AppStrings.board: params.board,
      AppStrings.classValue: params.classValue,
      AppStrings.schoolName: params.schoolName,
      AppStrings.gender: params.gender,
      AppStrings.address: params.address,
      AppStrings.deviceType: params.deviceToken,
    };
    print(body);
    final response = await apiConsumer.post(EndPoints.signup,
        formDataIsEnabled: true, body: body);

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    final responseJson = Constants.decodeJson(response);

    if (response.statusCode == StatusCode.ok &&
        responseJson[AppStrings.code] == '1') {
      final UserModel userModel = UserModel.fromJson(responseJson);

      baseResponse.data = userModel;
    } else if (responseJson[AppStrings.code] == '0') {
      baseResponse.message = responseJson['message'];
    }
    return baseResponse;
  }

  @override
  Future<BaseResponse> getBoardList() async {
    final response = await apiConsumer.get(EndPoints.boardList);

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    debugPrint('response.statusCode ${response.statusCode}');
    final responseJson = Constants.decodeJson(response);
    if (response.statusCode == StatusCode.ok) {
      final BoardAndClassModel boardAndClassModel =
          BoardAndClassModel.fromJson(responseJson);
      baseResponse.data = boardAndClassModel;
    } else {
      baseResponse.message = responseJson['message'];
      throw const ServerException();
    }
    return baseResponse;
  }

  @override
  Future<BaseResponse> getClassList() async {
    final response = await apiConsumer.get(EndPoints.classList);

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    debugPrint('response.statusCode ${response.statusCode}');
    final responseJson = Constants.decodeJson(response);
    if (response.statusCode == StatusCode.ok) {
      final BoardAndClassModel boardAndClassModel =
          BoardAndClassModel.fromJson(responseJson);
      baseResponse.data = boardAndClassModel;
    } else {
      baseResponse.message = responseJson['message'];
      throw const ServerException();
    }
    return baseResponse;
  }

  @override
  Future<bool> logout() async {
    final prefs = di.sl<PreferencesManager>();
    await prefs.clearToken();
    return true;
  }
}
