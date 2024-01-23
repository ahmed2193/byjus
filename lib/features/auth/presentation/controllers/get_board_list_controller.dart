import 'dart:developer';

import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/features/auth/data/models/board_and_class_model.dart';
import 'package:byjus/features/auth/domain/usecases/get_board_list.dart';
import 'package:byjus/features/auth/presentation/controllers/app_state.dart';
import 'package:byjus/utils/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../../core/error/failures.dart';

class BoardListController extends GetxController {
  final GetBoardList useCase;

  BoardListController({required this.useCase});
  var apiState = ApiState.loading.obs;
  RxString errorMessage = ''.obs;
  BoardAndClassModel? boardAndClassData;
  RxBool isSelectedList = false.obs;

  RxList<bool> isSelectedList1 = <bool>[false].obs;
  RxInt selectedIndex = (-1).obs;

  void selectItem(int index) {
    log(selectedIndex.value.toString());
    if (selectedIndex.value == index) {
      // Toggle back to default state
      selectedIndex.value = -1;
    } else {
      selectedIndex.value = index;
    }
  }

  updateUi() {
    isSelectedList.value = !isSelectedList.value;
    log(isSelectedList.value.toString());
  }

  Future<void> fetchData() async {
    apiState(ApiState.loading);

    Either<Failure, BaseResponse> response = await useCase.call(NoParams());
    response.fold((failure) {
      apiState(ApiState.error);
      return errorMessage.value = failure.message!;
    }, (data) {
      apiState(ApiState.success);
      print(data.data);
      return boardAndClassData = data.data;
    });
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
