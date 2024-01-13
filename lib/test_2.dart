import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class YourWidget extends StatelessWidget {


  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: Obx(() {
          final state = apiController.apiState.value;

          switch (state) {
            case ApiState.loading:
              return CircularProgressIndicator();
            case ApiState.success:
              return Text('Data loaded successfully');
            case ApiState.error:
              return Text('Error loading data');
            default:
              return Container(); // Handle other cases if needed
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger data fetching
          apiController.fetchData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class ApiController extends GetxController {
  var apiState = ApiState.loading.obs;

  Future<void> fetchData() async {
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
        apiState(ApiState.success);
      } else {
        print(response.statusMessage);
        apiState(ApiState.error);
      }
    } catch (e) {
      print('Error: $e');
      apiState(ApiState.error);
    }
  }
}

enum ApiState { loading, success, error }
