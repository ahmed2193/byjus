import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/fill_detail_controller.dart';
import 'package:byjus/screen/home/home_screen.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LocationScreen extends StatelessWidget {
  final FillDetailController fillDetailController =
      Get.put(FillDetailController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            TextWidget.openSansBoldText(
              text:
                  "We need your location details\nso that we can personalise\nyour app experience",
              color: ColorConst.textColor22,
              fontSize: 18.0,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            SvgPicture.asset(ImageConst.locationImage),
            SizedBox(
              height: 74,
            ),
            Obx(
              () => fillDetailController.isClicked.isFalse
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: MaterialButton(
                            onPressed: () {
                              fillDetailController.isClicked.value = true;
                            },
                            height: 48,
                            minWidth: Get.width,
                            child: TextWidget.openSansMediumText(
                                text: "Allow Location Services",
                                color: ColorConst.white,
                                fontSize: 16.0),
                            color: ColorConst.appColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextWidget.openSansMediumText(
                          text: "Or",
                          color: ColorConst.appColor,
                          fontSize: 14.0,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: MaterialButton(
                            onPressed: () {},
                            height: 48,
                            minWidth: Get.width,
                            elevation: 0,
                            child: TextWidget.openSansMediumText(
                                text: "Enter Location Manually",
                                color: ColorConst.appColor,
                                fontSize: 16.0),
                            color: ColorConst.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                                side: BorderSide(
                                    color: ColorConst.appColor, width: 1)),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          height: 116,
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConst.greyE4, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(ImageConst.locationIcon),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    TextWidget.openSansBoldText(
                                        color: ColorConst.textColor22,
                                        fontSize: 14.0,
                                        text: "Patel Vadi")
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                TextWidget.openSansBoldText(
                                    color: ColorConst.grey64,
                                    fontSize: 13.0,
                                    text:
                                        "603, shubh square, Patel Vadi. Patel Nager,Surat, Gujarat, India, 395004 "),
                                SizedBox(
                                  height: 4,
                                ),
                                TextWidget.openSansMediumText(
                                    color: ColorConst.appColor,
                                    fontSize: 13.0,
                                    text: "Change"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        CommonButton(
                          onTap: () {
                            Get.offAll(HomeScreen());
                          },
                          text: "Start Learning",
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
