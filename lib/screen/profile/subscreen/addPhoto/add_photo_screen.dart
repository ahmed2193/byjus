import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPhotoView extends StatelessWidget {
  final addPhotoList = [
    ImageConst.addPhotoImage1,
    ImageConst.addPhotoImage2,
    ImageConst.addPhotoImage3,
    ImageConst.addPhotoImage4,
    ImageConst.addPhotoImage5,
    ImageConst.addPhotoImage6,
    ImageConst.addPhotoImage7,
    ImageConst.addPhotoImage8,
    ImageConst.addPhotoImage9,
    ImageConst.addPhotoImage3,
    ImageConst.addPhotoImage1,
    ImageConst.addPhotoImage2,
    ImageConst.addPhotoImage5,
    ImageConst.addPhotoImage8,
    ImageConst.addPhotoImage9,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 115.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConst.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0,left: 24,right: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget.openSansBoldText(
                      color: ColorConst.textColor22,
                      text: "Add a Profile Photo",
                      fontSize: 20.0),
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: ColorConst.textColor22,
                        fontFamily: robotoMediumFont,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => GridView.count(
                    padding: EdgeInsets.only(top: 15, bottom: 20),
                    childAspectRatio: MediaQuery.of(context).size.aspectRatio * 3 / 2,
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                    children: List.generate(
                        addPhotoList.length,
                        (index) => Image.asset(
                              addPhotoList[index],
                              height: 88,
                              width: 88,
                            )).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
