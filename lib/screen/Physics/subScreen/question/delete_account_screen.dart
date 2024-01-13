import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/physics_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DeleteAccountQuestionScreen extends StatelessWidget {
  final answerList = [
    "A.  Yes",
    "B.  No",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.white,
        foregroundColor: ColorConst.textColor22,
      ),
      body: GetBuilder<PhysicsController>(
        init: PhysicsController(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget.openSansRegularText(
                  color: ColorConst.grey64,
                  text: "Fam wants to find out if a metal sphere is Charged.",
                  fontSize: 16.0
              ),
              SizedBox(
                height: 5,
              ),
              TextWidget.openSansRegularText(
                  color: ColorConst.grey64,
                  text: "He took a new metal sphere. charged it positive and brought close to the first one. He noticed that they attract when close. He concluded that the first sphere must be negatively charged.",
                  fontSize: 16.0
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: answerList.length,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      onTap: () {
                        controller.onIndexChange(index);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: controller.selectedIndex == index?ColorConst.appColor:ColorConst.white,
                            borderRadius: BorderRadius.circular(40),
                            border:  Border.all(
                                color: ColorConst.greyE4)),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 18),
                        child: TextWidget.openSansMediumText(
                            color:  controller.selectedIndex == index?ColorConst.white:Colors.black,
                            fontSize: 18.0,
                            text: answerList[index]),
                      ),
                    ),
                  ),
                ),
              ),
              controller.selectedIndex==null?Container():Center(
                child: MaterialButton(
                  onPressed: () {
                    // Get.to(StartPractice2Screen());
                  },
                  minWidth: 170,
                  height: 47,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(28)),
                  color: ColorConst.appColor,
                  child: TextWidget.openSansBoldText(
                      text: "Submit",
                      color: ColorConst.white,
                      fontSize: 16.0),
                ),
              ),
              SizedBox(
                height: 98,
              )
            ],
          ),
        ),
      ),
    );
  }
}

