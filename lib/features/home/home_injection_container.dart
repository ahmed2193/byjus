import '../../injection_container.dart';
import 'data/repositories/home_repository.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecases/get_subject_usecase.dart';
import 'presentation/controllers/get_subject_controller.dart';
import 'package:byjus/features/home/data/datasources/home_remote_datasource.dart';

void initHomeFeature() {
// Blocs

  sl.registerFactory<SubjectController>(
    () => SubjectController(
      useCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetSubjectUseCase>(
    () => GetSubjectUseCase(subjectRepository: sl()),
  );

  // Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<BaseHomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiConsumer: sl()));
}
