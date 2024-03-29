import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/physics_controller.dart';
import 'package:byjus/features/subject/presentation/screens/subScreen/electrictCharges/exerciseView/exercise_view.dart';
import 'package:byjus/features/subject/presentation/screens/subScreen/electrictCharges/learnView/learn_view.dart';
import 'package:byjus/features/subject/presentation/screens/subject_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterDetailsScreen extends StatelessWidget {
  final PhysicsController physicsController = Get.put(PhysicsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            // Get.to(SubjectScreen());
          },
          child: Icon(Icons.arrow_back_outlined),
        ),
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
        title: TextWidget.openSansBoldText(
            text: "Electric Charges, Fields and G..",
            color: ColorConst.textColor22,
            fontSize: 18.0),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.to(SubjectScreen());
          return false;
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                height: 50,
                width: Get.width,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: ColorConst.greyEc,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  tabs: physicsController.myTabs,
                  unselectedLabelColor: ColorConst.appColor,
                  labelStyle:
                      TextStyle(fontSize: 16, fontFamily: robotoMediumFont),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 16, fontFamily: robotoMediumFont),
                  labelColor: ColorConst.white,
                  controller: physicsController.controller,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConst.appColor),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: physicsController.controller,
                children: [LearnView(), ExerciseView()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
