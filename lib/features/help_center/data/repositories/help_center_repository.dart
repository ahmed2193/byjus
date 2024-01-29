import 'package:byjus/core/api/base_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/help_center_repository.dart';
import '../../domain/usecases/contact_us_usecase.dart';
import '../datasources/help_center_remote_datasource.dart';

class HelpCenterRepositoryImpl implements HelpCenterRepository {
  BaseHelpCenterDataSource helpCenterRemoteDataSource;

  HelpCenterRepositoryImpl(
    this.helpCenterRemoteDataSource,
  );

  @override
  Future<Either<Failure, BaseResponse>> contactUs(
      {required ContactUsParams params}) async {
    try {
      final response =
          await helpCenterRemoteDataSource.contactUs(params: params);
      return Right(response);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
