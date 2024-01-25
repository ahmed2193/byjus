import 'package:byjus/utils/app_strings.dart';
import 'package:byjus/utils/constants.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/base_response.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/status_code.dart';
import 'package:byjus/features/profile/domain/usecases/edit_profile.dart';

import '../../../auth/data/models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<BaseResponse> editProfile({
    required EditProfileParams params,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer apiConsumer;
  ProfileRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<BaseResponse> editProfile({required EditProfileParams params}) async {
    var body = {
      AppStrings.userName: params.username,
      AppStrings.userId: params.userId,
      AppStrings.email: params.email,
      AppStrings.countryCcode: params.countryCode,
      AppStrings.phone: params.phone,
      AppStrings.schoolName: params.schoolName,
      AppStrings.gender: params.gender,
      AppStrings.address: params.address,
      if (params.profileImage != null) ...{
        AppStrings.profileImage:
            await MultipartFile.fromFile(params.profileImage!.absolute.path)
      }
    };
    print(body);
    final response = await apiConsumer.post(EndPoints.editProfile,
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
}
