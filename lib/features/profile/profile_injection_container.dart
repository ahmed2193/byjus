import 'package:byjus/features/profile/presentation/controllers/edit_profile_controller.dart';
import 'package:byjus/injection_container.dart';

import 'data/datasources/profile_remote_data_source.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/profile_repository.dart';
import 'domain/usecases/edit_profile.dart';

void initProfileFeature() {
// controllers

  sl.registerFactory<EditProfileController>(
    () => EditProfileController(
      editProfileUseCase: sl(),
    ),
  );

  // Use cases

  sl.registerLazySingleton<EditProfile>(
      () => EditProfile(profileRepository: sl()));

  // Repository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      profileRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(apiConsumer: sl()),
  );
}
