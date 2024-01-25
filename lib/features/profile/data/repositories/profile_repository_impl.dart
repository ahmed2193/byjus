import 'package:dartz/dartz.dart';

import '../../../../core/api/base_response.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';
import 'package:byjus/features/profile/domain/usecases/edit_profile.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({
    required this.profileRemoteDataSource,
  });

  @override
  Future<Either<Failure, BaseResponse>> editProfile(
      {required EditProfileParams params}) async {
    try {
      final response =
          await profileRemoteDataSource.editProfile(params: params);
      return Right(response);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    }
  }
}
