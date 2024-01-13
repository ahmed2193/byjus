import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ViewSolutionScreen extends StatelessWidget {
  final List numberList = [
    "1",
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
  final TestController testController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.white,
        foregroundColor: ColorConst.textColor22,
        centerTitle: true,
        title: Column(
          children: [
            TextWidget.openSansBoldText(
              text: "All questions",
              fontSize: 18.0,
              color: ColorConst.textColor22
            ),
            TextWidget.openSansMediumText(
                text: "Solutions",
                fontSize: 14.0,
                color: ColorConst.textColor22
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: (){
                Get.bottomSheet(
                  filterBottomSheet(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    backgroundColor: ColorConst.white);

              },
                child: SvgPicture.asset(ImageConst.filterIcon)
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              itemCount: numberList.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: numberList[index]=="2"||numberList[index]=="5"?ColorConst.redE2:ColorConst.green00C,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: TextWidget.openSansSemiBoldText(
                  color: ColorConst.white,
                  fontSize: 13.0,
                  text: numberList[index]
                ),
              ),
            ),),
          ),
          Divider(
            color: ColorConst.greyE4,
            thickness: 1,
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

                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: ColorConst.white,
                      borderRadius: BorderRadius.circular(40),
                      border:  Border.all(
                          color:  index==1?ColorConst.redE2:index==3?ColorConst.green00C:ColorConst.greyE4)),
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
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageConst.arrowBackCircle),
              SizedBox(
                width: 17,
              ),
              SvgPicture.asset(ImageConst.arraowForwardCircle),
            ],
          ),
          SizedBox(
            height: 47,
          )
        ],
      ),
    );
  }

  filterBottomSheet(){

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              TextWidget.openSansBoldText(
                  fontSize: 20.0,
                  text: "Filter",
                  color: ColorConst.textColor22),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: TextWidget.openSansBoldText(
                    fontSize: 16.0,
                    text: "Cancel",
                    color: ColorConst.textColor22),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ListView.builder(
            itemCount:
            testController.filterList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding:
              const EdgeInsets.only(bottom: 30.0),
              child: Row(
                children: [
                  SvgPicture.asset(testController
                      .filterList[index]["image"]),
                  SizedBox(
                    width: 12,
                  ),
                  TextWidget.openSansMediumText(
                      color: ColorConst.grey64,
                      text: testController
                          .filterList[index]['text'],
                      fontSize: 16.0),
                  Spacer(),
                  Obx(
                        () => InkWell(
                      onTap: () {
                        testController
                            .selectedIndex
                            .value = index;
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: ColorConst
                                    .appColor,
                                width: 1.5)),
                        alignment: Alignment.center,
                        child: testController
                            .selectedIndex
                            .value ==
                            index
                            ? Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              color: ColorConst
                                  .appColor,
                              shape: BoxShape
                                  .circle),
                        )
                            : Container(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
