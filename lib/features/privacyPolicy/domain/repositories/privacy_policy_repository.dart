import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class PrivacyPolicyRepository {
  Future<Either<Failure, String>> getPrivacyPolicy();
}
