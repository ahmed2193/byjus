import '../../injection_container.dart';
import 'data/datasources/help_center_remote_datasource.dart';
import 'data/repositories/help_center_repository.dart';
import 'domain/repositories/help_center_repository.dart';
import 'domain/usecases/contact_us_usecase.dart';
import 'presentation/controllers/contact_us_controller.dart';

void initHelpCenterFeature() {
// Blocs

  sl.registerFactory<ContactUsController>(
    () => ContactUsController(
      contactUsUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<ContactUsUseCase>(
    () => ContactUsUseCase(helpCenterChapterRepository: sl()),
  );

  // Repository
  sl.registerLazySingleton<HelpCenterRepository>(
      () => HelpCenterRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<BaseHelpCenterDataSource>(
      () => HelpCenterDataSourceImpl(apiConsumer: sl()));
}
