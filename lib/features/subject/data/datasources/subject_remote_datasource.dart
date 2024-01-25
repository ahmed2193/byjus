import 'package:byjus/core/api/api_consumer.dart';
import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/api/end_points.dart';
import 'package:byjus/core/api/status_code.dart';
import 'package:byjus/utils/app_strings.dart';

import '../../../../utils/constants.dart';
import '../models/subjects_chapter_model.dart';

abstract class BaseSubjectRemoteDataSource {
  Future<BaseResponse> getChapterDetails({
    required int id,
  });
  Future<BaseResponse> getSubjectChapterData({
    required int id,
  });
}

class SubjectRemoteDataSourceImpl extends BaseSubjectRemoteDataSource {
  SubjectRemoteDataSourceImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;

  @override
  Future<BaseResponse> getSubjectChapterData({
    required int id,
  }) async {
    final response = await apiConsumer.post(EndPoints.subjectChapter,
        formDataIsEnabled: true, body: {AppStrings.subjectId: id.toString()});

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    final responseJson = Constants.decodeJson(response);

    if (response.statusCode == StatusCode.ok &&
        responseJson[AppStrings.code] == '1') {
      baseResponse.data = SubjectChapterModel.fromJson(responseJson);
    } else {
      baseResponse.message = responseJson[AppStrings.message];
    }
    return baseResponse;
  }

  @override
  Future<BaseResponse> getChapterDetails({
    required int id,
  }) async {
    final response = await apiConsumer.post(EndPoints.chapterDetails,
        formDataIsEnabled: true, body: {AppStrings.chapterId: id});

    final BaseResponse baseResponse =
        BaseResponse(statusCode: response.statusCode);
    final responseJson = Constants.decodeJson(response);

    if (response.statusCode == StatusCode.ok &&
        responseJson[AppStrings.code] == '1') {
      baseResponse.data = SubjectChapterModel.fromJson(responseJson);
    } else {
      baseResponse.message = responseJson[AppStrings.message];
    }
    return baseResponse;
  }
}