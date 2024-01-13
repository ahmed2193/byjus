import 'package:byjus/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookMarkController extends GetxController with GetSingleTickerProviderStateMixin{
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Mathematics'),
    Tab(text: 'Physics'),
    Tab(text: 'Chemistry'),
    Tab(text: 'Biology'),
    Tab(text: 'Competitive Exam - Mocks'),
    Tab(text: 'Previous Years Papers'),
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

  final List<Map> bookMarkList = [
    {"image":ImageConst.bookMarkListImage1,"text":"Conductors, Insulators and Methods of Charging","subText":"Physics | Electric Charges, Fields and Gauss Law"},
    {"image":ImageConst.bookMarkListImage2,"text":"Idea of Charge","subText":"Physics | Electric Charges, Fields and Gauss Law"},
    {"image":ImageConst.bookMarkListImage3,"text":"Conductors, Insulators and Methods of Charging","subText":"Physics | Electric Charges, Fields and Gauss Law"},
    {"image":ImageConst.bookMarkListImage4,"text":"Conductors, Insulators and Methods of Charging","subText":"Physics | Electric Charges, Fields and Gauss Law"},
    {"image":ImageConst.bookMarkListImage2,"text":"Idea of Charge","subText":"Physics | Electric Charges, Fields and Gauss Law"},
  ];

  final List<Map> filterList = [
    {"image":ImageConst.shareAllIcon,"text":"Show all"},
    {"image":ImageConst.questionIcon,"text":"Questions"},
    {"image":ImageConst.playButton,"text":"Videos"},
  ];

  var selectedIndex = 0.obs;
  var isTap = false.obs;

}