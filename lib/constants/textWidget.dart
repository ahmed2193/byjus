import 'package:flutter/material.dart';

const String robotoMediumFont = "RobotoMedium";
const String openSansMediumFont = "openSansMedium";
const String openSansRegularFont = "openSansRegular";
const String openSansSemiBoldFont = "openSansSemiBold";
const String openSansBoldFont = "openSansBold";

class TextWidget{
  static openSansRegularText({String? text,Color? color,var fontSize,TextAlign? textAlign}){
    return Text(
      text!,
      textAlign: textAlign??TextAlign.start,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: openSansRegularFont
      ),
    );
  }

  static openSansMediumText({String? text,Color? color,var fontSize,TextAlign? textAlign}){
    return Text(
      text!,
      textAlign: textAlign??TextAlign.start,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: openSansMediumFont
      ),
    );
  }

  static openSansBoldText({String? text,Color? color,var fontSize,TextAlign? textAlign}){
    return Text(
      text!,
      textAlign: textAlign??TextAlign.start,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: openSansBoldFont
      ),
    );
  }


  static openSansSemiBoldText({String? text,Color? color,var fontSize,TextAlign? textAlign}){
    return Text(
      text!,
      textAlign: textAlign??TextAlign.start,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: openSansSemiBoldFont
      ),
    );
  }

  static robotoMediumText({String? text,Color? color,var fontSize,TextAlign? textAlign}){
    return Text(
      text!,
      textAlign: textAlign??TextAlign.start,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: robotoMediumFont
      ),
    );
  }
}
