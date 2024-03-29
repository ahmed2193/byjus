import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/features/terms_and_conditions/presentation/controllers/terms_and_conditions_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:byjus/injection_container.dart' as di;

import '../../../../core/app_state.dart';


class TermsConditionScreen extends StatelessWidget {

  final TermsAndConditionsController termsAndConditionsController =
      Get.put(di.sl<TermsAndConditionsController>());

  Widget _buildBodyContent() {
    // TermsAndConditionsController = Get.put(TermsAndConditionsController)

    return Obx(() {
      switch (termsAndConditionsController.apiState.value) {
        case ApiState.loading:
          return Center(child: CircularProgressIndicator());
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
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.openSansBoldText(
                text: "Terms & condition",
                color: ColorConst.textColor22,
                fontSize: 24.0),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(child: _buildBodyContent()),
            ),

          ],
        ),
      ),
    );
  }
}
