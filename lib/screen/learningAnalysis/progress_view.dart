import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/learning_analysis_controller.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProgressView extends StatelessWidget {
  final LearningAnalysisController learningAnalysisController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  "${learningAnalysisController.selectSubject.value}:",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: ColorConst.textColor22,
                      fontFamily: robotoMediumFont,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget.openSansSemiBoldText(
                      color: ColorConst.textColor22,
                      fontSize: 15.0,
                      text: "Activity Time"),
                  Container(
                    height: 13,
                    width: 2,
                    color: Colors.black,
                  ),
                  TextWidget.openSansMediumText(
                      color: ColorConst.greyA6,
                      fontSize: 14.0,
                      text: "Overall"),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ColorConst.grey64,
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
             Obx(() =>  learningAnalysisController.selectSubject.value == "Mathematics"
                 ? Image.asset(ImageConst.graphImage2,height: 179,)
                 : Image.asset(
               ImageConst.graphImage1,
               height: 179,
             ),),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Row(
                        children: [
                          SvgPicture.asset(ImageConst.lightIcon),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget.openSansRegularText(
                                  text: "Topics Learned",
                                  fontSize: 10.0,
                                  color: ColorConst.grey8A),
                              TextWidget.openSansSemiBoldText(
                                  text: "0/1728",
                                  fontSize: 14.0,
                                  color: ColorConst.textColor22)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Row(
                        children: [
                          SvgPicture.asset(ImageConst.clockIcon),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget.openSansRegularText(
                                  text: "learning time",
                                  fontSize: 10.0,
                                  color: ColorConst.grey8A),
                              TextWidget.openSansSemiBoldText(
                                  text: "77 mins",
                                  fontSize: 14.0,
                                  color: ColorConst.textColor22)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: TextWidget.openSansSemiBoldText(
                    color: ColorConst.grey64,
                    fontSize: 15.0,
                    text: "There are no topics learned"),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: CommonButton(
                  onTap: () {
                    commonLearningBottomSheet(learningAnalysisController);
                  },
                  text: "Start Learning",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
