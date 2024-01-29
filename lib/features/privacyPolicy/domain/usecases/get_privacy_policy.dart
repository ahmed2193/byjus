import 'package:byjus/core/usecase.dart';
import 'package:byjus/features/privacyPolicy/domain/repositories/privacy_policy_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class GetPrivacyPolicy implements UseCase<String, NoParams> {
  final PrivacyPolicyRepository privacyPolicyRepository;
  GetPrivacyPolicy({required this.privacyPolicyRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      await privacyPolicyRepository.getPrivacyPolicy();
}
