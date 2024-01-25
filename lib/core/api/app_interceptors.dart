
import 'package:byjus/core/preferences/preferences_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../utils/app_strings.dart';
import 'package:byjus/injection_container.dart' as di;

class AppIntercepters extends Interceptor {
  // final LangLocalDataSource langLocalDataSource;

  // AppIntercepters({required this.langLocalDataSource});
  AppIntercepters();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var token = await di.sl<PreferencesManager>().getAccessToken();
    options.headers[AppStrings.contentType] = AppStrings.applicationJson;
    options.headers[AppStrings.xRequested] = AppStrings.xmlHttpRequest;
    options.headers[AppStrings.cookie] = AppStrings.cookieCode;
    options.headers[AppStrings.apiKey] = AppStrings.apiKeyCode;
    token != null || token != ""
        ? options.headers[AppStrings.token] = token
        : null;


    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }
}
