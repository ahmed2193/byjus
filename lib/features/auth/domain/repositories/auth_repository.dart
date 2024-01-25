
import 'package:byjus/features/auth/domain/usecases/otp_verify.dart';
import 'package:byjus/features/auth/domain/usecases/register.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/api/base_response.dart';
import '../../../../core/error/failures.dart';
import '../usecases/login.dart';

abstract class AuthRepository {
  Future<Either<Failure, BaseResponse>> login({
    required LoginParams loginData,
  }); 
  Future<Either<Failure, BaseResponse>> otpVerify({
    required OtpVerifyParams params,
  });
  Future<Either<Failure, BaseResponse>> register({
    required RegisterParams params,
  });
 
  Future<Either<Failure, BaseResponse>> getBoardList(
  );
  Future<Either<Failure, BaseResponse>> getClassList(
  );

   Future<Either<Failure, bool>> logout({required int id});

}
