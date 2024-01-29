
import 'package:byjus/core/api/api_consumer.dart';
import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/api/end_points.dart';
import 'package:byjus/core/api/status_code.dart';
import 'package:byjus/utils/app_strings.dart';

import '../../../../utils/constants.dart';
import '../../domain/usecases/contact_us_usecase.dart';

abstract class BaseHelpCenterDataSource {
  Future<BaseResponse> contactUs({required ContactUsParams params});
}

class HelpCenterDataSourceImpl extends BaseHelpCenterDataSource {
  HelpCenterDataSourceImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;

  @override
  Future<BaseResponse> contactUs({
    required ContactUsParams params,
  }) async {
    final response = await apiConsumer
        .post(EndPoints.contactUs, formDataIsEnabled: true, body: {
      AppStrings.id: params.userId,
      AppStrings.userType: params.userType,
      AppStrings.email: params.email,
      AppStrings.message: params.msg,
      AppStrings.title: params.title,
    });

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    final responseJson = Constants.decodeJson(response);

    if (response.statusCode == StatusCode.ok &&
        responseJson[AppStrings.code] == '1') {
      baseResponse.message = responseJson[AppStrings.message];
    } else {
      baseResponse.message = responseJson[AppStrings.message];
    }
    return baseResponse;
  }
}
