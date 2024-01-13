import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
                    onTap: () {
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
                      text: "Notification Center",
                      color: ColorConst.textColor22,
                      fontSize: 18.0),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 108.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConst.notificationImage,
                      height: 226,
                      width: 226,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 51),
                      child: TextWidget.openSansMediumText(
                          color: ColorConst.textColor22,
                          fontSize: 16.0,
                          text: "You have no notifications right now. Come back later.",
                          textAlign: TextAlign.center
                      ) ,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
