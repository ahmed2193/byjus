
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

  // @override
  // Future<Either<Failure, bool>> saveLoginCredentials({
  //   required UserModel user,
  // }) async {
  //   try {
  //     final response =
  //         await authLocalDataSource.saveLoginCredentials(userModel: user);
  //     return Right(response);
  //   } on CacheException {
  //     return const Left(CacheFailure(message: AppStrings.cacheFailure));
  //   }
  // }

  // @override
  // Future<Either<Failure, UserModel?>> getSavedLoginCredentials() async {
  //   try {
  //     final response = await authLocalDataSource.getSavedLoginCredentials();
  //     return Right(response);
  //   } on CacheException {
  //     return const Left(CacheFailure(message: AppStrings.cacheFailure));
  //   }
  // }

  @override
  Future<Either<Failure, BaseResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(response);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    }
  }

  // @override
  // Future<Either<Failure, BaseResponse>> register({
  //   required String userName,
  //   required String email,
  //   required String password,
  //   required int userType,
  // }) async {
  //   try {
  //     final response = await authRemoteDataSource.register(
  //       userName: userName,
  //       email: email,
  //       password: password,
  //       userType: userType,
  //     );
  //     return Right(response);
  //   } on ServerException catch (exception) {
  //     return Left(
  //       ServerFailure(
  //         message: exception.message,
  //       ),
  //     );
  //   }
  // }

  // @override
  // Future<Either<Failure, bool>> logout() async {
  //   try {
  //     final response = await authLocalDataSource.logout();
  //     return Right(response);
  //   } on ServerException catch (exception) {
  //     return Left(ServerFailure(message: exception.message!));
  //   }
  // }

  // @override
  // Future<Either<Failure, BaseResponse>> userInfo(
  //     {required UserInfoParams userInfoData}) async {
  //   try {
  //     final response = await authRemoteDataSource.userInfo(
  //    userInfoData: userInfoData
  //     );
  //     return Right(response);
  //   } on ServerException catch (exception) {
  //     return Left(
  //       ServerFailure(
  //         message: exception.message,
  //       ),
  //     );
  //   }
  // }
}
