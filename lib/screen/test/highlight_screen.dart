import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/test/play_video_screen.dart';
import 'package:byjus/screen/test/statistics_screen.dart';
import 'package:byjus/screen/test/view_solution_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HighlightScreen extends StatelessWidget {
  const HighlightScreen({Key? key}) : super(key: key);

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
                        text: "Highlights",
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
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget.openSansMediumText(
                                  text: "Performance : Revise!",
                                  color: ColorConst.textColor22,
                                  fontSize: 18.0),
                              TextWidget.openSansRegularText(
                                  text:
                                      "Revise the topics in KEY FOCUS AREAS and attempt again. We Know you can do a lot better!",
                                  color: ColorConst.grey64,
                                  fontSize: 12.0,
                                  textAlign: TextAlign.start),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(
                            color: ColorConst.greyE4,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: ColorConst.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.10),
                                      blurRadius: 16)
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: TextWidget.openSansMediumText(
                                        color: ColorConst.textColor22,
                                        fontSize: 16.0,
                                        text: "Score and Solutions"),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          ImageConst.progressImage,
                                          height: 13,
                                        ),
                                        TextWidget.openSansSemiBoldText(
                                            color: ColorConst.textColor22,
                                            fontSize: 14.0,
                                            text: "4/15"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    color: ColorConst.greyE4,
                                    height: 1,
                                    width: Get.width,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: ColorConst.green00C,
                                          ),
                                          TextWidget.openSansRegularText(
                                              text: "04 Correct",
                                              fontSize: 12.0,
                                              color: ColorConst.grey64)
                                        ],
                                      )),
                                      Container(
                                        height: 36,
                                        width: 1,
                                        color: ColorConst.greyE4,
                                      ),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.clear,
                                            color: ColorConst.redE2,
                                          ),
                                          TextWidget.openSansRegularText(
                                              text: "11 incorrect",
                                              fontSize: 12.0,
                                              color: ColorConst.grey64)
                                        ],
                                      ))
                                    ],
                                  ),
                                  Container(
                                    color: ColorConst.greyE4,
                                    height: 1,
                                    width: Get.width,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              ImageConst.fastForward),
                                          TextWidget.openSansRegularText(
                                              text: "00 Unanswered",
                                              fontSize: 12.0,
                                              color: ColorConst.grey64)
                                        ],
                                      )),
                                      Container(
                                        height: 36,
                                        width: 1,
                                        color: ColorConst.greyE4,
                                      ),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.bookmark_outlined,
                                            color: ColorConst.yellowFF,
                                          ),
                                          TextWidget.openSansRegularText(
                                              text: "00 Bookmark",
                                              fontSize: 12.0,
                                              color: ColorConst.grey64)
                                        ],
                                      ))
                                    ],
                                  ),
                                  Container(
                                    color: ColorConst.greyE4,
                                    height: 1,
                                    width: Get.width,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.to(ViewSolutionScreen());
                                      },
                                      minWidth: 170,
                                      height: 47,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28)),
                                      color: ColorConst.appColor,
                                      child: TextWidget.openSansBoldText(
                                          text: "View Solutions",
                                          color: ColorConst.white,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: ColorConst.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.10),
                                      blurRadius: 16)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget.openSansMediumText(
                                      color: ColorConst.textColor22,
                                      fontSize: 16.0,
                                      text: "Stats"),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  TextWidget.openSansMediumText(
                                      text: "Accuracy",
                                      color: ColorConst.grey64,
                                      fontSize: 14.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        ImageConst.progressImage,
                                        height: 13,
                                      ),
                                      Row(
                                        children: [
                                          TextWidget.openSansMediumText(
                                              color: ColorConst.textColor22,
                                              fontSize: 18.0,
                                              text: "26 "),
                                          TextWidget.openSansMediumText(
                                              color: ColorConst.greyA6,
                                              fontSize: 14.0,
                                              text: "Percent"),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextWidget.openSansMediumText(
                                      text: "Avg speed/ques",
                                      color: ColorConst.grey64,
                                      fontSize: 14.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        ImageConst.progressImage,
                                        height: 13,
                                      ),
                                      Row(
                                        children: [
                                          TextWidget.openSansMediumText(
                                              color: ColorConst.textColor22,
                                              fontSize: 18.0,
                                              text: "16 "),
                                          TextWidget.openSansMediumText(
                                              color: ColorConst.greyA6,
                                              fontSize: 14.0,
                                              text: "Seconds"),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 26,
                                  ),
                                  Center(
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.to(StatisticsScreen());
                                      },
                                      minWidth: 170,
                                      height: 47,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28)),
                                      color: ColorConst.appColor,
                                      child: TextWidget.openSansBoldText(
                                          text: "View Stats",
                                          color: ColorConst.white,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: TextWidget.openSansSemiBoldText(
                              text: "Key Focus Areas",
                              color: ColorConst.textColor22,
                              fontSize: 18.0
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                              (position) => Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0),
                                        child: InkWell(
                                          onTap: (){
                                            Get.to(PlayVideoScreen());
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.play_circle,
                                                color: ColorConst.appColor,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextWidget.openSansMediumText(
                                                      text:
                                                          "Electric Potential Energy, Potential and Dipoles",
                                                      color:
                                                          ColorConst.textColor22,
                                                      fontSize: 13.0),
                                                  TextWidget.openSansRegularText(
                                                      text:
                                                          "Performance : Poor | 0/1 Ques. answered",
                                                      fontSize: 12.0,
                                                      color: ColorConst.grey64)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        color: ColorConst.greyE4,
                                        thickness: 1,
                                      )
                                    ],
                                  )),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: TextWidget.openSansSemiBoldText(
                              text: "Talk to our expert",
                              color: ColorConst.textColor22,
                              fontSize: 18.0
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: TextWidget.openSansRegularText(
                              text: '''Hi John doe,

our expert mentors can create a personalized lesson plan
for you.
would you like for one of them to call you?''',
                              color: ColorConst.grey64,
                              fontSize: 12.0
                          )
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: MaterialButton(
                            onPressed: () {
                              // Get.to(TakeTestScreen());
                            },
                            minWidth: 231,
                            height: 47,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(28)),
                            color: ColorConst.appColor,
                            child: TextWidget.openSansBoldText(
                                text: "Sure, lets do it",
                                color: ColorConst.white,
                                fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
