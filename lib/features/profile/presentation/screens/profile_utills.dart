import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/material.dart';

class ProfileCommonTextField extends StatelessWidget {
  final String? hintText;
  final Widget? widget;
  final bool? isEnable;
  final TextEditingController? controller;

  ProfileCommonTextField(
      {this.hintText, this.widget, this.isEnable,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
          color: ColorConst.textColor22,
          fontSize: 16,
          fontFamily: openSansBoldFont),
      enabled: isEnable ?? true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.greyE4)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.greyE4)),
          disabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.greyE4)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.greyE4)),
          suffixIcon: widget ?? SizedBox.shrink(),
          hintText: hintText,
          hintStyle: TextStyle(
              color: ColorConst.greyA6,
              fontSize: 16,
              fontFamily: openSansSemiBoldFont)),
    );
  }
}

commonProfileColumn({text, hintText,controller,widget,enable})=>Padding(
  padding: const EdgeInsets.only(bottom: 20.0),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextWidget.robotoMediumText(
          color: ColorConst.textColor22,
          fontSize: 14.0,
          text: text
      ),
      SizedBox(
        height: 8,
      ),
      ProfileCommonTextField(
        hintText: hintText,
        controller: controller,
        widget: widget??SizedBox.shrink(),
        isEnable: enable ?? true,
      )
    ],
  ),
);