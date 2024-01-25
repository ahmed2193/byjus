import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/features/subject/data/datasources/subject_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/subject_repository.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  BaseSubjectRemoteDataSource SubjectRemoteDataSource;

  SubjectRepositoryImpl(
    this.SubjectRemoteDataSource,
  );

  @override
  Future<Either<Failure, BaseResponse>> getSubjectChapter(
      {required int id}) async {
    try {
      final response =
          await SubjectRemoteDataSource.getSubjectChapterData(id: id);
      return Right(response);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> getChapterDetails(
      {required int id}) async {
    try {
      final response = await SubjectRemoteDataSource.getChapterDetails(id: id);
      return Right(response);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
