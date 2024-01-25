import 'package:byjus/core/api/api_consumer.dart';
import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/api/end_points.dart';
import 'package:byjus/core/api/status_code.dart';

import '../../../../utils/app_strings.dart';
import '../../../../utils/constants.dart';
import '../models/subject_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<BaseResponse> getSubjectData();

}

class HomeRemoteDataSourceImpl extends BaseHomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;

  @override
  Future<BaseResponse> getSubjectData() async {
    final response = await apiConsumer.post(
      EndPoints.subject,
    );

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    final responseJson = Constants.decodeJson(response);

    if (response.statusCode == StatusCode.ok &&
        responseJson[AppStrings.code] == '1') {
      baseResponse.data = SubjectModel.fromJson(responseJson);
    } else {
      baseResponse.message = responseJson[AppStrings.message];
    }
    return baseResponse;
  }


}
