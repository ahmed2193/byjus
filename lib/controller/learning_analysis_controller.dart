import 'package:byjus/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearningAnalysisController extends GetxController with GetSingleTickerProviderStateMixin{
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Progress'),
    Tab(text: 'Performance'),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  final List<Map> subjectList = [
    {"image":ImageConst.allIcon,"text":"All"},
    {"image":ImageConst.mathsIcon,"text":"Mathematics"},
    {"image":ImageConst.physicsIcon,"text":"Physics"},
    {"image":ImageConst.chemestryIcon,"text":"Chemistry"},
  ];

  final List<Map> subjectList2 = [
    {"image":ImageConst.mathsIcon,"text":"Mathematics"},
    {"image":ImageConst.physicsIcon,"text":"Physics"},
    {"image":ImageConst.chemestryIcon,"text":"Chemistry"},
    {"image":ImageConst.biology,"text":"Biology"},
  ];

  var selectedIndex = 0.obs;
  var selectedIndex2 = 0.obs;

  var selectSubject = "All Subjects".obs;
}
