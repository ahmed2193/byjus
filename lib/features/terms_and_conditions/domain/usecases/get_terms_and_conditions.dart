import 'package:byjus/features/terms_and_conditions/domain/repositories/terms_and_conditions_repository.dart';
import 'package:byjus/core/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class GetTermsAndConditions implements UseCase<String, NoParams> {
  final TermsAndConditionsRepository termsAndConditionsRepository;
  GetTermsAndConditions({required this.termsAndConditionsRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      await termsAndConditionsRepository.getTermsAndConditions();
}
