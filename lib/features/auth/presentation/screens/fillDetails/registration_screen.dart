// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:byjus/features/auth/presentation/controllers/register_controller.dart';
import 'package:byjus/utils/default_text_form_field/validation_mixin.dart';
import 'package:flutter/material.dart';

import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:get/get.dart';

import '../../../../../controller/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with ValidationMixin {
  final RegisterController controller = Get.find();
  final ProfileImageController _profileImageController = Get.find();
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
                  height: 12,
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Obx(
                      () => _profileImageController
                              .profileImageUrl.value.isNotEmpty
                          ? ClipOval(
                              child: Image.file(
                                File(_profileImageController
                                    .profileImageUrl.value),
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipOval(
                              child: Image.asset(
                                ImageConst
                                    .drawerProfileImage, // Provide the path to your default image
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  
                  
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InkWell(
                        onTap: () async {
                          await _profileImageController.pickImage();
                        },
                        child: Container(
                          height: 22,
                          width: 22,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorConst.appColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.edit,
                              color: ColorConst.white, size: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                CommonDetailScreenTextField(
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  textEditingController: controller.useNameController,
                  validationFunction: validateUserName,
                  hintText: "Enter Your Name",
                  prefixIcon: ImageConst.person,
                ),
                SizedBox(
                  height: 12,
                ),
                CommonDetailScreenTextField(
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  textEditingController: controller.emailController,
                  validationFunction: validateEmail,
                  hintText: "Enter your Email ID*",
                  prefixIcon: ImageConst.mailIcon,
                ),
                GenderSelection(),
                CommonDetailScreenTextField(
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  textEditingController: controller.schoolNameController,
                  validationFunction: validateSchool,
                  hintText: "Enter your School Name",
                ),
                SizedBox(
                  height: 12,
                ),
                CommonDetailScreenTextField(
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                  textEditingController: controller.zipCodeController,
                  validationFunction: validateZipcode,
                  hintText: "Enter your Zip code ",
                ),
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
    super.key,
  });

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select your gender:'),
          Row(
            children: [
              Expanded(
                child: Obx(() => RadioListTile(
                      title: TextWidget.openSansBoldText(
                        fontSize: 16.0,
                        color: ColorConst.textColor22,
                        text: 'Male',
                      ),
                      value: 'male',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        controller.setGender(value!);
                      },
                    )),
              ),
              Expanded(
                child: Obx(() => RadioListTile(
                      title: TextWidget.openSansBoldText(
                        fontSize: 16.0,
                        color: ColorConst.textColor22,
                        text: 'Female',
                      ),
                      value: 'female',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        controller.setGender(value!);
                      },
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
