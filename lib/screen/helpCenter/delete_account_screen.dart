import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            children: [
              TextWidget.openSansBoldText(
                  text: "Delete Your Account",
                  color: ColorConst.textColor22,
                  fontSize: 24.0),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextWidget.openSansRegularText(
                    text: "Process will take 15 days to completely remove your account. You will receive a confirmation email once done.",
                    color: ColorConst.grey64,
                    fontSize: 14.0,
                    textAlign: TextAlign.center
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextWidget.openSansRegularText(
                  text: "Please note that once clicked on Submit we will raise the account deletion.",
                    color: ColorConst.grey64,
                    fontSize: 14.0,
                    textAlign: TextAlign.center
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CommonDetailScreenTextField(
                hintText: "Email Address",
                prefixIcon: ImageConst.mailIcon,
              ),
              SizedBox(
                height: 20,
              ),
              CommonDetailScreenTextField(
                hintText: "Enter your reason here (optional)",
                prefixIcon: ImageConst.chattingIcon,
              ),
              Spacer(),
              MaterialButton(
                onPressed: () {},
                minWidth: 170,
                height: 47,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28)
                ),
                color: ColorConst.appColor,
                child: TextWidget.openSansBoldText(
                    text: "Send",
                    color: ColorConst.white,
                    fontSize: 18.0
                ),
              ),
              SizedBox(
                height: 98,
              )
            ],
          ),
        ),
      ),
    );
  }
}
