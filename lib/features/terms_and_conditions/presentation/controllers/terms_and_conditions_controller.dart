import 'package:byjus/core/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../../core/app_state.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_terms_and_conditions.dart';

class TermsAndConditionsController extends GetxController {
  final GetTermsAndConditions useCase;

  TermsAndConditionsController({required this.useCase});
  var apiState = ApiState.loading.obs;
  RxString errorMessage = ''.obs;
  RxString contentData = ''.obs;
  Future<void> fetchData() async {
    apiState(ApiState.loading);

    Either<Failure, String> response = await useCase.call(NoParams());
    response.fold((failure) {
      apiState(ApiState.error);
      return errorMessage.value = failure.message!;
    }, (content) {
      apiState(ApiState.success);

      return contentData.value = content;
    });
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}

