import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

commonColumn({text, text2, subText, image, btnText, void Function()? onTap}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget.robotoMediumText(
            text: text, color: ColorConst.textColor22, fontSize: 18.0),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 185,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ColorConst.whiteF2,
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                SvgPicture.asset(image),
                SizedBox(
                  height: 10,
                ),
                TextWidget.openSansSemiBoldText(
                    text: text2, color: ColorConst.textColor22, fontSize: 14.0),
                SizedBox(
                  height: 5,
                ),
                TextWidget.openSansMediumText(
                    text: subText,
                    color: ColorConst.grey8A,
                    fontSize: 10.0,
                    textAlign: TextAlign.center),
                Spacer(),
                Container(
                    height: 30,
                    width: 136,
                    decoration: BoxDecoration(
                        color: ColorConst.purpleB3,
                        borderRadius: BorderRadius.circular(4)),
                    alignment: Alignment.center,
                    child: TextWidget.openSansBoldText(
                        color: ColorConst.white, fontSize: 16.0, text: btnText))
              ],
            ),
          ),
        )
      ],
    ),
  );
}

void modalBottomSheetMenu(context) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) async {
      await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))),
        builder: (builder) {
          return Container(
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget.openSansSemiBoldText(
                            text: "BYJU’S Classes",
                            color: ColorConst.textColor22,
                            fontSize: 20.0),
                        SizedBox(
                          height: 9,
                        ),
                        TextWidget.openSansRegularText(
                            color: ColorConst.grey64,
                            fontSize: 16.0,
                            text:
                                "Experience the best after school tuitions. hurry only a few slots left!",
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 25,
                        ),
                        SvgPicture.asset(ImageConst.homeBottomSheetImage),
                        SizedBox(
                          height: 25,
                        ),
                        CommonButton(
                          onTap: () {
                            Get.back();
                          },
                          text: "Book a Free Trial",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextWidget.openSansMediumText(
                            color: ColorConst.appColor,
                            fontSize: 18.0,
                            text: "Dismiss")
                      ],
                    ),
                  ),
                )),
          );
        },
      );
    },
  );
}
