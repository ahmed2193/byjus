import 'dart:developer';

import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/features/auth/data/models/board_and_class_model.dart';
import 'package:byjus/features/auth/presentation/controllers/get_board_list_controller.dart';
import 'package:byjus/features/auth/presentation/controllers/get_class_list_controller.dart';
import 'package:byjus/features/auth/presentation/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:byjus/injection_container.dart' as di;

import '../features/auth/presentation/controllers/app_state.dart';

class CommonDetailScreenTextField extends StatelessWidget {
  final String? hintText;
  final String? prefixIcon;
  final Widget? widget;
  final bool? isEnable;
  final TextEditingController? textEditingController;
  final String? Function(dynamic)? validationFunction;

  CommonDetailScreenTextField({
    this.hintText,
    this.prefixIcon,
    this.widget,
    this.isEnable,
    this.textEditingController,
    this.validationFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:textEditingController ,
      validator:validationFunction ,
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

class CommonButton extends StatefulWidget {
  final void Function()? onTap;
  final String? text;

  CommonButton({this.onTap, this.text});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onTap,
      height: 47,
      minWidth: Get.width,
      child: TextWidget.openSansBoldText(
          text: widget.text, color: ColorConst.white, fontSize: 18.0),
      color: ColorConst.appColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    );
  }
}

selectGradeBottomSheet() {
  final List gradeList1 = ["6th", "7th", "8th", "9th", "10th", "4th", "5th"];

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
  final ClassListController classListController =
      Get.put(di.sl<ClassListController>());
  final BoardListController boardListController =
      Get.put(di.sl<BoardListController>());

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
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: ColorConst.textColor22,
                                fontSize: 16.0,
                                fontFamily: robotoMediumFont,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      if (boardListController.apiState.value ==
                              ApiState.loading ||
                          classListController.apiState.value ==
                              ApiState.loading) {
                        return CircularProgressIndicator();
                      } else if (boardListController.apiState.value ==
                              ApiState.success ||
                          classListController.apiState.value ==
                              ApiState.loading) {
                        // Use the boardAndClassData in your UI
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget.openSansBoldText(
                              text: "Grades 4 - 10",
                              color: ColorConst.textColor22,
                              fontSize: 18.0,
                            ),
                            commonGradeGrid(
                                list: boardListController.boardAndClassData),
                            TextWidget.openSansBoldText(
                              text: "11th Grade",
                              color: ColorConst.textColor22,
                              fontSize: 18.0,
                            ),
                            commonGradeGrid(
                                list: classListController.classListData),
                            // TextWidget.openSansBoldText(
                            //   text: "12th Grade",
                            //   color: ColorConst.textColor22,
                            //   fontSize: 18.0,
                            // ),
                            // commonGradeGrid(list: gradeList3),
                          ],
                        );
                      } else if (boardListController.apiState.value ==
                              ApiState.error ||
                          classListController.apiState.value ==
                              ApiState.error) {
                        return Text(
                            'Error: ${boardListController.errorMessage.value}');
                      } else {
                        return Text('Unknown error');
                      }
                    }),
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

commonLearningBottomSheet(learningAnalysisController) => Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              childAspectRatio: MediaQuery.of(context).size.aspectRatio * 3 / 1,
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
                        learningAnalysisController.selectedIndex2.value = index;

                        if (learningAnalysisController.selectedIndex2.value ==
                            index) {
                          learningAnalysisController.selectedIndex2.value =
                              learningAnalysisController.subjectList[index]
                                  ["text"];
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
                                    : ColorConst.greyC1.withOpacity(0.30),
                                borderRadius: BorderRadius.circular(16)),
                            child: SvgPicture.asset(
                                learningAnalysisController.subjectList2[index]
                                    ["image"],
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
                                  : ColorConst.grey64,
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
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    backgroundColor: ColorConst.white);

commonGradeGrid({
  BoardAndClassModel? list,
}) =>
    LayoutBuilder(builder: (context, constraints) {
      final ClassListController classListController = Get.find();
      final BoardListController boardListController = Get.find();

      final RegisterController controller = Get.find();

      int selectedIndex = -1;
      return list == null
          ? SizedBox()
          : GridView.count(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              childAspectRatio:
                  MediaQuery.of(context).size.aspectRatio * 3 / 0.5,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 9,
              mainAxisSpacing: 10,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(
                list!.data!.length,
                (index) =>
                    StatefulBuilder(builder: (BuildContext context, update) {
                  return GestureDetector(
                    onTap: () {
                      update(() {
                     
                        if (selectedIndex == index) {
                          selectedIndex = -1;
                        } else {
                          selectedIndex = index;
                          if (classListController
                                  .classListData!.data![index].name ==
                              list!.data![index].name) {
                            log('class');
                            log(list!.data![index].name.toString());
                            controller.className.value =
                                list!.data![index].name!;
                          } else {
                            log('board');
                            log(list!.data![index].name.toString());
                            controller.boardName.value =
                                list!.data![index].name!;
                          }
                        }
                        log(selectedIndex.toString());
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: selectedIndex == index
                                  ? ColorConst.appColor
                                  : ColorConst.greyE4,
                              width: 1)),
                      alignment: Alignment.center,
                      child: TextWidget.openSansMediumText(
                          text: list!.data![index].name,
                          color: ColorConst.textColor22,
                          fontSize: 18.0),
                    ),
                  );
                }),
              ).toList(),
            );
    });

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
