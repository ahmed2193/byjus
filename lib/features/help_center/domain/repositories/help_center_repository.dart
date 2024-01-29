import 'package:byjus/core/api/base_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../usecases/contact_us_usecase.dart';

abstract class HelpCenterRepository {
  Future<Either<Failure, BaseResponse>> contactUs({required ContactUsParams params});
}
