import '../../injection_container.dart';
import 'data/datasources/privacy_policy_remote_data_source.dart';
import 'data/repositories/privacy_policy_repository_impl.dart';
import 'domain/repositories/privacy_policy_repository.dart';
import 'domain/usecases/get_privacy_policy.dart';
import 'presentation/controllers/privacy_policy_controller.dart';

void initPrivacyPolicyFeature() {
// controllers
  sl.registerFactory<PrivacyPolicyController>(
    () => PrivacyPolicyController(
      useCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetPrivacyPolicy>(
      () => GetPrivacyPolicy(privacyPolicyRepository: sl()));

  // Repository
  sl.registerLazySingleton<PrivacyPolicyRepository>(
      () => PrivacyPolicyRepositoryImpl(privacyPolicyRemoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<PrivacyPolicyRemoteDataSource>(
      () => PrivacyPolicyRemoteDataSourceImpl(apiConsumer: sl()));
}
