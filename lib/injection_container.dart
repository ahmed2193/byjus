import 'package:byjus/core/api/api_consumer.dart';
import 'package:byjus/core/api/app_interceptors.dart';
import 'package:byjus/core/api/dio_consumer.dart';
import 'package:byjus/features/auth/auth_injection_container.dart';
import 'package:byjus/features/terms_and_conditions/terms_and_conditions_injection_container.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // controllers
  // sl.registerFactory<LocaleCubit>(
  //     () => LocaleCubit(changeLangUseCase: sl(), getSavedLangUseCase: sl()));
  // sl.registerFactory<ThemeCubit>(() => ThemeCubit(
  //       preferenceManager: sl(),
  //     ));


  // Features
  initAuthFeature();
  initTermsAndConditionsFeature();
  //core

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  sl.registerLazySingleton(() => AppIntercepters());

  // sl.registerLazySingleton(() => InternetConnectionChecker());
}
