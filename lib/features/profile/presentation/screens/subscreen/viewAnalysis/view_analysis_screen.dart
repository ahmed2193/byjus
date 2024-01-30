import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
 import 'package:byjus/utils/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/app_state.dart';
import '../../../../../auth/presentation/controllers/user_info_controller.dart';
import '../../profile_screen.dart';

 

class ViewAnalysisScreen extends StatelessWidget {
  ViewAnalysisScreen({super.key});
  final UserInfoController userInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.white,
        body: Stack(
          children: [
            Container(
              height: 250,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConst.bgImage), fit: BoxFit.fill)),
              child: Obx(() {
                switch (userInfoController.apiState.value) {
                  case ApiState.loading:
                    return LoadingImageIndicator(); // Show loading indicator
                  case ApiState.success:
                    var userInfo = userInfoController.userInfo.value!.data!;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_sharp,
                                color: ColorConst.textColor22,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipOval(
                                child: 
                                   CachedNetworkImage(
                      imageUrl: userInfo.profileImage!,
                      fit: BoxFit.cover,
                        height: 80,
                                    width: 80,

                      placeholder: (context, url) => LoadingImageIndicator(),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error), // Widget to display on error
                    ),
                                
                                
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userInfo.username!,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: ColorConst.textColor22,
                                          overflow: TextOverflow.clip,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: robotoMediumFont),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      userInfo.schoolName == null
                                          ? ''
                                          : userInfo.schoolName!,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: ColorConst.grey64,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: robotoMediumFont),
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Get.to(ProfileScreen());
                                },
                                height: 30,
                                minWidth: 98,
                                color: ColorConst.appColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: TextWidget.openSansMediumText(
                                    color: ColorConst.white,
                                    fontSize: 13.0,
                                    text: "View Details"),
                              )
                            ],
                          ),
                        ],
                      ),
                    );

                  case ApiState.error:
                    return Container();
                  default:
                    return Container();
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 210.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: ColorConst.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          TextWidget.robotoMediumText(
                              text: "View Analysis",
                              color: ColorConst.textColor22,
                              fontSize: 18.0),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: ColorConst.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 20),
                              child: Row(
                                children: [
                                  SvgPicture.asset(ImageConst.strengthIcon),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget.openSansSemiBoldText(
                                            text: "Strengths & focus areas",
                                            color: ColorConst.textColor22,
                                            fontSize: 18.0),
                                        TextWidget.openSansRegularText(
                                            text:
                                                "Detailed analysis of your learning progress and performance to plan better and improve",
                                            color: ColorConst.textColor22,
                                            fontSize: 14.0),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextWidget.robotoMediumText(
                              text: "Speak to Us",
                              color: ColorConst.textColor22,
                              fontSize: 18.0),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: ColorConst.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 20),
                              child: Row(
                                children: [
                                  SvgPicture.asset(ImageConst.haveQueryIcon),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget.openSansSemiBoldText(
                                            text: "Have Queries?",
                                            color: ColorConst.textColor22,
                                            fontSize: 18.0),
                                        TextWidget.openSansRegularText(
                                            text:
                                                "Talk to your academic counsellor",
                                            color: ColorConst.textColor22,
                                            fontSize: 14.0),
                                        MaterialButton(
                                          onPressed: () {},
                                          height: 30,
                                          minWidth: 98,
                                          color: ColorConst.appColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: TextWidget.openSansMediumText(
                                              color: ColorConst.white,
                                              fontSize: 13.0,
                                              text: "Call Now"),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            )
          ],
        )
        /*Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ImageConst.profileLevel1Image,
                  height: 80,
                  width: 94,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "John Doe",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorConst.textColor22,
                        fontWeight: FontWeight.w700,
                        fontFamily: robotoMediumFont
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "JEE & NEET (11th)",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: ColorConst.grey64,
                          fontWeight: FontWeight.w400,
                          fontFamily: robotoMediumFont
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: (){
                    Get.to(ProfileScreen());
                  },
                  height: 30,
                  minWidth: 98,
                  color: ColorConst.appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextWidget.openSansMediumText(
                    color: ColorConst.white,
                    fontSize: 13.0,
                    text: "View Details"
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextWidget.robotoMediumText(
              text: "View Analysis",
              color: ColorConst.textColor22,
              fontSize: 18.0
            ),
            Container(
              width: Get.width,
              color: ColorConst.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(ImageConst.strengthIcon),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget.openSansSemiBoldText(
                            text: "Strengths & focus areas",
                            color: ColorConst.textColor22,
                            fontSize: 18.0
                          ),
                          TextWidget.openSansRegularText(
                              text: "Detailed analysis of your learning progress and performance to plan better and improve",
                              color: ColorConst.textColor22,
                              fontSize: 14.0
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget.robotoMediumText(
                text: "Speak to Us",
                color: ColorConst.textColor22,
                fontSize: 18.0
            ),
            Container(
              width: Get.width,
              color: ColorConst.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(ImageConst.haveQueryIcon),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget.openSansSemiBoldText(
                              text: "Have Queries?",
                              color: ColorConst.textColor22,
                              fontSize: 18.0
                          ),
                          TextWidget.openSansRegularText(
                              text: "Talk to your academic counsellor",
                              color: ColorConst.textColor22,
                              fontSize: 14.0
                          ),
                          MaterialButton(
                            onPressed: (){},
                            height: 30,
                            minWidth: 98,
                            color: ColorConst.appColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: TextWidget.openSansMediumText(
                                color: ColorConst.white,
                                fontSize: 13.0,
                                text: "Call Now"
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),*/
        );
  }
}
