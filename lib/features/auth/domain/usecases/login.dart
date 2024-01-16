import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/utils/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class Login implements UseCase<BaseResponse, LoginParams> {
  final AuthRepository authRepository;
  Login({required this.authRepository});

  @override
  Future<Either<Failure, BaseResponse>> call(LoginParams params) async =>
      await authRepository.login(
        loginData: params,
      );
}

class LoginParams extends Equatable {
  final String countryCode;
  final String phone;
  final String dviceType;
  final String signUpType;
  final String deviceToken;

  const LoginParams({
    required this.countryCode,
    required this.phone,
    required this.deviceToken,
    required this.signUpType,
    required this.dviceType,
  });

  @override
  List<Object> get props => [
        countryCode,
        phone,
        dviceType,
        signUpType,
        dviceType,
      ];
}
