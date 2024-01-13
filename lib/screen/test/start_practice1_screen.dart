import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/test_controller.dart';
import 'package:byjus/screen/test/start_practice2_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPractice1Screen extends StatelessWidget {
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
                  Image.asset(ImageConst.startPracticeImage1,height: 22,)
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
                child:  GetBuilder<TestController>(
                  init: TestController(),
                  builder: (controller) =>Padding(
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
                              padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  onTap: () {
                                     controller.onAnswerChange(index);
                                  },
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: controller.selectAnswer == index?ColorConst.appColor:ColorConst.white,
                                        borderRadius: BorderRadius.circular(40),
                                        border:  Border.all(
                                            color: ColorConst.greyE4)),
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 18),
                                    child: TextWidget.openSansMediumText(
                                        color:  controller.selectAnswer == index?ColorConst.white:Colors.black,
                                        fontSize: 18.0,
                                        text: answerList[index]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        controller.selectAnswer==null?Container():Center(
                          child: MaterialButton(
                            onPressed: () {
                              Get.to(StartPractice2Screen());
                            },
                            minWidth: 170,
                            height: 47,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(28)),
                            color: ColorConst.appColor,
                            child: TextWidget.openSansBoldText(
                                text: "Submit",
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
            ),
          )
        ],
      )


    );
  }
}
