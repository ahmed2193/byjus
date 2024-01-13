
import 'package:dartz/dartz.dart';


import '../../../../core/api/base_response.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, BaseResponse>> login({
    required String email,
    required String password,
  });

  // Future<Either<Failure, BaseResponse>> register({
  //   required String userName,
  //   required String email,
  //   required String password,
  //   required int userType,
  // });
  // Future<Either<Failure, BaseResponse>> userInfo({
  //   required UserInfoParams userInfoData,
   
  // });


  // Future<Either<Failure, bool>> saveLoginCredentials({required UserModel user});
  // Future<Either<Failure, UserModel?>> getSavedLoginCredentials();
  // Future<Either<Failure, bool>> logout();
  // Future<Either<Failure, BaseResponse>> deleteAccount({

  //   required String accessToken,
  // });
  // Future<Either<Failure, BaseResponse>> resetPassword({
  //   required String oldPassword,
  //   required String newPassword,
  //   required String accessToken,
  // });
  // Future<Either<Failure, BaseResponse>> forgetPassword({required String email});
}
