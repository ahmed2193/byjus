import 'package:byjus/core/api/base_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class SubjectRepository {
  Future<Either<Failure, BaseResponse>> getChapterDetails({required int id});
  Future<Either<Failure, BaseResponse>> getSubjectChapter({required int id});
}
