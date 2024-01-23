import 'package:byjus/features/auth/data/models/board_and_class_model.dart';
import 'package:byjus/features/auth/presentation/controllers/get_class_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:byjus/injection_container.dart' as di;

import 'features/auth/presentation/controllers/app_state.dart';

class YourUI extends StatelessWidget {
  final ClassListController boardListController = Get.put(di.sl<ClassListController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: Center(
        child: Obx(() {
          if (boardListController.apiState.value == ApiState.loading) {
            return CircularProgressIndicator();
          } else if (boardListController.apiState.value == ApiState.success) {
            // Use the boardAndClassData in your UI
            return YourSuccessWidget(boardListController.classListData);
          } else if (boardListController.apiState.value == ApiState.error) {
            return Text('Error: ${boardListController.errorMessage.value}');
          } else {
            return Text('Unknown state');
          }
        }),
      ),
    );
  }
}

class YourSuccessWidget extends StatelessWidget {
  final BoardAndClassModel? data;

  YourSuccessWidget(this.data);

  @override
  Widget build(BuildContext context) {
    // Use the data to build your UI
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Data Received: ${data?.data!.length.toString()! ?? 'null'}'),
        // Add more UI components as needed
      ],
    );
  }
}
