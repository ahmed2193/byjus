import 'package:byjus/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:byjus/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:byjus/features/auth/domain/repositories/auth_repository.dart';
import 'package:byjus/features/auth/domain/usecases/get_board_list.dart';
import 'package:byjus/features/auth/domain/usecases/login.dart';
import 'package:byjus/features/auth/domain/usecases/otp_verify.dart';
import 'package:byjus/features/auth/domain/usecases/register.dart';
import 'package:byjus/features/auth/presentation/controllers/get_board_list_controller.dart';
import 'package:byjus/features/auth/presentation/controllers/login_controller.dart';
import 'package:byjus/features/auth/presentation/controllers/otp_verify_controller.dart';
import 'package:byjus/features/auth/presentation/controllers/register_controller.dart';
import 'package:byjus/injection_container.dart';

import 'domain/usecases/get_class_list.dart';
import 'presentation/controllers/get_class_list_controller.dart';

void initAuthFeature() {
// controllers
  sl.registerFactory<LoginController>(
    () => LoginController(
      loginUseCase: sl(),
    ),
  );
  sl.registerFactory<OtpVerifyController>(
    () => OtpVerifyController(
      otpVerifyUseCase: sl(),
    ),
  );
  sl.registerFactory<BoardListController>(
    () => BoardListController(
      useCase: sl(),
    ),
  );
  sl.registerFactory<ClassListController>(
    () => ClassListController(
      useCase: sl(),
    ),
  );
  sl.registerFactory<RegisterController>(
    () => RegisterController(
      registerUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<Login>(() => Login(authRepository: sl()));
  sl.registerLazySingleton<OtpVerify>(() => OtpVerify(authRepository: sl()));
  sl.registerLazySingleton<GetBoardList>(() => GetBoardList(authRepository: sl()));
  sl.registerLazySingleton<GetClassList>(() => GetClassList(authRepository: sl()));
  sl.registerLazySingleton<Register>(() => Register(authRepository: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiConsumer: sl()),
  );
}
