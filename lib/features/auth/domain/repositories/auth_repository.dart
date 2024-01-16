
import 'package:byjus/features/auth/domain/usecases/login.dart';
import 'package:byjus/features/auth/domain/usecases/otp_verify.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/api/base_response.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, BaseResponse>> login({
    required LoginParams loginData,
  });
  Future<Either<Failure, BaseResponse>> otpVerify({
    required OtpVerifyParams params,
  });

 
}
