import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            TextWidget.openSansBoldText(
              text: "Welcome to the world of\nlearning Let’s start your\nregistration",
              color: ColorConst.textColor22,
              fontSize: 18.0,
              textAlign: TextAlign.center
            ),
            SizedBox(
              height: 35,
            ),
            CommonDetailScreenTextField(
              hintText: "Enter Your Name",
              prefixIcon: ImageConst.person,
            ),
            SizedBox(
              height: 20,
            ),
            CommonDetailScreenTextField(
              hintText: "Enter your Email ID*",
              prefixIcon: ImageConst.mailIcon,
            ),
          ],
        ),
      ),
    );
  }
}
