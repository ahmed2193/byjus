import 'dart:developer';

import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/app_state.dart';
import '../../../../../../utils/loading_indicator.dart';
import '../../../../data/models/chpter_view_model.dart';
import '../../../controllers/get_chapter_view_controller.dart';
import 'package:byjus/injection_container.dart' as di;

class VideoScreen extends StatefulWidget {
  VideoScreen({this.videoData});

  Videos? videoData;
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  // final ChapterViewController controller = Get.put(
  //   di.sl<ChapterViewController>(),
  // );
  // fetchData() {
  //   controller
  //       .fetchData(id: 1

  //           // widget.id!

  //           )
  //       .then((_) {
  //     controller.chapterData != null ? initializePlayer() : null;
  //   });
  // }

  final List<Map> videoList = [
    {
      "image": ImageConst.videoImage1,
      "text": "An Introduction to...",
      "subText": "02:30 mins",
      "icon": ImageConst.checkIcon
    },
    {
      "image": ImageConst.videoImage2,
      "text": "Measuring Length: A...",
      "subText": "12:40 mins",
      "icon": ImageConst.playCircle
    },
    {
      "image": ImageConst.videoImage3,
      "text": "Standard Units",
      "subText": "24:12 mins",
      "icon": ""
    },
    {
      "image": ImageConst.videoImage4,
      "text": "Motion and Its Types",
      "subText": "02:30 mins",
      "icon": ""
    },
  ];
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int? bufferDelay;
  double aspectRatio = 16 / 9; // Default aspect ratio
  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
        //  'https://edu-network.in/assets/uploads/chapter/1706158754.mp4'
        widget.videoData!.video!));
    await Future.wait([
      _videoPlayerController.initialize(),
    ]);

    if (_videoPlayerController.value.isInitialized) {
      _createChewieController();
      setState(() {});
    }
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      aspectRatio: aspectRatio,
    );
  }

  @override
  void initState() {
    super.initState();
    // fetchData();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _calculateAspectRatio() {
    if (_videoPlayerController.value.isInitialized &&
        _chewieController != null &&
        _chewieController!.videoPlayerController.value.isInitialized) {
      Size originalSize = _videoPlayerController.value.size;
      double newAspectRatio = originalSize.width / originalSize.height;

      if (newAspectRatio != aspectRatio) {
        setState(() {
          aspectRatio = newAspectRatio;
          _chewieController = _chewieController!.copyWith(
            aspectRatio: aspectRatio,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 280,
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading'),
                      ],
                    ),
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: ColorConst.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 290.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorConst.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextWidget.openSansRegularText(
                            color: ColorConst.appColor,
                            text: widget.videoData!.title,
                            fontSize: 13.0),
                        Spacer(),
                        Icon(
                          Icons.share_outlined,
                          color: ColorConst.grey2C,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.bookmark_border,
                          color: ColorConst.grey2C,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextWidget.robotoMediumText(
                        fontSize: 20.0,
                        text: widget.videoData!.description,
                        color: ColorConst.textColor22),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageConst.clockIcon,
                          height: 10,
                          width: 10,
                          color: ColorConst.grey8f,
                        ),
                        TextWidget.openSansRegularText(
                            color: ColorConst.grey8f,
                            text: " 3h 30mins",
                            fontSize: 12.0),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    TextWidget.robotoMediumText(
                        text: "Videos",
                        color: ColorConst.appColor,
                        fontSize: 18.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: videoList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: [
                              Image.asset(
                                videoList[index]["image"],
                                height: 55,
                                width: 96,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget.openSansSemiBoldText(
                                      text: videoList[index]["text"],
                                      color: ColorConst.textColor22,
                                      fontSize: 15.0),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageConst.clockIcon,
                                        height: 10,
                                        width: 10,
                                        color: ColorConst.grey8f,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      TextWidget.openSansRegularText(
                                          color: ColorConst.grey8f,
                                          text: videoList[index]["subText"],
                                          fontSize: 12.0),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              videoList[index]['icon'] == ""
                                  ? Container()
                                  : SvgPicture.asset(videoList[index]['icon'])
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
