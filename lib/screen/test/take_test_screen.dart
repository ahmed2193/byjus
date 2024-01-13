import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/test/highlight_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TakeTestScreen extends StatefulWidget {
  TakeTestScreen({Key? key}) : super(key: key);

  @override
  State<TakeTestScreen> createState() => _TakeTestScreenState();
}

class _TakeTestScreenState extends State<TakeTestScreen> {
  final List numberList = [
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
  ];

  final answerList = [
    "A.  Roadways",
    "B.  Airways",
    "C.  Waterways",
    "D.  Railways",
  ];

  var selectedIndex = 0;

  var selectedAnswer = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: ColorConst.white,
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.pause_circle,
              color: ColorConst.grey2C,
            ),
            TextWidget.openSansMediumText(
                text: "09:05", color: ColorConst.grey2C, fontSize: 15.0)
          ],
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: MaterialButton(
                onPressed: () {
                  Get.bottomSheet(
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: TextWidget.openSansBoldText(
                                    text: "Cancel",
                                    color: ColorConst.textColor22,
                                    fontSize: 16.0),
                              )
                            ),
                            Image.asset(
                              ImageConst.submitTest,
                              height: 108,
                              width: 116,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextWidget.openSansBoldText(
                                text: "Submit Test?",
                                color: ColorConst.textColor22,
                                fontSize: 20.0),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20
                              ),
                              child:   TextWidget.openSansRegularText(
                                  text: "Hey Jone Doe are you sure you want to end this test?",
                                  color: ColorConst.grey64,
                                  fontSize: 16.0,
                                  textAlign: TextAlign.center
                              ),
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            MaterialButton(
                              onPressed: () {
                                 Get.to(HighlightScreen());
                              },
                              minWidth: 170,
                              height: 47,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              color: ColorConst.appColor,
                              child: TextWidget.openSansBoldText(
                                  text: "Submit",
                                  color: ColorConst.white,
                                  fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                      backgroundColor: ColorConst.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))));
                },
                height: 32,
                color: ColorConst.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(color: ColorConst.appColor, width: 1)),
                child: TextWidget.openSansBoldText(
                    color: ColorConst.appColor, fontSize: 13.0, text: "Submit"),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorConst.appColor, width: 1)),
                  child: Icon(
                    Icons.check,
                    color: ColorConst.appColor,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      itemCount: numberList.length,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            alignment: Alignment.center,
                            child: TextWidget.openSansBoldText(
                                color: selectedIndex == index
                                    ? ColorConst.white
                                    : ColorConst.appColor,
                                fontSize: 13.0,
                                text: numberList[index]),
                            decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? ColorConst.appColor
                                    : ColorConst.white,
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: ColorConst.greyE4,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget.openSansSemiBoldText(
                    text: "2.", fontSize: 28.0, color: Colors.black),
                Icon(
                  Icons.bookmark_border,
                  color: ColorConst.grey2C,
                )
              ],
            ),
          ),
          SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextWidget.openSansBoldText(
                color: ColorConst.textColor22,
                text:
                    "Which of following is the fastest means of transportation?",
                fontSize: 18.0),
          ),
          SizedBox(
            height: 34,
          ),
          ListView.builder(
            itemCount: answerList.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedAnswer = index;
                  });
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: selectedAnswer == index
                          ? ColorConst.appColor
                          : ColorConst.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                          color: selectedAnswer == index
                              ? ColorConst.appColor
                              : ColorConst.greyE4)),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 18),
                  child: TextWidget.openSansMediumText(
                      color: selectedAnswer == index
                          ? ColorConst.white
                          : Colors.black,
                      fontSize: 18.0,
                      text: answerList[index]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
