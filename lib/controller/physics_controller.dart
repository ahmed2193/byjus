import 'package:byjus/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhysicsController extends GetxController with GetSingleTickerProviderStateMixin{
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Learn'),
    Tab(text: 'Exercise'),
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

  List<Map> chargesList = [
    {"image":ImageConst.physicsListImage1,"text":"Idea of Charge"},
    {"image":ImageConst.physicsListImage2,"text":"Conductors and Insulators"},
    {"image":ImageConst.physicsListImage3,"text":"Charging by Indution"},
    {"image":ImageConst.physicsListImage4,"text":"Understanding"},
  ];

  List<Map> videoList = [
    {"image":ImageConst.videoBgImage,"text":"Idea of Charge"},
    {"image":ImageConst.videoBgImage,"text":"Conductors, Insulators an..."},
  ];

  var isClicked = false.obs;

  var selectedIndex;

  onIndexChange(index){
    selectedIndex  = index ;
    update();
  }

}