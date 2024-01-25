
import 'package:byjus/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/base_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase.dart';

class GetSubjectUseCase extends UseCase<BaseResponse, NoParams> {
  final HomeRepository subjectRepository;

  GetSubjectUseCase({required this.subjectRepository});

  @override
  Future<Either<Failure, BaseResponse>> call(NoParams params) async {
    return subjectRepository.getSubject();
  }
}
