import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/physics_controller.dart';
import 'package:byjus/core/app_state.dart';
import 'package:byjus/features/subject/presentation/controllers/get_chapter_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/subject/presentation/screens/subScreen/electrictCharges/exerciseView/exercise_view.dart';
import '../../../../features/subject/presentation/screens/subScreen/electrictCharges/learnView/learn_view.dart';
import 'package:byjus/injection_container.dart' as di;

class ChapterDetailsScreen extends StatefulWidget {
  int? id;
  String? name;
  ChapterDetailsScreen({
    this.id,
    this.name,
  });
  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  final PhysicsController physicsController = Get.put(PhysicsController());
  final ChapterDetailsController chapterDetailsController = Get.put(
    di.sl<ChapterDetailsController>(),
  );
  fetchData() {
    chapterDetailsController.fetchData(id: widget.id!);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            // Get.pop(SubjectScreen());
          },
          child: Icon(Icons.arrow_back_outlined),
        ),
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
        title: TextWidget.openSansBoldText(
            text: widget.name, color: ColorConst.textColor22, fontSize: 18.0),
      ),
      body: Column(
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
          Obx(() {
            if (chapterDetailsController.apiState.value == ApiState.loading) {
              return Expanded(
                child: TabBarView(
                  controller: physicsController.controller,
                  children: [LearnView(), ExerciseView()],
                ),
              );
              
              // LoadingIndicator();
            } else if (chapterDetailsController.apiState.value ==
                ApiState.success) {
              var subjectChapterList =
                  chapterDetailsController.subjectChapterData;
              return Expanded(
                child: TabBarView(
                  controller: physicsController.controller,
                  children: [LearnView(), ExerciseView()],
                ),
              );
            } else if (chapterDetailsController.apiState.value ==
                ApiState.error) {
              return Center(
                child: TextWidget.openSansBoldText(
                    text: chapterDetailsController.errorMessage.value,
                    color: ColorConst.grey64,
                    fontSize: 17.0),
              );
            } else {
              return Text('Unknown error');
            }
          }),
        ],
      ),

      //  WillPopScope(
      //   onWillPop: () async {
      //     // Get.to(SubjectScreen());
      //     // return false;
      //   },
      //   child:

      // ),
    );
  }
}
