import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommonDetailScreenTextField extends StatelessWidget {
  final String? hintText;
  final String? prefixIcon;
  final Widget? widget;
  final bool? isEnable;

  CommonDetailScreenTextField(
      {this.hintText, this.prefixIcon, this.widget, this.isEnable});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: ColorConst.textColor22,
          fontSize: 14,
          fontFamily: openSansSemiBoldFont),
      enabled: isEnable ?? true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.greyE4)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.greyE4)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.greyE4)),
          suffixIcon: widget ?? SizedBox.shrink(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(prefixIcon!),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: ColorConst.greyA6,
              fontSize: 14,
              fontFamily: openSansRegularFont)),
    );
  }
}

class CommonButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;

  CommonButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 47,
      minWidth: Get.width,
      child: TextWidget.openSansBoldText(
          text: text, color: ColorConst.white, fontSize: 18.0),
      color: ColorConst.appColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    );
  }
}

selectGradeBottomSheet() {
  final List gradeList1 = [
    "6th",
    "7th",
    "8th",
    "9th",
    "10th",
    "4th",
    "5th"
  ];

  final List gradeList2 = [
    "JEE (11th)",
    "NEET (11th)",
    "Jee & Neet (11th)",
  ];

  final List gradeList3 = [
    "Jee (12th)",
    "NEET (12th)",
    "Jee & Neet (12th)",
  ];
  return Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.only(top: 115.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: ColorConst.white,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget.openSansBoldText(
                          text: "Grade/Course",
                          color: ColorConst.textColor22,
                          fontSize: 20.0,
                        ),
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: ColorConst.textColor22,
                                fontSize: 16.0,
                                fontFamily: robotoMediumFont,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget.openSansBoldText(
                      text: "Grades 4 - 10",
                      color: ColorConst.textColor22,
                      fontSize: 18.0,
                    ),
                    commonGradeGrid(list: gradeList1),
                    TextWidget.openSansBoldText(
                      text: "11th Grade",
                      color: ColorConst.textColor22,
                      fontSize: 18.0,
                    ),
                    commonGradeGrid(list: gradeList2),
                    TextWidget.openSansBoldText(
                      text: "12th Grade",
                      color: ColorConst.textColor22,
                      fontSize: 18.0,
                    ),
                    commonGradeGrid(list: gradeList3),
                  ],
                ),
              ),
            )),
      ),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))));
}


commonLearningBottomSheet(learningAnalysisController)=>Get.bottomSheet(
    Padding(
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
                  text: "Select a Subject",
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
          LayoutBuilder(
            builder: (context, constraints) => GridView.count(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              childAspectRatio:
              MediaQuery.of(context).size.aspectRatio * 3 / 1,
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(
                learningAnalysisController.subjectList2.length,
                    (index) => Obx(
                      () => Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: InkWell(
                      onTap: () {
                        learningAnalysisController.selectedIndex2.value =
                            index;

                        if(learningAnalysisController.selectedIndex2.value==index){
                          learningAnalysisController.selectedIndex2.value= learningAnalysisController.subjectList[index]["text"];
                        }
                        print(learningAnalysisController.selectedIndex2.value);
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: learningAnalysisController
                                    .selectedIndex2.value ==
                                    index
                                    ? ColorConst.appColor
                                    : ColorConst.greyC1
                                    .withOpacity(0.30),
                                borderRadius:
                                BorderRadius.circular(16)),
                            child: SvgPicture.asset(
                                learningAnalysisController
                                    .subjectList2[index]["image"],
                                color: learningAnalysisController
                                    .selectedIndex2.value ==
                                    index
                                    ? ColorConst.white
                                    : ColorConst.appColor),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextWidget.openSansRegularText(
                              text: learningAnalysisController
                                  .subjectList2[index]["text"],
                              color: learningAnalysisController
                                  .selectedIndex2.value ==
                                  index
                                  ? ColorConst.appColor
                                  :ColorConst.grey64,
                              fontSize: 14.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40))),
    backgroundColor: ColorConst.white);

commonGradeGrid({list})=> LayoutBuilder(
  builder: (context, constraints) => GridView.count(
    padding: EdgeInsets.only( top: 15 , bottom: 20),
    childAspectRatio: MediaQuery.of(context).size.aspectRatio * 3/0.5,
    shrinkWrap: true,
    crossAxisCount: 2,
    crossAxisSpacing: 9,
    mainAxisSpacing: 10,
    physics: NeverScrollableScrollPhysics(),
    children: List.generate(
      list.length,
          (index) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorConst.greyE4,width: 1)
        ),
        alignment: Alignment.center,
        child: TextWidget.openSansMediumText(
            text: list[index],
            color: ColorConst.textColor22,
            fontSize: 18.0
        ),
      ),
    ).toList(),
  ),
);

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}


