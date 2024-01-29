import 'dart:io';

import 'package:byjus/core/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/api/base_response.dart';
import '../../../../core/error/failures.dart';
import '../repositories/profile_repository.dart';

class EditProfile implements UseCase<BaseResponse, EditProfileParams> {
  final ProfileRepository profileRepository;
  EditProfile({required this.profileRepository});

  @override
  Future<Either<Failure, BaseResponse>> call(EditProfileParams params) async =>
      await profileRepository.editProfile(params: params);
}

class EditProfileParams extends Equatable {
  final String username;
  final String countryCode;
  final String phone;

  final String schoolName;
  final String gender;
  final String address;
  final String userId;
  final String email;
  final File? profileImage;

  EditProfileParams({
    required this.username,
    required this.countryCode,
    required this.phone,
    required this.schoolName,
    required this.gender,
    required this.address,
    required this.userId,
    required this.email,
    this.profileImage,
  });

  @override
  List<Object?> get props => [
        username,
        countryCode,
        phone,
        schoolName,
        gender,
        address,
        userId,
        email,
        profileImage,
      ];
}
