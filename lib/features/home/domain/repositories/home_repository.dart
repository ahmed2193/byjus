import 'package:byjus/core/api/base_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, BaseResponse>> getSubject();
}
