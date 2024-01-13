import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/Physics/subScreen/electrictCharges/charge_behaviour_screen.dart';
import 'package:byjus/screen/Physics/subScreen/question/delete_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Question3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConst.splashBgImage),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: (){
                            Get.off(ChargeBehaviourScreen());
                          },
                          child: Icon(
                            Icons.clear,
                            color: ColorConst.whiteF0,
                          ),
                        ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextWidget.openSansSemiBoldText(
                        color: ColorConst.white,
                        fontSize: 17.0,
                        text:
                            '''Ring ‘B’ hovers on a positively charged ring ‘A’ as shown in the figure. The charge on ring B is''',
                        textAlign: TextAlign.center),
                    TextWidget.openSansBoldText(
                        text: "Positive",
                        fontSize: 20.0,
                        color: ColorConst.green00C),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: 179,
                      color: ColorConst.white,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      ImageConst.questionMobile,
                      height: 158,
                      width: 70,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 47,
                        width: 158,
                        decoration: BoxDecoration(
                            color: ColorConst.whiteFF.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(28)),
                        alignment: Alignment.center,
                        child: TextWidget.openSansBoldText(
                            text: "Neutral",
                            color: ColorConst.white,
                            fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 47,
                            decoration: BoxDecoration(
                                color: ColorConst.whiteFF.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(28)),
                            alignment: Alignment.center,
                            child: TextWidget.openSansBoldText(
                                text: "Positive",
                                color: ColorConst.white,
                                fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            height: 47,
                            decoration: BoxDecoration(
                                color: ColorConst.whiteFF.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(28)),
                            alignment: Alignment.center,
                            child: TextWidget.openSansBoldText(
                                text: "Negative",
                                color: ColorConst.white,
                                fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Container(
                    height: 1,
                    width: Get.width,
                    color: ColorConst.white,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: TextWidget.openSansBoldText(
                        text: "Correct Answer : Positive",
                        color: ColorConst.white,
                        fontSize: 18.0),
                  ),
                  Container(
                    height: 1,
                    width: Get.width,
                    color: ColorConst.white,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextWidget.openSansBoldText(
                      text: "Solution",
                      color: ColorConst.white,
                      fontSize: 20.0),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextWidget.openSansSemiBoldText(
                        color: ColorConst.white,
                        fontSize: 17.0,
                        textAlign: TextAlign.center,
                        text:
                            "Ring ‘A’ is repelling ring ‘B’, As positive charge repells positive charge, ring ‘B’ can be identified to have positive charge."),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(DeleteAccountQuestionScreen());
                    },
                    child: Container(
                      height: 47,
                      width: 158,
                      decoration: BoxDecoration(
                          color: ColorConst.white,
                          borderRadius: BorderRadius.circular(28)),
                      alignment: Alignment.center,
                      child: TextWidget.openSansBoldText(
                          text: "Next",
                          color: ColorConst.appColor,
                          fontSize: 18.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
