import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/physics_controller.dart';
import 'package:byjus/features/subject/data/models/chpter_view_model.dart';
import 'package:byjus/features/subject/presentation/screens/subScreen/electrictCharges/idea_charge_screen.dart';
import 'package:byjus/features/subject/presentation/screens/subScreen/video/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../../core/app_state.dart';
import '../../../../../../../utils/loading_indicator.dart';
import '../../../../controllers/get_chapter_view_controller.dart';
import 'package:byjus/injection_container.dart' as di;

class LearnView extends StatefulWidget {
  int? chaptrId;
  LearnView({this.chaptrId});

  @override
  State<LearnView> createState() => _LearnViewState();
}

class _LearnViewState extends State<LearnView> {
  final PhysicsController physicsController = Get.find();
  final ChapterViewController controller = Get.put(
    di.sl<ChapterViewController>(),
  );
  fetchData() {
    controller.fetchData(
      
      // id: widget.chaptrId!
      id: 1
    
    
    );
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                TextWidget.robotoMediumText(
                    color: ColorConst.textColor22,
                    fontSize: 20.0,
                    text: "Personalised journey"),
                Spacer(),
                Text(
                  "35 Journeys",
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorConst.grey64,
                      fontFamily: robotoMediumFont,
                      fontWeight: FontWeight.w400),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: ColorConst.grey64,
                )
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24),
            itemCount: physicsController.chargesList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConst.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1), blurRadius: 12)
                    ]),
                child: Row(
                  children: [
                    Image.asset(
                      physicsController.chargesList[index]['image'],
                      height: 86,
                      width: 86,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: TextWidget.openSansSemiBoldText(
                          color: ColorConst.textColor22,
                          text: physicsController.chargesList[index]['text'],
                          fontSize: 15.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                          onTap: () {
                            Get.to(IdeaChargeScreen());
                          },
                          child: SvgPicture.asset(ImageConst.arrowForwardIcon)),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Obx(() {
            if (controller.apiState.value == ApiState.loading) {
              return LoadingIndicator();
            } else if (controller.apiState.value == ApiState.success) {
              var chapterViewList = controller.chapterData!.videos;
              return SizedBox(
                height: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VideoHeader(videoLength: chapterViewList!.length),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 24, top: 20),
                        itemCount: chapterViewList.length,

                        // physicsController.videoList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(VideoScreen(
                                videoData: chapterViewList[index],
                              ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                      child: Image.network(
                                        chapterViewList[index].image!,
                                        height: 142,
                                        width: 259,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Icon(
                                        Icons.play_circle_fill_outlined,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    )
                                  ],
                                ),
                                TextWidget.openSansSemiBoldText(
                                    color: ColorConst.textColor22,
                                    fontSize: 15.0,
                                    text: chapterViewList[index].title!

                                    // physicsController.videoList[index]["text"]
                                    )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (controller.apiState.value == ApiState.error) {
              return Column(
                children: [
                  VideoHeader(videoLength: 0),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: TextWidget.openSansBoldText(
                        text: controller.errorMessage.value,
                        color: ColorConst.grey64,
                        fontSize: 17.0),
                  ),
                ],
              );
            } else {
              return Text('Unknown error');
            }
          }),
        ],
      ),
    );
  }
}

class VideoHeader extends StatelessWidget {
  const VideoHeader({
    super.key,
    required this.videoLength,
  });

  final int? videoLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          TextWidget.robotoMediumText(
              color: ColorConst.textColor22,
              fontSize: 20.0,
              text: "Video Lessons"),
          Spacer(),
          Text(
            "${videoLength} Videos",
            style: TextStyle(
                fontSize: 14,
                color: ColorConst.grey64,
                fontFamily: robotoMediumFont,
                fontWeight: FontWeight.w400),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: ColorConst.grey64,
          ),
        ],
      ),
    );
  }
}
