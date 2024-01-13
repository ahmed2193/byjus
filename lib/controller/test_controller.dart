import 'package:byjus/constants/images.dart';
import 'package:get/get.dart';

class TestController extends GetxController{
  final List<Map> filterList = [
    {"image":ImageConst.shareAllIcon,"text":"All questions"},
    {"image":ImageConst.checkTrueIcon,"text":"Incorrect"},
    {"image":ImageConst.cancelIcon,"text":"Correct"},
  ];

  var selectedIndex = 0.obs;

  // ignore: prefer_typing_uninitialized_variables
  var selectAnswer;

  onAnswerChange(index){
    selectAnswer = index;
    update();
  }
}