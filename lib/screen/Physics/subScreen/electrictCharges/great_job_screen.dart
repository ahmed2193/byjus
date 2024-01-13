import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/Physics/subScreen/question/question1_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreatJobScreen extends StatelessWidget {
  const GreatJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: InkWell(
        onTap: (){
          Get.to(Question1Screen());
        },
        child:Center(
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageConst.grateJobImage,height: 246,width: 233,),
              SizedBox(
                height: 37,
              ),
              TextWidget.robotoMediumText(
                text: "Great job John!",
                color: ColorConst.textColor22,
                fontSize: 22.0
              ),
              SizedBox(
                height: 14,
              ),
              TextWidget.openSansMediumText(
                  text: "Let’s try a quick question",
                  color: ColorConst.grey64,
                  fontSize: 16.0
              )
            ],
          ),
        ),
      ),
    );
  }
}
