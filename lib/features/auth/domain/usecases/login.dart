import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/utils/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class Login implements UseCase<BaseResponse, LoginParams> {
  final AuthRepository authRepository;
  Login({required this.authRepository});

  @override
  Future<Either<Failure, BaseResponse>> call(LoginParams params) async =>
      await authRepository.login(
        email: params.email,
        password: params.password,
      );
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
