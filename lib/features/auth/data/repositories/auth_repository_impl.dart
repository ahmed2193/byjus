import 'package:byjus/features/auth/domain/usecases/login.dart';
import 'package:byjus/features/auth/domain/usecases/otp_verify.dart';
import 'package:byjus/features/auth/domain/usecases/register.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/base_response.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  // final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    // required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, BaseResponse>> login({
    required LoginParams loginData,
  }) async {
    try {
      final response = await authRemoteDataSource.login(params: loginData);
      return Right(response);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> otpVerify(
      {required OtpVerifyParams params}) async {
    try {
      final response = await authRemoteDataSource.otpVerify(params: params);
      return Right(response);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> getBoardList() async {
    try {
      final response = await authRemoteDataSource.getBoardList();
      return Right(response);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> getClassList() async {
    try {
      final response = await authRemoteDataSource.getClassList();
      return Right(response);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    }
  }
  @override
  Future<Either<Failure, BaseResponse>> register({required RegisterParams params}) async {
    try {
      final response = await authRemoteDataSource.register(params: params);
      return Right(response);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    }
  }

    @override
  Future<Either<Failure, bool>> logout({required int id}) async {
    try {
      final response = await authRemoteDataSource.logout(id: id);
      return Right(response);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message!));
    }
  }

}
