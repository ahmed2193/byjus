import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase.dart';
import '../repositories/auth_repository.dart';

class Logout implements UseCase<bool, int> {
  final AuthRepository authRepository;
  Logout({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(int id ) async =>
      await authRepository.logout(id: id);
}
