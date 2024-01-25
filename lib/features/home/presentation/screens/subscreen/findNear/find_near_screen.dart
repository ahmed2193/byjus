import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindNearestScreen extends StatelessWidget {
  const FindNearestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          Container(
            height: 108,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImageConst.nearestBgImage,
                  ),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 40),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: ColorConst.textColor22,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TextWidget.openSansBoldText(
                      text: "Nearest Center",
                      color: ColorConst.textColor22,
                      fontSize: 18.0)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,top: 30),
            child: Row(
              children: [
                Icon(CupertinoIcons.search,color: ColorConst.grey88,),
                SizedBox(
                  width: 10,
                ),
                TextWidget.openSansMediumText(
                  color: ColorConst.grey64,
                  text: "Look for a particular state",
                  fontSize: 16.0
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
