import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/features/help_center/presentation/controllers/contact_us_controller.dart';
import 'package:byjus/features/help_center/presentation/screens/delete_account_screen.dart';
import 'package:byjus/utils/loading_indicator.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/default_text_form_field/validation_mixin.dart';
import 'package:byjus/injection_container.dart' as di;

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen>
    with ValidationMixin {
  final ContactUsController controller = Get.put(di.sl<ContactUsController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
        centerTitle: true,
        title: TextWidget.openSansBoldText(
            text: "Contact", color: ColorConst.textColor22, fontSize: 18.0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Obx(() {
          return Form(
            key: controller.formKey,
            child:
            
             SingleChildScrollView(
           
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CommonDetailScreenTextField(
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      textEditingController: controller.emailController,
                      validationFunction: validateEmail,
                      hintText: "Email Address",
                      prefixIcon: ImageConst.mailIcon,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CommonDetailScreenTextField(
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                      textEditingController: controller.msgController,
                      validationFunction: validateFeedback,
                      hintText: "Enter Feedback here",
                      prefixIcon: ImageConst.feedback,
                    ),
                    Spacer(),
                    controller.isLoading.value
                        ? LoadingIndicator()
                        : MaterialButton(
                            onPressed: () {
                              if(controller.formKey.currentState!.validate()) {
                                controller.contactUs(context: context);
                              }
                            },
                            minWidth: 170,
                            height: 47,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28)),
                            color: ColorConst.appColor,
                            child: TextWidget.openSansBoldText(
                                text: "Send",
                                color: ColorConst.white,
                                fontSize: 18.0),
                          ),
                    SizedBox(
                      height: 21,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(DeleteAccountScreen());
                      },
                      child: TextWidget.openSansMediumText(
                          text: "Delete your account",
                          color: ColorConst.grey64,
                          fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
       
       
          );
        }),
      ),
    );
  }
}
