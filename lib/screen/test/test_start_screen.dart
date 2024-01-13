import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/test/take_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TestStartScreen extends StatelessWidget {
  commonRow({icon, text})=>Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Row(
      children: [
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: ColorConst.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 12
                  )
                ],
                shape: BoxShape.circle
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(icon,fit: BoxFit.fill,height: 18,width: 18,)),
        SizedBox(
          width: 7,
        ),
        Expanded(child: TextWidget.openSansRegularText(
            text: text,
            color: ColorConst.grey64,
            fontSize: 12.0
        )),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Stack(
        children: [
          Container(
            height: 250,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConst.bgImage), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: ColorConst.textColor22,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  TextWidget.openSansMediumText(
                      text: "Electric Charges, Fields and Gaus...",
                      fontSize: 14.0,
                      color: ColorConst.textColor22),
                  TextWidget.openSansBoldText(
                      text: "Objective Test 01",
                      fontSize: 24.0,
                      color: ColorConst.textColor22),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 192.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)),
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                    color: ColorConst.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorConst.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.10),
                                        blurRadius: 12
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                              child: Row(
                                children: [
                                  SvgPicture.asset(ImageConst.clockIcon),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget.openSansBoldText(
                                          fontSize: 16.0,
                                          color: ColorConst.textColor22,
                                          text: "15"
                                      ),
                                      TextWidget.openSansRegularText(
                                          fontSize: 10.0,
                                          color: ColorConst.grey8A,
                                          text: "Questions"
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorConst.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.10),
                                        blurRadius: 12
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                              child: Row(
                                children: [
                                  SvgPicture.asset(ImageConst.clockIcon),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget.openSansBoldText(
                                          fontSize: 16.0,
                                          color: ColorConst.textColor22,
                                          text: "30"
                                      ),
                                      TextWidget.openSansRegularText(
                                          fontSize: 10.0,
                                          color: ColorConst.grey8A,
                                          text: "Minutes"
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextWidget.robotoMediumText(
                          text: "Instructions",
                          color: ColorConst.textColor22,
                          fontSize: 20.0
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      commonRow(icon: ImageConst.starRounded,text: "I mark are awarded for correct attempts and 0 marks for incorrect attempts"),
                      commonRow(icon: ImageConst.checkRounded,text: "Tap to select the correct answer."),
                      commonRow(icon: ImageConst.reviewRounded,text: "Tap to review icon to mark for review and attempt later."),
                      Spacer(),
                      Center(
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(TakeTestScreen());
                          },
                          minWidth: 170,
                          height: 47,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                          color: ColorConst.appColor,
                          child: TextWidget.openSansBoldText(
                              text: "Take Test",
                              color: ColorConst.white,
                              fontSize: 18.0),
                        ),
                      ),
                      SizedBox(
                        height: 78,
                      )
                    ],
                  ),
                )
              ),
            ),
          )
        ],
      )
    /*  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.openSansMediumText(
                text: "Electric Charges, Fields and Gaus...",
                fontSize: 14.0,
                color: ColorConst.textColor22
            ),
            TextWidget.openSansBoldText(
                text: "Objective Test 01",
                fontSize: 24.0,
                color: ColorConst.textColor22
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConst.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 12
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset(ImageConst.clockIcon),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget.openSansBoldText(
                                fontSize: 16.0,
                                color: ColorConst.textColor22,
                                text: "15"
                            ),
                            TextWidget.openSansRegularText(
                                fontSize: 10.0,
                                color: ColorConst.grey8A,
                                text: "Questions"
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConst.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 12
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset(ImageConst.clockIcon),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget.openSansBoldText(
                                fontSize: 16.0,
                                color: ColorConst.textColor22,
                                text: "30"
                            ),
                            TextWidget.openSansRegularText(
                                fontSize: 10.0,
                                color: ColorConst.grey8A,
                                text: "Minutes"
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            TextWidget.robotoMediumText(
                text: "Instructions",
                color: ColorConst.textColor22,
                fontSize: 20.0
            ),
            SizedBox(
              height: 20,
            ),
            commonRow(icon: ImageConst.starRounded,text: "I mark are awarded for correct attempts and 0 marks for incorrect attempts"),
            commonRow(icon: ImageConst.checkRounded,text: "Tap to select the correct answer."),
            commonRow(icon: ImageConst.reviewRounded,text: "Tap to review icon to mark for review and attempt later."),
            Spacer(),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Get.to(TakeTestScreen());
                },
                minWidth: 170,
                height: 47,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28)),
                color: ColorConst.appColor,
                child: TextWidget.openSansBoldText(
                    text: "Take Test",
                    color: ColorConst.white,
                    fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 78,
            )
          ],
        ),
      )*/



    );
  }
}
