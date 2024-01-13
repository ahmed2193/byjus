import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayVideoScreen extends StatelessWidget {
  const PlayVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        foregroundColor: ColorConst.white,
      ),
      body: Column(
        children: [
          Spacer(),
           Image.asset(ImageConst.playVideoBgImage),
          Spacer(),
           Image.asset(ImageConst.videoProgressImage),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                TextWidget.openSansRegularText(
                  color: ColorConst.white,
                  text: "0:23:35 /  1:56:23",
                  fontSize: 14.0
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.volume_up_rounded,color: ColorConst.white,),
                Spacer(),
                SvgPicture.asset(ImageConst.rotateSmartphone),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
