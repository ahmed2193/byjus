import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/usecase.dart';
import 'package:byjus/features/auth/data/models/board_and_class_model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../../core/app_state.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_class_list.dart';

class ClassListController extends GetxController {
  final GetClassList useCase;

  ClassListController({required this.useCase});
  var apiState = ApiState.loading.obs;
  RxString errorMessage = ''.obs;
  BoardAndClassModel? classListData;

  Future<void> fetchData() async {
    apiState(ApiState.loading);

    Either<Failure, BaseResponse> response = await useCase.call(NoParams());
    response.fold((failure) {
      apiState(ApiState.error);
      return errorMessage.value = failure.message!;
    }, (data) {
      apiState(ApiState.success);
      return classListData = data.data;
    });
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}

