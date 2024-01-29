import 'package:byjus/utils/app_strings.dart';
import 'package:byjus/utils/constants.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class PrivacyPolicyRemoteDataSource {
  Future<String> getPrivacyPolicy();
}

class PrivacyPolicyRemoteDataSourceImpl
    implements PrivacyPolicyRemoteDataSource {
  final ApiConsumer apiConsumer;
  PrivacyPolicyRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> getPrivacyPolicy() async {
    final response = await apiConsumer.get(
      EndPoints.privacypolicy,
    );
    final responseJson = Constants.decodeJson(response);
    return responseJson[AppStrings.data][AppStrings.description];
  }
}
