import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/learning_analysis_controller.dart';
import 'package:byjus/screen/learningAnalysis/performance_view.dart';
import 'package:byjus/screen/learningAnalysis/progress_view.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LearningAnalysisScreen extends StatelessWidget {
  final LearningAnalysisController learningAnalysisController =
      Get.put(LearningAnalysisController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Image.asset(
                ImageConst.learningAnalysisBgImage,
                height: 268,
                width: Get.width,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: ColorConst.white,
                            ))),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        "Learning Analysis",
                        style: TextStyle(
                            fontSize: 28.0,
                            color: ColorConst.white,
                            fontFamily: robotoMediumFont,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 198.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorConst.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0,right: 24,top: 24),
                    child: Container(
                      height: 50,
                      width: Get.width,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: ColorConst.greyEc,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TabBar(
                        tabs: learningAnalysisController.myTabs,
                        unselectedLabelColor: ColorConst.appColor,
                        labelStyle: TextStyle(
                            fontSize: 16, fontFamily: robotoMediumFont),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 16, fontFamily: robotoMediumFont),
                        labelColor: ColorConst.white,
                        controller: learningAnalysisController.controller,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorConst.appColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 24.0,right: 24),
                      itemCount:
                          learningAnalysisController.subjectList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: InkWell(
                            onTap: () {
                              learningAnalysisController.selectedIndex.value =
                                  index;

                              if(learningAnalysisController.selectedIndex.value==index){
                                learningAnalysisController.selectSubject.value= learningAnalysisController.subjectList[index]["text"];
                              }
                              print(learningAnalysisController.selectSubject.value);
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 56,
                                  width: 56,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: learningAnalysisController
                                                  .selectedIndex.value ==
                                              index
                                          ? ColorConst.appColor
                                          : ColorConst.greyC1
                                              .withOpacity(0.30),
                                      borderRadius:
                                          BorderRadius.circular(16)),
                                  child: SvgPicture.asset(
                                      learningAnalysisController
                                          .subjectList[index]["image"],
                                      color: learningAnalysisController
                                                  .selectedIndex.value ==
                                              index
                                          ? ColorConst.white
                                          : ColorConst.appColor),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextWidget.openSansRegularText(
                                    text: learningAnalysisController
                                        .subjectList[index]["text"],
                                    color: learningAnalysisController
                                        .selectedIndex.value ==
                                        index
                                        ? ColorConst.appColor
                                        :ColorConst.grey64,
                                    fontSize: 14.0)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: learningAnalysisController.controller,
                        children: [
                      ProgressView(),
                      PerformanceView()
                    ]),
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
