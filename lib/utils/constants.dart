import 'dart:convert';

import 'package:byjus/core/error/failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_strings.dart';

// ignore: avoid_classes_with_only_static_members
class Constants {
  static const double desktopBreakpoint = 950;
  static const double tabletBreakpoint = 600;
  static const double watchBreakpoint = 300;
  static const double bottomMarginMainScreen = 60;
  static const int fetchLimit = 10;

  static void showError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: Text('oK'),
          )
        ],
      ),
    );
  }

  String mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedError;
    }
  }

  static String? handleErrorMsg(BuildContext context, String message) {
    return message == AppStrings.noInternetConnection
        ? AppStrings.noInternetConnection
        : message == AppStrings.badRequest
            ? AppStrings.badRequest
            : message == AppStrings.unauthorized
                ? AppStrings.unauthorized
                : message == AppStrings.requestedInfoNotFound
                    ? AppStrings.requestedInfoNotFound
                    : message == AppStrings.conflictOccurred
                        ? AppStrings.conflictOccurred
                        : message == AppStrings.internalServerError
                            ? AppStrings.internalServerError
                            : message == AppStrings.errorDuringCommunication
                                ?AppStrings.errorDuringCommunication
                                :AppStrings.somethingWentWrong;
  }

  static void showToast({
    required String message,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? Colors.green,
      textColor: Colors.white,
    );
  }
  // static Future<void> showLogoutDialog(BuildContext context) async {
  //    final LogoutController controller = g.Get.find();

  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) => ConfirmationDialog(
  //       alertMsg: "Do you want to logout ?",
  //       onTapConfirm: () => controller.logout(context: context),
  //     ),
  //   );
  // }
  static dynamic decodeJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  // static String convertDateToDayMonthYear(String date) {
  //   DateTime inputDate = DateFormat("dd-MM-yyyy").parse(date).toLocal();

  //   DateFormat outputFormat = DateFormat("E, MMMM dd");

  //   // Format the date
  //   return outputFormat.format(inputDate);
  // }
}
