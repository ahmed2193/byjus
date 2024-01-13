import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/Physics/subScreen/electrictCharges/electrict_charges_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPractice3Screen extends StatelessWidget {
  final answerList = [
    "A.  Roadways",
    "B.  Airways",
    "C.  Waterways",
    "D.  Railways",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.white,
        body:Stack(
          children: [
            Container(
              height: 250,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConst.bgImage), fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: ColorConst.textColor22,
                            )),
                        MaterialButton(
                          onPressed: () {
                              Get.bottomSheet(
                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                       Image.asset(ImageConst.endBottomsheetImage,height: 170,width: 170,),
                                      TextWidget.openSansBoldText(
                                        color: ColorConst.textColor22,
                                        text: "End practice session?",
                                        fontSize: 20.0
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextWidget.openSansRegularText(
                                          color: ColorConst.grey64,
                                          text: "Jone Doe, you are just 2 questions away from unlocking a new level. are you sure you want to quit?",
                                          fontSize: 15.0,
                                        textAlign: TextAlign.center
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        minWidth: 170,
                                        height: 47,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(28)),
                                        color: ColorConst.appColor,
                                        child: TextWidget.openSansBoldText(
                                            text: "Resume",
                                            color: ColorConst.white,
                                            fontSize: 16.0),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                     InkWell(
                                       onTap: (){
                                         Get.off(ElectricChargesScreen());
                                       },
                                       child:  TextWidget.openSansBoldText(
                                           text: "Quit",
                                           color: ColorConst.textColor22,
                                           fontSize: 16.0),
                                     )

                                    ],
                                  ),
                                ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40))),
                                  backgroundColor: ColorConst.white
                              );
                          },
                          height: 32,
                          color: ColorConst.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: BorderSide(color: ColorConst.appColor, width: 1)),
                          child: TextWidget.openSansBoldText(
                              color: ColorConst.appColor, fontSize: 13.0, text: "End"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    TextWidget.openSansMediumText(
                        text: "Warmup",
                        color: ColorConst.textColor22,
                        fontSize: 16.0
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(ImageConst.startPracticeImage3,height: 22,)
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
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.bookmark_border,
                            color: ColorConst.grey2C,
                          ),
                        ),
                        SizedBox(
                          height: 19,
                        ),
                        TextWidget.openSansSemiBoldText(
                            color: ColorConst.textColor22,
                            text:
                            "Which of following is the fastest means of transportation?",
                            fontSize: 18.0),
                        SizedBox(
                          height: 26,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: answerList.length,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: ColorConst.white,
                                      borderRadius: BorderRadius.circular(40),
                                      border:  Border.all(
                                          color: index==2?ColorConst.green00C:ColorConst.greyE4)),
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 18),
                                  child: TextWidget.openSansMediumText(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      text: answerList[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: MaterialButton(
                            onPressed: () {
                              // Get.to(ViewSolutionScreen());
                            },
                            minWidth: 170,
                            height: 47,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(28)),
                            color: ColorConst.appColor,
                            child: TextWidget.openSansBoldText(
                                text: "Next",
                                color: ColorConst.white,
                                fontSize: 16.0),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),

                ),
              ),
            )
          ],
        )


    );
  }
}
