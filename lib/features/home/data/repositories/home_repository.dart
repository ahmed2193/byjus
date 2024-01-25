import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/features/home/data/datasources/home_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  BaseHomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(
    this.homeRemoteDataSource,
  );
  @override
  Future<Either<Failure, BaseResponse>> getSubject() async {
    try {
      final response = await homeRemoteDataSource.getSubjectData();
      return Right(response);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }



}
