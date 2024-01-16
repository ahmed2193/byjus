import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

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
                        text: "Statistics",
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                TextWidget.openSansSemiBoldText(
                                    color: ColorConst.textColor22,
                                    text: "Accuracy",
                                    fontSize: 18.0),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: ColorConst.white,
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.10),
                                            blurRadius: 16)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget.openSansMediumText(
                                                  color: ColorConst.textColor22,
                                                  fontSize: 16.0,
                                                  text: "Score and Solutions"),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    ImageConst.progressImage,
                                                    height: 13,
                                                  ),
                                                  TextWidget.openSansMediumText(
                                                      color: ColorConst
                                                          .textColor22,
                                                      fontSize: 18.0,
                                                      text: "26%")
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Divider(
                                          color: ColorConst.greyE4,
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextWidget.openSansMediumText(
                                                  color: ColorConst.grey64,
                                                  text: "Questions Attempted: ",
                                                  fontSize: 12.0),
                                              TextWidget.openSansSemiBoldText(
                                                  color: ColorConst.grey64,
                                                  text: "15",
                                                  fontSize: 12.0),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: ColorConst.greyE4,
                                          thickness: 1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextWidget.openSansMediumText(
                                                color: ColorConst.grey64,
                                                text: "Questions Correct: ",
                                                fontSize: 12.0),
                                            TextWidget.openSansSemiBoldText(
                                                color: ColorConst.grey64,
                                                text: "4",
                                                fontSize: 12.0),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextWidget.openSansSemiBoldText(
                                    color: ColorConst.textColor22,
                                    text:
                                        "Performance analysis by\nquestion difficulty",
                                    fontSize: 18.0),
                                SizedBox(
                                  height: 26,
                                ),
                                Image.asset(ImageConst.statChartImage1)
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
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget.openSansSemiBoldText(
                                    color: ColorConst.textColor22,
                                    text: "Time Taken For Each Question",
                                    fontSize: 18.0),
                                SizedBox(
                                  height: 20,
                                ),
                                Image.asset(ImageConst.statChartImage2),
                                SizedBox(
                                  height: 12,
                                ),
                                Center(child: TextWidget.openSansRegularText(
                                    text: "Time taken (sec)",
                                    color: ColorConst.grey64,
                                    fontSize: 13.0
                                ),),
                                SizedBox(
                                  height: 12,
                                ),
                                Image.asset(ImageConst.chartStatusImage),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget.openSansRegularText(
                                        text: "(E) Easy",
                                        color: ColorConst.grey64,
                                        fontSize: 13.0
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    TextWidget.openSansRegularText(
                                        text: "(M) Medium",
                                        color: ColorConst.grey64,
                                        fontSize: 13.0
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    TextWidget.openSansRegularText(
                                        text: "(H) Hard",
                                        color: ColorConst.grey64,
                                        fontSize: 13.0
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30                                                                                                                  ,
                                ),
                              ],
                            )
                          ),
                        ],
                      )),
                ),
              ),
            )
          ],
        ));
  }
}
