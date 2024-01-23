// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:byjus/features/auth/presentation/controllers/register_controller.dart';
import 'package:byjus/utils/default_text_form_field/validation_mixin.dart';
import 'package:flutter/material.dart';

import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with ValidationMixin {
  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextWidget.openSansBoldText(
                    text:
                        "Welcome to the world of\nlearning Let’s start your\nregistration",
                    color: ColorConst.textColor22,
                    fontSize: 18.0,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 35,
                ),
                CommonDetailScreenTextField(
                  textEditingController: controller.useNameController,
                  validationFunction: validateUserName,
                  hintText: "Enter Your Name",
                  prefixIcon: ImageConst.person,
                ),
                SizedBox(
                  height: 20,
                ),
                CommonDetailScreenTextField(
                  textEditingController: controller.emailController,
                  validationFunction: validateEmail,
                  hintText: "Enter your Email ID*",
                  prefixIcon: ImageConst.mailIcon,
                ),
                GenderSelection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderSelection extends StatefulWidget {
  GenderSelection({
    Key? key,
  }) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select your gender:'),
          Obx(() => RadioListTile(
                title: Text('Male'),
                value: 'male',
                groupValue: controller.selectedGender.value,
                onChanged: (value) {
                  controller.setGender(value!);
                },
              )),
          Obx(() => RadioListTile(
                title: Text('Female'),
                value: 'female',
                groupValue: controller.selectedGender.value,
                onChanged: (value) {
                  controller.setGender(value!);
                },
              )),
        ],
      ),
    );
  }
}
