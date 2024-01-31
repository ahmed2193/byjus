import 'package:byjus/features/subject/domain/repositories/subject_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/base_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase.dart';

class GetChapterViewUseCase extends UseCase<BaseResponse, int> {
  final SubjectRepository chapterViewRepository;

  GetChapterViewUseCase({required this.chapterViewRepository});

  @override
  Future<Either<Failure, BaseResponse>> call(int id) async {
    return chapterViewRepository.getChapterView(id: id);
  }
}
