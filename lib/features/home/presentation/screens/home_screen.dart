import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/home_controller.dart';
import 'package:byjus/features/auth/presentation/controllers/user_info_controller.dart';
import 'package:byjus/features/home/presentation/controllers/get_subject_controller.dart';
import 'package:byjus/screen/Drawer/drawer_screen.dart';
import 'package:byjus/utils/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:byjus/injection_container.dart' as di;

import '../../../../core/app_state.dart';
import '../../../subject/presentation/screens/subject_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());
  final UserInfoController userInfoController = Get.find();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  initState() {
    super.initState();
   userInfoController.userInfo.value==null? userInfoController.getSavedLoginCredentials():null;
    // modalBottomSheetMenu(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: DrawerScreen(),
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        backgroundColor: ColorConst.white,
        elevation: 0,
        leading: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8, left: 15, right: 8),
          child: InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: SvgPicture.asset(ImageConst.drawerIcon)),
        ),
        title: Image.asset(
          ImageConst.byjusLogo,
          height: 32,
          width: 121,
        ),
        centerTitle: true,
        actions: [
          Obx(() {
            switch (userInfoController.apiState.value) {
              case ApiState.loading:
                return LoadingImageIndicator(); // Show loading indicator
              case ApiState.success:
                // Show your content using controller.userInfo.value
                return Padding(
                  padding: const EdgeInsets.only(right: 26.0),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: userInfoController
                          .userInfo.value!.data!.profileImage!,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,

                      placeholder: (context, url) => LoadingImageIndicator(),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error), // Widget to display on error
                    ),
                  ),
                );
              case ApiState.error:
                return Container();
              default:
                return Container();
            }
          }),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SubjectWidjet(homeController: homeController),
        ),
      ),
    );
  }
}

class SubjectWidjet extends StatelessWidget {
  SubjectWidjet({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;
  final SubjectController subjectController = Get.put(
    di.sl<SubjectController>(),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget.robotoMediumText(
            text: "All Subjects",
            color: ColorConst.textColor22,
            fontSize: 18.0),

        Obx(() {
          if (subjectController.apiState.value == ApiState.loading) {
            return LoadingIndicator();
          } else if (subjectController.apiState.value == ApiState.success) {
            var subjectList = subjectController.subjectData;
            return LayoutBuilder(
              builder: (context, constraints) => GridView.count(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                childAspectRatio:
                    MediaQuery.of(context).size.aspectRatio * 3 / 0.6,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 9,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  subjectList!.data!.length,
                  (index) => InkWell(
                    onTap: () {
                      Get.to(SubjectScreen(
                        image: subjectList.data![index].image,
                        id: int.parse(subjectList.data![index].id!),
                        name: subjectList.data![index].name!,
                      ));
                    },
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: subjectList.data![index].image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (context, url) =>
                              LoadingImageIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error), // Widget to display on error
                        ),
                        // Overlaying Content
                        Positioned(
                          left: 12,
                          top: 12,
                          bottom: 0,
                          child: TextWidget.openSansSemiBoldText(
                            text: subjectList.data![index].name,
                            color: ColorConst.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).toList(),
              ),
            );
          } else if (subjectController.apiState.value == ApiState.error) {
            return Text(' ${subjectController.errorMessage.value}');
          } else {
            return Text('Unknown error');
          }
        }),

        TextWidget.robotoMediumText(
            text: "Explore", color: ColorConst.textColor22, fontSize: 18.0),
        SizedBox(
          height: 10,
        ),
        CarouselSlider.builder(
          itemCount: homeController.exploreList.length,
          itemBuilder: (context, index, realIndex) => Image.asset(
            homeController.exploreList[index],
            height: 170,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          options: CarouselOptions(
            autoPlay: true,
            height: 170,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              homeController.selectedIndex.value = index;
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < homeController.exploreList.length; i++)
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Container(
                    height: 5,
                    width: i == homeController.selectedIndex.value ? 20 : 5,
                    decoration: BoxDecoration(
                        color: i == homeController.selectedIndex.value
                            ? ColorConst.textColor22
                            : ColorConst.greyC5,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 20,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //    commonColumn(
        //        text: "Nearest center",
        //        text2: "Find Nearest Center",
        //        subText: "",
        //        image: ImageConst.nearCenterImage,
        //        btnText: "Show me where",
        //        onTap: () {
        //          Get.to(FindNearestScreen());
        //        }),
        //     SizedBox(
        //       width: 20,
        //     ),
        //     commonColumn(
        //         onTap: () {
        //
        //         },
        //         text: "Talk to Counsellor ",
        //         text2: "Have questions?",
        //         subText:
        //             "To know about our courses,\nscholarships and more",
        //         image: ImageConst.haveQuestionImage,
        //         btnText: "Ask a counselor")
        //   ],
        // ),
        SizedBox(
          height: 20,
        ),
        TextWidget.robotoMediumText(
          text: "Share the app",
          color: ColorConst.textColor22,
          fontSize: 18.0,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 106,
          width: Get.width,
          decoration: BoxDecoration(
              color: ColorConst.whiteF2,
              borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.only(left: 21, top: 14),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.robotoMediumText(
                    text: "Share with friends",
                    color: ColorConst.textColor22,
                    fontSize: 15.0,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextWidget.openSansSemiBoldText(
                    text:
                        "Help your friends fall in love\nwith learning through Byju’s!",
                    color: ColorConst.grey8A,
                    fontSize: 11.0,
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(ImageConst.shareAppImage))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
