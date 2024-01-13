import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/physics_controller.dart';
import 'package:byjus/screen/test/start_practice1_screen.dart';
import 'package:byjus/screen/test/test_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseView extends StatelessWidget {
  final PhysicsController physicsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22,
          ),
          TextWidget.openSansMediumText(
              text: "Practice", color: ColorConst.textColor22, fontSize: 20.0),
          SizedBox(
            height: 8,
          ),
          TextWidget.openSansRegularText(
              text:
                  "Practice your knowledge of the Electric Charges, Fields and Gauss Law",
              color: ColorConst.grey64,
              fontSize: 18.0),
          SizedBox(
            height: 26,
          ),
          Image.asset(ImageConst.exerciseStepperImage),
          SizedBox(
            height: 20,
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                Get.to(StartPractice1Screen());
              },
              minWidth: 170,
              height: 47,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              color: ColorConst.appColor,
              child: TextWidget.openSansBoldText(
                  text: "Start Practice",
                  color: ColorConst.white,
                  fontSize: 18.0),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: ColorConst.greyE4,
            height: 1,
          ),
          SizedBox(
            height: 20,
          ),
          TextWidget.robotoMediumText(
              text: "Test", color: ColorConst.textColor22, fontSize: 20.0),
          SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: InkWell(
              onTap: () {
                physicsController.isClicked.value = !physicsController.isClicked.value;
              },
              child: Row(
                children: [
                  TextWidget.openSansRegularText(
                      text: "OBJECTIVE TESTS",
                      color: ColorConst.textColor22,
                      fontSize: 14.0),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 17,
                    width: 2,
                    color: ColorConst.textColor22,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextWidget.openSansRegularText(
                      text: "2 Tests",
                      color: ColorConst.textColor22,
                      fontSize: 14.0),
                  Spacer(),
                  Obx(
                    ()=> Icon(
                      physicsController.isClicked.value ?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down,
                      color: ColorConst.grey64,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => physicsController.isClicked.value == true
                ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget.openSansRegularText(
                                text: "Objective Test 01",
                                color: ColorConst.grey64,
                                fontSize: 14.0),
                           InkWell(
                             onTap: (){
                               Get.to(TestStartScreen());
                             },
                             child:  TextWidget.openSansRegularText(
                                 text: "Start",
                                 color: ColorConst.appColor,
                                 fontSize: 14.0),
                           )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Divider(
                            color: ColorConst.greyE4,
                            height: 1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget.openSansRegularText(
                                text: "Objective Test 01",
                                color: ColorConst.grey64,
                                fontSize: 14.0),
                            InkWell(
                              onTap: (){
                                Get.to(TestStartScreen());
                              },
                              child:  TextWidget.openSansRegularText(
                                  text: "Start",
                                  color: ColorConst.appColor,
                                  fontSize: 14.0),
                            )
                          ],
                        ),
                      ],
                    ),
                )
                : Container(),
          )
        ],
      ),
    );
  }
}
