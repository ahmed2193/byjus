import 'package:byjus/features/terms_and_conditions/presentation/controllers/terms_and_conditions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:byjus/injection_container.dart' as di;

class TermsAndConditionsScreen extends StatelessWidget {
   TermsAndConditionsScreen({Key? key}) : super(key: key);

  final TermsAndConditionsController termsAndConditionsController =
      Get.put(di.sl<TermsAndConditionsController>());

  Widget _buildBodyContent() {
    // TermsAndConditionsController = Get.put(TermsAndConditionsController)

    return Obx(() {
      switch (termsAndConditionsController.apiState.value) {
        case ApiState.loading:
          return CircularProgressIndicator();
        case ApiState.success:
          return HtmlWidget(
            termsAndConditionsController.contentData.value,
            // textStyle: Theme.of(context).textTheme.headlineSmall,
          );
        case ApiState.error:
          return Text(termsAndConditionsController.errorMessage.value);
        default:
          return Container(); // Handle other cases if needed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text(
          'klkjkj',
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            // color: AppColors.primaryColor,
          ),
        ));
    return Scaffold(appBar: appBar, body: _buildBodyContent());
  }
}
