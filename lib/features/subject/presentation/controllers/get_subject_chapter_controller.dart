import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/app_state.dart';
import 'package:byjus/features/subject/data/models/subjects_chapter_model.dart';
 
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../../core/error/failures.dart';
 import '../../domain/usecases/get_subject_chapter_usecase.dart';

class SubjectChapterController extends GetxController {
  final GetSubjectChapterUseCase useCase;

  SubjectChapterController({required this.useCase});
  var apiState = ApiState.loading.obs;
  RxString errorMessage = ''.obs;
  SubjectChapterModel? subjectChapterData;
  Future<void> fetchData({
    required int id
  }) async {
    apiState(ApiState.loading);

    Either<Failure, BaseResponse> response = await useCase.call(id);
    response.fold((failure) {
      apiState(ApiState.error);
      return errorMessage.value = failure.message!;
    }, (data) {
        if (data.data == null) {
        apiState(ApiState.error);
        return errorMessage.value = data.message!;
      }
      apiState(ApiState.success);
      print(data.data);
      return subjectChapterData = data.data;
    });
  }

  // @override
  // void onInit() {
  //   fetchData();
  //   super.onInit();
  // }
}
