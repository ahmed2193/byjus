import 'package:byjus/utils/app_strings.dart';
import 'package:byjus/utils/constants.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class TermsAndConditionsRemoteDataSource {
  Future<String> getTermsAndConditions();
}

class TermsAndConditionsRemoteDataSourceImpl
    implements TermsAndConditionsRemoteDataSource {
  final ApiConsumer apiConsumer;
  TermsAndConditionsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> getTermsAndConditions() async {
    final response = await apiConsumer.get(
      EndPoints.termsConditions,
    );
    final responseJson = Constants.decodeJson(response);
    return responseJson[AppStrings.data][AppStrings.pageContent];
  }
}
