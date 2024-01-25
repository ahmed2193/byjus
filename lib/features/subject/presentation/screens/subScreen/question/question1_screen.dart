import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/features/subject/presentation/screens/subScreen/electrictCharges/charge_behaviour_screen.dart';
import 'package:byjus/features/subject/presentation/screens/subScreen/question/question2_screen.dart';
  import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Question1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConst.splashBgImage),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: (){
                    Get.off(ChargeBehaviourScreen());
                  },
                  child: Icon(
                    Icons.clear,
                    color: ColorConst.whiteF0,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextWidget.openSansSemiBoldText(
                  color: ColorConst.white,
                  fontSize: 17.0,
                  text: '''Ring ‘B’ hovers on a positively charged ring ‘A’ as shown in the figure. The charge on ring B is''',
                textAlign: TextAlign.center
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 1,
                width: 179,
                color: ColorConst.white,
              ),
              SizedBox(
                height: 16,
              ),
              Image.asset(ImageConst.questionMobile,height: 158,width: 70,),
              Spacer(),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 47,
                  width: 158,
                  decoration: BoxDecoration(
                    color: ColorConst.whiteFF,
                    borderRadius: BorderRadius.circular(28)
                  ),
                  alignment: Alignment.center,
                  child: TextWidget.openSansBoldText(
                    text: "Neutral",
                    color: ColorConst.appColor,
                    fontSize: 18.0
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Get.to(Question2Screen());
                      },
                      child: Container(
                        height: 47,
                        decoration: BoxDecoration(
                            color: ColorConst.whiteFF,
                            borderRadius: BorderRadius.circular(28)
                        ),
                        alignment: Alignment.center,
                        child: TextWidget.openSansBoldText(
                            text: "Positive",
                            color: ColorConst.appColor,
                            fontSize: 18.0
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child : Container(
                      height: 47,
                      decoration: BoxDecoration(
                          color: ColorConst.whiteFF,
                          borderRadius: BorderRadius.circular(28)
                      ),
                      alignment: Alignment.center,
                      child: TextWidget.openSansBoldText(
                          text: "Negative",
                          color: ColorConst.appColor,
                          fontSize: 18.0
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
