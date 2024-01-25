import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/usecase.dart';
 import 'package:byjus/features/home/data/models/subject_model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../../core/app_state.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_subject_usecase.dart';

class SubjectController extends GetxController {
  final GetSubjectUseCase useCase;

  SubjectController({required this.useCase});
  var apiState = ApiState.loading.obs;
  RxString errorMessage = ''.obs;
  SubjectModel? subjectData;

  Future<void> fetchData() async {
    apiState(ApiState.loading);

    Either<Failure, BaseResponse> response = await useCase.call(NoParams());
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
      return subjectData = data.data;
    });
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
