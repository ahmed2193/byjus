import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BookMarkScreen extends StatelessWidget {
  final BookMarkController bookMarkController = Get.put(BookMarkController());

  final List bookMarkList = [
    "All",
    "Mathematics",
    "Physics",
    "Chemistry",
    "Biology",
    "Competitive Exam - Mocks",
    "Previous Years Papers"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          Container(
            height: 108,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImageConst.nearestBgImage,
                  ),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 40),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: ColorConst.textColor22,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TextWidget.openSansBoldText(
                      text: "Bookmarks",
                      color: ColorConst.textColor22,
                      fontSize: 18.0),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InkWell(
                        onTap: () {
                          Get.bottomSheet(
                              Padding(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget.openSansBoldText(
                                            fontSize: 20.0,
                                            text: "Filter",
                                            color: ColorConst.textColor22),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: TextWidget.openSansBoldText(
                                              fontSize: 16.0,
                                              text: "Cancel",
                                              color: ColorConst.textColor22),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    ListView.builder(
                                      itemCount:
                                          bookMarkController.filterList.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 30.0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(bookMarkController
                                                .filterList[index]["image"]),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            TextWidget.openSansMediumText(
                                                color: ColorConst.grey64,
                                                text: bookMarkController
                                                    .filterList[index]['text'],
                                                fontSize: 16.0),
                                            Spacer(),
                                            Obx(
                                              () => InkWell(
                                                onTap: () {
                                                  bookMarkController
                                                      .selectedIndex
                                                      .value = index;
                                                },
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: ColorConst
                                                              .appColor,
                                                          width: 1.5)),
                                                  alignment: Alignment.center,
                                                  child: bookMarkController
                                                              .selectedIndex
                                                              .value ==
                                                          index
                                                      ? Container(
                                                          height: 12,
                                                          width: 12,
                                                          decoration: BoxDecoration(
                                                              color: ColorConst
                                                                  .appColor,
                                                              shape: BoxShape
                                                                  .circle),
                                                        )
                                                      : Container(),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                              backgroundColor: ColorConst.white);
                        },
                        child: SvgPicture.asset(ImageConst.filterIcon)),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 45,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(color: ColorConst.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  offset: Offset(0, 4),
                  blurRadius: 12)
            ]),
            child: TabBar(
              isScrollable: true,
              tabs: bookMarkController.myTabs,
              unselectedLabelColor: ColorConst.textColor22,
              labelStyle: TextStyle(fontSize: 16, fontFamily: robotoMediumFont),
              unselectedLabelStyle:
                  TextStyle(fontSize: 16, fontFamily: robotoMediumFont),
              labelColor: ColorConst.appColor,
              controller: bookMarkController.controller,
              indicatorWeight: 5.0,
              indicatorColor: ColorConst.appColor,
            ),
          ),
          Obx(
            () => bookMarkController.isTap.isFalse
                ? Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: InkWell(
                      onTap: () {
                        bookMarkController.isTap.value = true;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageConst.bookmark,
                            height: 92,
                            width: 70,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextWidget.openSansBoldText(
                              fontSize: 20.0,
                              text: "No Bookmarks",
                              color: ColorConst.textColor22),
                        ],
                      ),
                    ),
                )
                : ListView.builder(
                    itemCount: bookMarkController.bookMarkList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                bookMarkController.bookMarkList[index]['image'],
                                height: 55,
                                width: 96,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget.openSansSemiBoldText(
                                        color: ColorConst.textColor22,
                                        text: bookMarkController
                                            .bookMarkList[index]['text'],
                                        fontSize: 15.0),
                                    TextWidget.openSansRegularText(
                                        color: ColorConst.grey8f,
                                        text: bookMarkController
                                            .bookMarkList[index]['subText'],
                                        fontSize: 12.0),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(ImageConst.bookmark)
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorConst.greyE4,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
