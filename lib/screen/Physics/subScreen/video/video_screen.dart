import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VideoScreen extends StatelessWidget {
  final List<Map> videoList = [
    {"image":ImageConst.videoImage1,"text":"An Introduction to...","subText":"02:30 mins","icon":ImageConst.checkIcon},
    {"image":ImageConst.videoImage2,"text":"Measuring Length: A...","subText":"12:40 mins","icon":ImageConst.playCircle},
    {"image":ImageConst.videoImage3,"text":"Standard Units","subText":"24:12 mins","icon":""},
    {"image":ImageConst.videoImage4,"text":"Motion and Its Types","subText":"02:30 mins","icon":""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 313,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConst.vedioScreenBgImage),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 90, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: ColorConst.white,
                          )),
                      Icon(
                        Icons.settings_outlined,
                        color: ColorConst.white,
                      )
                    ],
                  ),
                  SvgPicture.asset(ImageConst.pauseIcon),
                  Image.asset(ImageConst.videoDescImage),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorConst.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextWidget.openSansRegularText(
                            color: ColorConst.appColor,
                            text: "An Introduction to motion",
                            fontSize: 13.0),
                        Spacer(),
                        Icon(
                          Icons.share_outlined,
                          color: ColorConst.grey2C,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.bookmark_border,
                          color: ColorConst.grey2C,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextWidget.robotoMediumText(
                        fontSize: 20.0,
                        text: "Motion and measurements of Distances",
                        color: ColorConst.textColor22),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageConst.clockIcon,
                          height: 10,
                          width: 10,
                          color: ColorConst.grey8f,
                        ),
                        TextWidget.openSansRegularText(
                            color: ColorConst.grey8f,
                            text: " 3h 30mins",
                            fontSize: 12.0),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    TextWidget.robotoMediumText(
                        text: "Videos",
                        color: ColorConst.appColor,
                        fontSize: 18.0),
                    ListView.builder(
                      itemCount: videoList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          children: [
                            Image.asset(videoList[index]["image"],height: 55,width: 96,),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget.openSansSemiBoldText(
                                  text: videoList[index]["text"],
                                  color: ColorConst.textColor22,
                                  fontSize: 15.0
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImageConst.clockIcon,
                                      height: 10,
                                      width: 10,
                                      color: ColorConst.grey8f,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    TextWidget.openSansRegularText(
                                        color: ColorConst.grey8f,
                                        text: videoList[index]["subText"],
                                        fontSize: 12.0),

                                  ],
                                ),

                              ],
                            ),
                            Spacer(),
                            videoList[index]['icon']==""?Container():SvgPicture.asset(videoList[index]['icon'])
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}