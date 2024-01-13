import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectGradeScreen extends StatelessWidget {
  const SelectGradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            TextWidget.openSansBoldText(
                text: "Tell us which class/grade and\nSchool do you study in?",
                color: ColorConst.textColor22,
                fontSize: 18.0,
                textAlign: TextAlign.center),
            SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {
                selectGradeBottomSheet();
              },
              child: CommonDetailScreenTextField(
                hintText: "Select Grade",
                prefixIcon: ImageConst.selectGradeIcon,
                isEnable: false,
                widget:
                    Icon(Icons.keyboard_arrow_down, color: ColorConst.greyC5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


