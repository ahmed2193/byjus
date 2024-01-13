import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/helpCenter/delete_account_screen.dart';
import 'package:byjus/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
        centerTitle: true,
        title: TextWidget.openSansBoldText(
            text: "Contact", color: ColorConst.textColor22, fontSize: 18.0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CommonDetailScreenTextField(
              hintText: "Email Address",
              prefixIcon: ImageConst.mailIcon,
            ),
            SizedBox(
              height: 20,
            ),
            CommonDetailScreenTextField(
              hintText: "Enter Feedback here",
              prefixIcon: ImageConst.feedback,
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
              height: 21,
            ),
           InkWell(
             onTap: (){
                Get.to(DeleteAccountScreen());
             },
             child:  TextWidget.openSansMediumText(
                 text: "Delete your account",
                 color: ColorConst.grey64,
                 fontSize: 16.0
             ),
           ),
            SizedBox(
              height: 117,
            ),

          ],
        ),
      ),
    );
  }
}
