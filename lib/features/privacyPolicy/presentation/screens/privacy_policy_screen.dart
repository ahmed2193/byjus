


import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/utils/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:byjus/injection_container.dart' as di;

import '../../../../core/app_state.dart';
import '../controllers/privacy_policy_controller.dart';


class PrivacyPolicyScreen extends StatelessWidget {

  final PrivacyPolicyController privacyPolicyController =
      Get.put(di.sl<PrivacyPolicyController>());

  Widget _buildBodyContent() {
    // PrivacyPolicyController = Get.put(PrivacyPolicyController)

    return Obx(() {
      switch (privacyPolicyController.apiState.value) {
        case ApiState.loading:
          return LoadingIndicator();
        case ApiState.success:
          return HtmlWidget(
            privacyPolicyController.contentData.value,
            // textStyle: Theme.of(context).textTheme.headlineSmall,
          );
        case ApiState.error:
          return Text(privacyPolicyController.errorMessage.value);
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
                text: "Privacy Policy",
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
