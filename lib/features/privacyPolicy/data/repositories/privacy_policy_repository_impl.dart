import 'package:dartz/dartz.dart';
import '../../domain/repositories/privacy_policy_repository.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/privacy_policy_remote_data_source.dart';

class PrivacyPolicyRepositoryImpl implements PrivacyPolicyRepository {
  final PrivacyPolicyRemoteDataSource privacyPolicyRemoteDataSource;

  PrivacyPolicyRepositoryImpl({
    required this.privacyPolicyRemoteDataSource,
  });
  @override
  Future<Either<Failure, String>> getPrivacyPolicy() async {
    try {
      final response =
          await privacyPolicyRemoteDataSource.getPrivacyPolicy();
      return Right(response);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
