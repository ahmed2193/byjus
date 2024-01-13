import 'package:byjus/constants/images.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var selectedIndex = 0.obs;

  final List<Map> subjectList = [
    {"image":ImageConst.subjectBgImage1,"text":"Mathematics"},
    {"image":ImageConst.subjectBgImage2,"text":"Physics"},
    {"image":ImageConst.subjectBgImage3,"text":"Chemistry"},
    {"image":ImageConst.subjectBgImage4,"text":"Biology"},
  ];

  final List exploreList = [
    ImageConst.exploreBanner,
    ImageConst.exploreBanner,
    ImageConst.exploreBanner,
  ];

  final List<Map> menuList = [
    {"Image":ImageConst.classesIcon,"text":"John Byju’s Classes","selectedIndex":0.obs},
    {"Image":ImageConst.analysisIcon,"text":"Learning Analysis","selectedIndex":0.obs},
    {"Image":ImageConst.bookmarkIcon,"text":"Bookmarks","selectedIndex":0.obs},
    {"Image":ImageConst.notificationIcon,"text":"Notifications","selectedIndex":0.obs},
    {"Image":ImageConst.shareIcon,"text":"Share the App","selectedIndex":0.obs},
    {"Image":ImageConst.callIcon  ,"text":"Contact Us","selectedIndex":0.obs},
    {"Image":ImageConst.helpcenterIcon,"text":"Help Center","selectedIndex":0.obs},
    {"Image":ImageConst.termsConditionIcon,"text":"Terms & condition","selectedIndex":0.obs},
    {"Image":ImageConst.privacyPolicyIcon,"text":"Privacy Policy","selectedIndex":0.obs},
  ];

  var selectMenu = 0.obs;
}