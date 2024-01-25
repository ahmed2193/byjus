
import 'package:byjus/features/profile/domain/usecases/edit_profile.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/api/base_response.dart';
import '../../../../core/error/failures.dart';

abstract class ProfileRepository {

  Future<Either<Failure, BaseResponse>> editProfile({
    required EditProfileParams params,
  });
 


}
