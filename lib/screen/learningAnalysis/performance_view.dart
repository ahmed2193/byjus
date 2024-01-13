import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/learning_analysis_controller.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PerformanceView extends StatelessWidget {
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
              Text(
                "All Subjects:",
                style: TextStyle(
                    fontSize: 24.0,
                    color: ColorConst.textColor22 ,
                    fontFamily: robotoMediumFont,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 18,
              ),
              TextWidget.openSansSemiBoldText(
                  color: ColorConst.textColor22,
                  fontSize: 15.0,
                  text: "Overall Statistics"
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Image.asset(ImageConst.chatDescImage),
              ),
              Center(child: Image.asset(ImageConst.pieChartImage,height: 252,width: 240,)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 92,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(ImageConst.note),
                          SizedBox(
                            height: 11,
                          ),
                          TextWidget.openSansRegularText(
                              color: ColorConst.grey8A,
                              fontSize: 10.0,
                              text: "Questions Correct",
                              textAlign: TextAlign.center
                          ),
                          TextWidget.openSansSemiBoldText(
                              text: "0",
                              fontSize: 14.0,
                              color: ColorConst.textColor22
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 92,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(ImageConst.test),
                          SizedBox(
                            height: 11,
                          ),
                          TextWidget.openSansRegularText(
                              color: ColorConst.grey8A,
                              fontSize: 10.0,
                              text: "Test Attempted",
                              textAlign: TextAlign.center
                          ),
                          TextWidget.openSansSemiBoldText(
                              text: "0/382",
                              fontSize: 14.0,
                              color: ColorConst.textColor22
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 92,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(ImageConst.clockIcon),
                          SizedBox(
                            height: 11,
                          ),
                          TextWidget.openSansRegularText(
                            color: ColorConst.grey8A,
                            fontSize: 10.0,
                            text: "Avg.Time/Questions",
                            textAlign: TextAlign.center
                          ),
                          TextWidget.openSansSemiBoldText(
                              text: "0s",
                              fontSize: 14.0,
                              color: ColorConst.textColor22
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Center(
                child: TextWidget.openSansSemiBoldText(
                    color: ColorConst.grey64,
                    fontSize: 15.0,
                    textAlign: TextAlign.center,
                    text: "when you start taking tests, you will see your performance here."
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: CommonButton(
                  onTap: (){
                    commonLearningBottomSheet(learningAnalysisController);
                  },
                  text: "Start Test",
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
