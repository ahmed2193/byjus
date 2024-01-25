import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/core/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class OtpVerify implements UseCase<BaseResponse, OtpVerifyParams> {
  final AuthRepository authRepository;
  OtpVerify({required this.authRepository});

  @override
  Future<Either<Failure, BaseResponse>> call(OtpVerifyParams params) async =>
      await authRepository.otpVerify(
        params: params,
      );
}

class OtpVerifyParams extends Equatable {
  final String userId;
  final String otpCode;

  const OtpVerifyParams({
    required this.userId,
    required this.otpCode,
  });

  @override
  List<Object> get props => [
        userId,
        otpCode,
      ];
}
