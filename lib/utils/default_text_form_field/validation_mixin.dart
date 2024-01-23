import 'package:flutter/material.dart';
// import 'package:validators/validators.dart';

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  String? _password;
  // ignore: unused_field
  String? _newPassword;

  String? validateEmail(dynamic email) {
    if (email!.trim().isEmpty) {
      return "PLease enter user name";
    }
    // else if (!isEmail(email)) {
    //   return 'email_not_valid')!;
    // }
    return null;
  }

  String? validateUserName(dynamic userName) {
    if (userName!.trim().isEmpty) {
      return "PLease enter your name";
    }
    return null;
  }

  String? validatePhoneNO(String? phoneNo) {
    if (phoneNo!.trim().isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  String? validateOtp(String? value) {
    if (value!.isEmpty) {
      return 'Input is required';
    }

    if (value.length != 4) {
      return 'Input must be exactly 4 characters long';
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Input must contain only digits';
    }

    return null;
  }

  String? validateName(String? firstName) {
    if (firstName!.trim().isEmpty) {
      return 'name_validation';
    }
    return null;
  }

  String? validateLastName(String? lastName) {
    if (lastName!.trim().isEmpty) {
      return 'last_name_validation';
    }
    return null;
  }
}
