import 'package:byjus/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:byjus/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:byjus/features/auth/domain/repositories/auth_repository.dart';
import 'package:byjus/features/auth/domain/usecases/login.dart';
import 'package:byjus/features/auth/presentation/controllers/login_controller.dart';
import 'package:byjus/injection_container.dart';

void initAuthFeature() {
// controllers
  sl.registerFactory<LoginController>(
    () => LoginController(
      loginUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<Login>(() => Login(authRepository: sl()));

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