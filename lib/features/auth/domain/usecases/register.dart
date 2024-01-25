import 'dart:io';

import 'package:byjus/core/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/api/base_response.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class Register implements UseCase<BaseResponse, RegisterParams> {
  final AuthRepository authRepository;
  Register({required this.authRepository});

  @override
  Future<Either<Failure, BaseResponse>> call(RegisterParams params) async =>
      // ignore: unnecessary_await_in_return
      await authRepository.register(params: params);
}

class RegisterParams extends Equatable {
  final String username;
  final String countryCode;
  final String phone;
  final String latitude;
  final String longitude;
  final String deviceType;
  final String deviceToken;
  final String board;
  final String classValue;
  final String schoolName;
  final String gender;
  final String address;
  final String userId;
   File? profileImage;
  final String zipcode;

   RegisterParams({
    required this.username,
    required this.countryCode,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.deviceType,
    required this.deviceToken,
    required this.board,
    required this.classValue,
    required this.schoolName,
    required this.gender,
    required this.address,
    required this.userId,
    required this.zipcode,
     this.profileImage,
  });

  @override
  List<Object?> get props => [
        username,
        countryCode,
        phone,
        latitude,
        longitude,
        deviceType,
        deviceToken,
        board,
        classValue,
        schoolName,
        gender,
        address,
        userId,
        zipcode,
profileImage,
      ];
}
