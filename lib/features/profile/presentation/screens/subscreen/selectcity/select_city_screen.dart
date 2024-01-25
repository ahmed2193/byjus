import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectYourCityScreen extends StatelessWidget {
  const SelectYourCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
        centerTitle: true,
        title:  TextWidget.openSansBoldText(
            text: "Select your city",
            color: ColorConst.textColor22,
            fontSize: 18.0) ,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
           TextFormField(
             decoration: InputDecoration(
               hintText: "Search",
               hintStyle: TextStyle(
                 color: ColorConst.grey64,
                 fontSize: 16.0,
                 fontFamily: openSansMediumFont
               ),
               border: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: ColorConst.whiteFC
                 )
               ),
               focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                       color: ColorConst.whiteFC
                   )
               ),
               enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                       color: ColorConst.whiteFC
                   )
               ),
               fillColor: ColorConst.whiteFC,
               filled: true,
               suffixIcon: Icon(CupertinoIcons.search,color: ColorConst.grey88,size: 30,)
             ),
           )
          ],
        ),
      ),
    );
  }
}
