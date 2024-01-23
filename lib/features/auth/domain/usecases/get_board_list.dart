import 'package:byjus/core/api/base_response.dart';
import 'package:byjus/features/auth/domain/repositories/auth_repository.dart';
import 'package:byjus/utils/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class GetBoardList implements UseCase<BaseResponse, NoParams> {
  final AuthRepository authRepository;
  GetBoardList({required this.authRepository});

  @override
  Future<Either<Failure, BaseResponse>> call( NoParams noParams) async =>
      await authRepository.getBoardList(
      );
}


