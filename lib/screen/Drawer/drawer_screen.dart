import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/home_controller.dart';
import 'package:byjus/features/auth/presentation/controllers/logout_controller.dart';
import 'package:byjus/features/auth/presentation/screens/login_screen.dart';
import 'package:byjus/screen/bookmark/bookmark_screen.dart';
import 'package:byjus/screen/helpCenter/help_center_screen.dart';
import 'package:byjus/screen/learningAnalysis/learning_analysis_screen.dart';
import 'package:byjus/screen/notification/notification_screen.dart';
import 'package:byjus/screen/privacyPolicy/privacy_policy_screen.dart';
import 'package:byjus/screen/profile/subscreen/viewAnalysis/view_analysis_screen.dart';
import 'package:byjus/screen/termsCondition/terms_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:byjus/injection_container.dart' as di;

class DrawerScreen extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConst.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(
                height: 55,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImageConst.drawerProfileImage,
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget.openSansSemiBoldText(
                          text: "John Doe",
                          color: ColorConst.black1A,
                          fontSize: 15.0),
                      TextWidget.openSansMediumText(
                          text: "JEE & NEET (11th)",
                          color: ColorConst.grey64,
                          fontSize: 12.0),
                      SizedBox(
                        height: 9,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(ViewAnalysisScreen());
                        },
                        child: SvgPicture.asset(ImageConst.nextArrow),
                      ),
                    ],
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: homeController.menuList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Obx(
                    () => InkWell(
                      onTap: () {
                        homeController.selectMenu.value = index;
                        if (index == 1) {
                          Get.to(LearningAnalysisScreen());
                        }
                        if (index == 2) {
                          Get.to(BookMarkScreen());
                        }
                        if (index == 3) {
                          Get.to(NotificationScreen());
                        }
                        if (index == 6) {
                          Get.to(HelpCenterScreen());
                        }
                        if (index == 7) {
                          Get.to(TermsConditionScreen());
                        }
                        if (index == 8) {
                          Get.to(PrivacyPolicyScreen());
                        }
                      },
                      child: Container(
                        height: 48,
                        width: Get.width,
                        padding: EdgeInsets.only(left: 14),
                        decoration: BoxDecoration(
                            color: homeController.selectMenu.value == index
                                ? ColorConst.appColor
                                : ColorConst.white,
                            borderRadius: BorderRadius.circular(8)),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              homeController.menuList[index]["Image"],
                              color: homeController.selectMenu.value == index
                                  ? ColorConst.white
                                  : ColorConst.appColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextWidget.openSansSemiBoldText(
                                text: homeController.menuList[index]["text"],
                                color: homeController.selectMenu.value == index
                                    ? ColorConst.white
                                    : ColorConst.grey64,
                                fontSize: 15.0)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                color: Color(0xffD1D3D4).withOpacity(0.2),
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  final LogoutController controller =
                      Get.put(di.sl<LogoutController>());

                  Get.defaultDialog(
                      title: "",
                      contentPadding: EdgeInsets.zero,
                      titlePadding: EdgeInsets.zero,
                      content: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(ImageConst.logoutIcon),
                            SizedBox(
                              height: 23,
                            ),
                            TextWidget.openSansRegularText(
                                text: "Are you sure you want to Sign out.?",
                                color: ColorConst.textColor22,
                                fontSize: 14.0),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      controller.logout(context: context);
                                    },
                                    height: 40,
                                    elevation: 0,
                                    child: TextWidget.openSansMediumText(
                                        color: ColorConst.textColor22,
                                        fontSize: 18.0,
                                        text: "Yes"),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: BorderSide(
                                            color: ColorConst.textColor22,
                                            width: 1)),
                                  ),
                                ),
                                SizedBox(
                                  width: 22,
                                ),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    color: ColorConst.appColor,
                                    height: 40,
                                    elevation: 0,
                                    child: TextWidget.openSansMediumText(
                                        color: ColorConst.whiteF0,
                                        fontSize: 18.0,
                                        text: "No"),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ));
                },
                color: ColorConst.whiteF0,
                height: 40,
                minWidth: Get.width,
                elevation: 0,
                child: TextWidget.openSansSemiBoldText(
                    color: ColorConst.appColor,
                    fontSize: 15.0,
                    text: "Sign Out"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
