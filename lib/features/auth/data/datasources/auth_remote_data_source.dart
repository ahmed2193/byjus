import 'dart:developer';

import 'package:byjus/core/api/end_points.dart';
import 'package:byjus/utils/constants.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/base_response.dart';
import '../../../../core/api/status_code.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse> login({
    required String email,
    required String password,
  });

//   Future<BaseResponse> register({
//     required String userName,
//     required String email,
//     required String password,
//     required int userType,
//   });
//   Future<BaseResponse> userInfo({
// required   UserInfoParams userInfoData,
//   });
  // Future<BaseResponse> deleteAccount({
  //   required String accessToken,
  // });
  // Future<BaseResponse> forgetPassword({required String email});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;
  AuthRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<BaseResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      // 'https://mgh.webtekdemo.com/mghapi/api/login'

      EndPoints.login,
      formDataIsEnabled: true,
      body: {
        // AppStrings.email: email,
        // AppStrings.password: password,
      },
    );

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    final responseJson = Constants.decodeJson(response);
    log(responseJson['status'].toString());
    log(response.statusCode.toString());
    log(responseJson['error'].toString());
    if (response.statusCode == StatusCode.ok) {
      final UserModel userModel = UserModel.fromJson(responseJson);
      baseResponse.data = userModel;
    } else {
      baseResponse.message = responseJson['error'];
    }
    return baseResponse;
  }

  // @override
  // Future<BaseResponse> register({
  //   required String userName,
  //   required String email,
  //   required String password,
  //   required int userType,
  // }) async {
  //   final response = await apiConsumer.post(
  //     formDataIsEnabled: true,
  //     'https://mgh.webtekdemo.com/mghapi/api/register',
  //     // EndPoints.signup,
  //     body: {
  //       AppStrings.name: userName,
  //       AppStrings.email: email,
  //       AppStrings.password: password,
  //       AppStrings.userType: userType,
  //     },
  //   );
  //   final BaseResponse baseResponse =
  //       BaseResponse(statusCode: response.statusCode);
  //   final responseJson = Constants.decodeJson(response);
  //   if (response.statusCode == StatusCode.ok) {
  //     final UserModel userModel = UserModel.fromJson(responseJson);
  //     baseResponse.data = userModel;
  //   } else {
  //     // if (responseJson[AppStrings.errors][AppStrings.email] != null &&
  //     //     responseJson[AppStrings.errors][AppStrings.userName] != null) {
  //     //   baseResponse.message =
  //     //       '${responseJson[AppStrings.errors][AppStrings.email][0]} \n ${responseJson[AppStrings.errors][AppStrings.userName][0] ?? ''} ';
  //     // } else if (responseJson[AppStrings.errors][AppStrings.email] != null) {
  //     //   baseResponse.message =
  //     //       '${responseJson[AppStrings.errors][AppStrings.email][0]}  ';
  //     // } else {
  //     //   baseResponse.message =
  //     //       '${responseJson[AppStrings.errors][AppStrings.userName][0]}  ';
  //     // }
  //   }
  //   return baseResponse;
  // }

  // @override
  // Future<BaseResponse> userInfo({required UserInfoParams userInfoData}) async {
  //   final response = await apiConsumer.post(
  //     'https://mgh.webtekdemo.com/mghapi/api/update-user-info'

  //     // EndPoints.login

  //     ,
  //          headers: {AppStrings.authorization: userInfoData.accessToken},
  //     formDataIsEnabled: false,
  //     body: {
  //   //       "gender": "Male",
  //   // "age": 31,
  //   // "weight": 85,
  //   // "height": 180
  //       AppStrings.gender: userInfoData.gender,
  //       AppStrings.age: userInfoData.age,
  //       AppStrings.height: userInfoData.height,
  //       AppStrings.weight: userInfoData.weight,
  //     },
  //   );

  //   final BaseResponse baseResponse =
  //       BaseResponse(statusCode: response.statusCode);
  //   final responseJson = Constants.decodeJson(response);
  //   if (response.statusCode == StatusCode.ok) {
  //     final UserModel userModel = UserModel.fromJson(responseJson);
  //     baseResponse.data = userModel;
  //   }
  //   return baseResponse;
  // }
}
