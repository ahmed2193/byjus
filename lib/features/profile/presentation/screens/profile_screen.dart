import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/core/app_state.dart';
import 'package:byjus/features/auth/presentation/controllers/user_info_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/loading_indicator.dart';
import 'profile_utills.dart';
import 'subscreen/editprofile/edit_profile_screen.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final UserInfoController userInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Obx(() {
        switch (userInfoController.apiState.value) {
          case ApiState.loading:
            return LoadingImageIndicator(); // Show loading indicator
          case ApiState.success:
            var userInfo = userInfoController.userInfo.value!.data!;
            return Stack(
              children: [
                Container(
                  height: 250,
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConst.bgImage),
                          fit: BoxFit.fill)),
                  child: Padding(
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
                            // Image.asset(
                            //   ImageConst.profileLevel1Image,
                            //   height: 80,
                            //   width: 80,
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userInfo.username!,
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: ColorConst.textColor22,
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
                            MaterialButton(
                              onPressed: () {
                                Get.to(EditProfileScreen());
                              },
                              height: 30,
                              minWidth: 98,
                              color: ColorConst.appColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextWidget.openSansMediumText(
                                  color: ColorConst.white,
                                  fontSize: 13.0,
                                  text: "Edit Details"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                commonProfileColumn(
                                    text: "Mobile Number",
                                    hintText:
                                        '${userInfo.countryCode}${userInfo.phone}'),
                                commonProfileColumn(
                                    text: "Email ID", hintText: userInfo.email),
                                commonProfileColumn(
                                    text: "Address",
                                    hintText: userInfo.address),
                                commonProfileColumn(
                                    text: "Gender", hintText: userInfo.gender),
                                commonProfileColumn(
                                    text: "Date of Birth",
                                    hintText: userInfo.birthDate),
                              ],
                            ),
                          ),
                        )),
                  ),
                )
              ],
            );

          case ApiState.error:
            return Container();
          default:
            return Container();
        }
      }),

      /*SingleChildScrollView(
        child: Padding(
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
                      Get.to(EditProfileScreen());
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
                        text: "Edit Details"
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              commonProfileColumn(
                text: "Mobile Number",
                hintText: "+91-1234567890"
              ),
              commonProfileColumn(
                  text: "Email ID",
                  hintText: "Johndoe123@gmail.com"
              ),
              commonProfileColumn(
                  text: "Address",
                  hintText: "Surat, Gujarat"
              ),
              commonProfileColumn(
                  text: "Gender",
                  hintText: "Not Available"
              ),
              commonProfileColumn(
                  text: "Date of Birth",
                  hintText: "DD/MM/YY"
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}
