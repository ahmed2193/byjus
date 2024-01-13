import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final privacyList = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the indu stry's standard dummy text ever since the 1500s, whe an unknown printer took a galley of type and sc rambled it to make a type",
    "Ipsum has been the indu stry's standard dummy text ever since the 1500s, whe an unknown printerto ok a galley of type and sc rambled it to make a type"
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the indu stry's standard dummy text ever since the 1500s, whe an unknown printer took a galley of type and sc rambled it to make a type",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the indu stry's standard dummy text ever since the 1500s, whe an unknown printer took a galley of type and sc rambled it to make a type",
    "Ipsum has been the indu stry's standard dummy text ever since the 1500s, whe an unknown printerto ok a galley of type and sc rambled it to make a type"
  ];

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.openSansBoldText(
                text: "Privacy Policy",
                color: ColorConst.textColor22,
                fontSize: 24.0),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
              itemCount: privacyList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: TextWidget.openSansRegularText(
                    text: privacyList[index],
                    color: ColorConst.grey64,
                    fontSize: 13.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
