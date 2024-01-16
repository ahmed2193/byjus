import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/Physics/subScreen/electrictCharges/charge_behaviour_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IdeaChargeScreen extends StatelessWidget {
  const IdeaChargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
      ),
      body: InkWell(
        onTap: () {
          Get.defaultDialog(
              title: "",
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget.openSansSemiBoldText(
                        text: "Charge Behaviour",
                        color: ColorConst.textColor22,
                        fontSize: 20.0),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                              color: ColorConst.whiteED,
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            ImageConst.playButton,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                              color: ColorConst.whiteED,
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            ImageConst.questionIcon,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                              color: ColorConst.whiteED,
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            ImageConst.shareAllIcon,
                            height: 20,
                            width: 24,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(ChargeBehaviourScreen());
                        },
                        height: 40,
                        minWidth: Get.width,
                        child: TextWidget.openSansBoldText(
                            text: "Start Test",
                            color: ColorConst.white,
                            fontSize: 18.0),
                        color: ColorConst.appColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28)),
                      ),
                    )
                  ],
                ),
              ));
        },
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            TextWidget.openSansBoldText(
                color: ColorConst.appColor,
                text: "Idea of Charge",
                fontSize: 25.0),
            Image.asset(
              ImageConst.ideaChargeImage,
              height: 298,
              width: 298,
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget.openSansSemiBoldText(
                color: ColorConst.textColor22,
                text: "Hi John!",
                fontSize: 20.0),
            SizedBox(
              height: 11,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextWidget.openSansRegularText(
                  color: ColorConst.grey64,
                  text:
                      "Analysing your learning profile to find the best parth for you.",
                  fontSize: 16.0,
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
