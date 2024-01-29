import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/api/base_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase.dart';
import '../repositories/help_center_repository.dart';

class ContactUsUseCase extends UseCase<BaseResponse, ContactUsParams> {
  final HelpCenterRepository helpCenterChapterRepository;

  ContactUsUseCase({required this.helpCenterChapterRepository});

  @override
  Future<Either<Failure, BaseResponse>> call(ContactUsParams params) async {
    return helpCenterChapterRepository.contactUs(params: params);
  }
}

class ContactUsParams extends Equatable {
  final String userType;
  final String userId;
  final String email;
  final String title;
  final String msg;

  ContactUsParams({
    required this.userId,
    required this.userType,
    required this.email,
    required this.title,
    required this.msg,
  });

  @override
  List<Object?> get props => [
        userType,
        userId,
        email,
        title,
        msg,
      ];
}
