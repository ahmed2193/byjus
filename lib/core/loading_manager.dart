import 'package:flutter/material.dart';

import 'empty_widgets.dart';

mixin LoadingManager {
  void runChangeState();

  // Translator provideTranslate();

  String? message;
  bool isLoading = false;
  bool isLoadingWithMessage = false;

  void showLoading() async {
    if (!isLoading) {
      isLoading = true;
      runChangeState();
    }
  }

  void hideLoading() async {
    if (isLoading) {
      isLoading = false;
      runChangeState();
    }
  }

  void showMessageLoading({String? message}) async {
    this.message = message;
    if (!isLoadingWithMessage) {
      isLoadingWithMessage = true;
      runChangeState();
    }
  }

  void hideMessageLoading() async {
    if (isLoadingWithMessage) {
      isLoadingWithMessage = false;
      runChangeState();
    }
  }

  void hideAnyLoading() {
    hideLoading();
    hideMessageLoading();
  }

  Widget loadingManagerWidget() {
    if (isLoading) {
      return const CircularProgressIndicator();
    } else {
      return getEmptyWidget();
    }
  }
}
