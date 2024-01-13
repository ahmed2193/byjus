import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/Physics/subScreen/electrictCharges/electrict_charges_screen.dart';
import 'package:byjus/screen/bookmark/bookmark_screen.dart';
import 'package:byjus/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PhysicsScreen extends StatelessWidget {
  final List<Map> physicsList = [
    {
      "image": ImageConst.physicsListImage1,
      "text": "Electric Charges, Fields and Gauss Law",
      "concept": "33"
    },
    {
      "image": ImageConst.physicsListImage2,
      "text": "Electric Potential Energy,Potential and Dipoles",
      "concept": "30"
    },
    {
      "image": ImageConst.physicsListImage3,
      "text": "Capacitance",
      "concept": "14"
    },
    {
      "image": ImageConst.physicsListImage4,
      "text": "Current Electricity",
      "concept": "18"
    },
    {
      "image": ImageConst.physicsListImage5,
      "text": "Circuit Networks",
      "concept": "15"
    },
    {
      "image": ImageConst.physicsListImage6,
      "text": "Magnetic Force",
      "concept": "14"
    },
    {
      "image": ImageConst.physicsListImage7,
      "text": "Magnetic Effects of Current",
      "concept": "13"
    },
    {
      "image": ImageConst.physicsListImage8,
      "text": "Permanent Magnets",
      "concept": "12"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: WillPopScope(
          onWillPop: () async {
            Get.offAll(HomeScreen());
            return false;
          },
          child: Stack(
            children: [
              Container(
                height: 250,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConst.bgImage),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.offAll(HomeScreen());
                              },
                              child: Icon(
                                Icons.arrow_back_sharp,
                                color: ColorConst.textColor22,
                              )),
                          InkWell(
                              onTap: () {
                                Get.to(BookMarkScreen());
                              },
                              child: SvgPicture.asset(ImageConst.bookmark)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Physics",
                                style: TextStyle(
                                    fontSize: 34.0,
                                    color: ColorConst.textColor22,
                                    fontFamily: robotoMediumFont,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ImageConst.chapterIcon),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  TextWidget.openSansMediumText(
                                      fontSize: 14.0,
                                      color: ColorConst.textColor22,
                                      text: "31 Chapters")
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(ImageConst.physicsImage)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: ColorConst.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child:  TextWidget.robotoMediumText(
                              color: ColorConst.textColor22,
                              text: "Chapters",
                              fontSize: 20.0),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: physicsList.length,
                            padding: EdgeInsets.only(left: 24,right: 24,top: 18),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: InkWell(
                                onTap: () {
                                  Get.to(ElectricChargesScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConst.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 12)
                                      ]),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        physicsList[index]["image"],
                                        height: 86,
                                        width: 86,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget.openSansSemiBoldText(
                                                text: physicsList[index]
                                                    ["text"],
                                                color: ColorConst.textColor22,
                                                fontSize: 15.0),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                TextWidget.openSansBoldText(
                                                    text: physicsList[index]
                                                        ["concept"],
                                                    fontSize: 14.0,
                                                    color: ColorConst.appColor),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                TextWidget.openSansSemiBoldText(
                                                    text: "Concepts",
                                                    color: ColorConst.grey64,
                                                    fontSize: 14.0),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
          /* Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Physics",
                        style: TextStyle(
                            fontSize: 34.0,
                            color: ColorConst.textColor22,
                            fontFamily: robotoMediumFont,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(ImageConst.chapterIcon),
                          SizedBox(
                            width: 12,
                          ),
                          TextWidget.openSansMediumText(
                              fontSize: 14.0,
                              color: ColorConst.textColor22,
                              text: "31 Chapters")
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(ImageConst.physicsImage)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextWidget.robotoMediumText(
                  color: ColorConst.textColor22,
                  text: "Chapters",
                  fontSize: 20.0),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: physicsList.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: InkWell(
                      onTap: (){
                        Get.to(ElectricChargesScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConst.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 12
                            )
                          ]
                        ),
                        child: Row(
                          children: [
                            Image.asset(physicsList[index]["image"],height: 86,width: 86,),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget.openSansSemiBoldText(
                                    text: physicsList[index]["text"],
                                    color: ColorConst.textColor22,
                                    fontSize: 15.0
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      TextWidget.openSansBoldText(
                                        text: physicsList[index]["concept"],
                                        fontSize: 14.0,
                                        color: ColorConst.appColor
                                      ),SizedBox(
                                        width: 5,
                                      ),
                                      TextWidget.openSansSemiBoldText(
                                          text: "Concepts",
                                          color: ColorConst.grey64,
                                          fontSize: 14.0
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),*/
          ),
    );
  }
}
