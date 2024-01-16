
import 'package:byjus/core/api/end_points.dart';
import 'package:byjus/features/auth/domain/usecases/login.dart';
import 'package:byjus/features/auth/domain/usecases/otp_verify.dart';
import 'package:byjus/utils/app_strings.dart';
import 'package:byjus/utils/constants.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/base_response.dart';
import '../../../../core/api/status_code.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse> login({
    required LoginParams params,
  });
  Future<BaseResponse> otpVerify({
    required OtpVerifyParams params,
  });


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
        responseJson[AppStrings.code] == '4'||responseJson[AppStrings.code] == '5'||responseJson[AppStrings.code] == '1') {
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

}
