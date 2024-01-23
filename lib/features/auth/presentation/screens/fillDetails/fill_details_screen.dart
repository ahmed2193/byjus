import 'dart:developer';

import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/features/auth/presentation/controllers/register_controller.dart';
import 'package:byjus/screen/auth/fillDetails/location_screen.dart';
import 'package:byjus/features/auth/presentation/screens/fillDetails/registration_screen.dart';
import 'package:byjus/screen/auth/fillDetails/select_grade_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:byjus/injection_container.dart' as di;

class FillDetailsScreen extends StatefulWidget {
  const FillDetailsScreen({super.key});

  @override
  State<FillDetailsScreen> createState() => _FillDetailsScreenState();
}

class _FillDetailsScreenState extends State<FillDetailsScreen> {
  int selectedIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  final List screenList = [
    RegistrationScreen(),
    SelectGradeScreen(),
    LocationScreen(),
  ];

  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < screenList.length; i++)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                              color: i == selectedIndex
                                  ? ColorConst.appColor
                                  : ColorConst.greyC5,
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: PageView.builder(
                controller: pageController,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: screenList.length,
                onPageChanged: (i) {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                itemBuilder: (context, index) => screenList[index]),
          ),
          selectedIndex == 2
              ? Container()
              : MaterialButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate() &&
                        controller.selectedGender.isNotEmpty) {
                      log('gggg');
                      pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    }
                    log(controller.className.value);
                    log(controller.boardName.value);
                    if (controller.className.isNotEmpty &&
                        controller.boardName.isNotEmpty) {
                      log(controller.className.value);
                      log(controller.boardName.value);
                      pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    }
                  },
                  height: 47,
                  minWidth: 170,
                  child: TextWidget.openSansBoldText(
                      text: "Continue",
                      color: ColorConst.white,
                      fontSize: 18.0),
                  color: ColorConst.appColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)),
                ),
          selectedIndex != 2
              ? SizedBox(
                  height: 150,
                )
              : Container()
        ],
      ),
    );
  }
}
