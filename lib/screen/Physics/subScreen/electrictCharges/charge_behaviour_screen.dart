import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/Physics/subScreen/electrictCharges/great_job_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChargeBehaviourScreen extends StatelessWidget {
  const ChargeBehaviourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConst.vedioScreenBgImage),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 120, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: ColorConst.white,
                          )),
                      Icon(
                        Icons.settings_outlined,
                        color: ColorConst.white,
                      )
                    ],
                  ),
                  SvgPicture.asset(ImageConst.pauseIcon),
                  Image.asset(ImageConst.videoDescImage),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 289.0),
            child: Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                  color: ColorConst.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget.openSansMediumText(
                            text: "Idea of charge - Charge\nBehaviour",
                            fontSize: 20.0,
                            color: ColorConst.textColor22
                        ),
                        Icon(Icons.bookmark_outline_sharp,color: ColorConst.textColor22,)
                      ],
                    ),
                    Spacer(),
                    Center(
                      child: MaterialButton(
                        onPressed: () {

                          Get.bottomSheet(
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 45),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextWidget.openSansMediumText(
                                    text: "We  recommend watching the complete video as it will help you solve the question and know where you went wrong",
                                    color: ColorConst.grey64,
                                    fontSize: 14.0,
                                    textAlign: TextAlign.center
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    height: 47,
                                    minWidth: 170,
                                    child: TextWidget.openSansBoldText(
                                        text: "Resume",
                                        color: ColorConst.white,
                                        fontSize: 18.0),
                                    color: ColorConst.appColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28)),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                 InkWell(
                                   onTap: (){
                                      Get.to(GreatJobScreen());
                                   },
                                   child:  TextWidget.openSansBoldText(
                                       text: "Skip",
                                       color: ColorConst.textColor22,
                                       fontSize: 16.0
                                   ),
                                 )
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              )
                            ),
                            backgroundColor: ColorConst.whiteF0
                          );
                          // Get.to(ChargeBehaviourScreen());
                        },
                        height: 47,
                        minWidth: 195,
                        child: TextWidget.openSansBoldText(
                            text: "Next",
                            color: ColorConst.white,
                            fontSize: 18.0),
                        color: ColorConst.appColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
