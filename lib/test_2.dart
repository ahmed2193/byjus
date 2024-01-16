import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  var apiState = ApiState.loading().obs;

  var responseData = ''.obs;

  Future<void> fetchData() async {
    apiState(ApiState.loading());
    try {
      var headers = {
        'API-KEY': 'topperAPP',
        'Cookie': 'PHPSESSID=49c9996e3c600a2764709e2324698165'
      };
      var dio = Dio();
      var response = await dio.request(
        'https://edu-network.in/api/v1/service/termconition_detail',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        responseData.value = json.encode(response.data['data']['description']);
        apiState(ApiState.success(responseData.value));
      } else {
        print(response.statusMessage);
        apiState(ApiState.error('Error: ${response.statusMessage}')
            as ApiState<String>);
      }
    } catch (e) {
      print('Error: $e');
      apiState(ApiState.error('Error: $e') as ApiState<String>);
    }
  }
}

class ApiState<T> {
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final T? data;
  final String? errorMessage;

  ApiState._({
    required this.isLoading,
    required this.isSuccess,
    required this.isError,
    this.data,
    this.errorMessage,
  });

  factory ApiState.loading() => ApiState<T>._(
        isLoading: true,
        isSuccess: false,
        isError: false,
      );

  factory ApiState.success(T data) => ApiState<T>._(
        isLoading: false,
        isSuccess: true,
        isError: false,
        data: data,
      );

  factory ApiState.error(String errorMessage) => ApiState<T>._(
        isLoading: false,
        isSuccess: false,
        isError: true,
        errorMessage: errorMessage,
      );
}

class name extends StatelessWidget {
  name({super.key});
  final ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            Obx(() {
              final state = apiController.apiState.value;
              print(apiController.apiState.value);

              switch (state) {
                case ApiState.loading:
                  return CircularProgressIndicator();
                case ApiState.success:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Data loaded successfully'),
                      Text(apiController.responseData.value),
                    ],
                  );
                case ApiState.error:
                  return Text(
                      'Error: ${apiController.apiState.value.errorMessage}');
                default:
                  return Container();
              }
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          apiController.fetchData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
