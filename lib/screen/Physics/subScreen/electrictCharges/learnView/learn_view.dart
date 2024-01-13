import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/physics_controller.dart';
import 'package:byjus/screen/Physics/subScreen/electrictCharges/idea_charge_screen.dart';
import 'package:byjus/screen/Physics/subScreen/video/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LearnView extends StatelessWidget {
  final PhysicsController physicsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                TextWidget.robotoMediumText(
                    color: ColorConst.textColor22,
                    fontSize: 20.0,
                    text: "Personalised journey"),
                Spacer(),
                Text(
                  "35 Journeys",
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorConst.grey64,
                      fontFamily: robotoMediumFont,
                      fontWeight: FontWeight.w400),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: ColorConst.grey64,
                )
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24),
            itemCount: physicsController.chargesList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConst.white,
                    boxShadow: [
                      BoxShadow(
                          color:
                          Colors.black.withOpacity(0.1),
                          blurRadius: 12)
                    ]),
                child: Row(
                  children: [
                    Image.asset(
                      physicsController.chargesList[index]['image'],
                      height: 86,
                      width: 86,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: TextWidget.openSansSemiBoldText(
                          color: ColorConst.textColor22,
                          text: physicsController.chargesList[index]
                          ['text'],
                          fontSize: 15.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                          onTap: () {
                            Get.to(IdeaChargeScreen());
                          },
                          child: SvgPicture.asset(
                              ImageConst.arrowForwardIcon)),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                TextWidget.robotoMediumText(
                    color: ColorConst.textColor22,
                    fontSize: 20.0,
                    text: "Video Lessons"),
                Spacer(),
                Text(
                  "10 Videos",
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorConst.grey64,
                      fontFamily: robotoMediumFont,
                      fontWeight: FontWeight.w400),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: ColorConst.grey64,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24, top: 20),
              itemCount: physicsController.videoList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: InkWell(
                  onTap: () {
                    Get.to(VideoScreen());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        physicsController.videoList[index]["image"],
                        height: 142,
                        width: 259,
                      ),
                      TextWidget.openSansSemiBoldText(
                          color: ColorConst.textColor22,
                          fontSize: 15.0,
                          text: physicsController.videoList[index]
                          ["text"])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
