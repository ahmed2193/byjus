import 'package:byjus/features/subject/domain/usecases/get_subject_chapter_usecase.dart';
import 'package:byjus/features/subject/presentation/controllers/get_subject_chapter_controller.dart';

import '../../injection_container.dart';
import 'data/repositories/subject_repository.dart';
import 'domain/repositories/subject_repository.dart';
import 'domain/usecases/get_chapter_details_usecase.dart';
import 'domain/usecases/get_chapter_view_usecase.dart';
import 'presentation/controllers/get_chapter_details_controller.dart';
import 'package:byjus/features/subject/data/datasources/subject_remote_datasource.dart';

import 'presentation/controllers/get_chapter_view_controller.dart';

void initSubjectFeature() {
// Blocs

  sl.registerFactory<ChapterDetailsController>(
    () => ChapterDetailsController(
      useCase: sl(),
    ),
  );
  sl.registerFactory<SubjectChapterController>(
    () => SubjectChapterController(
      useCase: sl(),
    ),
  );
  sl.registerFactory<ChapterViewController>(
    () => ChapterViewController(
      useCase: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton<GetChapterDetailsUseCase>(
    () => GetChapterDetailsUseCase(chapterDetailsRepository: sl()),
  );
  sl.registerLazySingleton<GetSubjectChapterUseCase>(
    () => GetSubjectChapterUseCase(subjectChapterRepository: sl()),
  );
  sl.registerLazySingleton<GetChapterViewUseCase>(
    () => GetChapterViewUseCase(chapterViewRepository: sl()),
  );
  // Repository
  sl.registerLazySingleton<SubjectRepository>(
      () => SubjectRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<BaseSubjectRemoteDataSource>(
      () => SubjectRemoteDataSourceImpl(apiConsumer: sl()));
}
