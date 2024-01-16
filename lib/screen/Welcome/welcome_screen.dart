import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int indexPage = 0;

  PageController pageController = PageController(initialPage: 0);

  final List<Map> welcomeList = [
    {
      "image": ImageConst.welcomeImage1,
      "text": "Experience the Two-Teacher advantage",
    },
    {
      "image": ImageConst.welcomeImage2,
      "text": "Watch Videos to Learn",
    },
    {
      "image": ImageConst.welcomeImage3,
      "text": "Build conceptual clarity",
    },
    {
      "image": ImageConst.welcomeImage4,
      "text": "Personalised for you",
    },
  ];

  @override
  Widget build(BuildContext context) {
    print(Get.height);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: welcomeList.length,
              onPageChanged: (i) {
                setState(
                  () {
                    indexPage = i;
                  },
                );
              },
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(top: Get.height / 12.26),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: index == 3 ? 71 : 48.0),
                        child: SvgPicture.asset(
                          welcomeList[index]["image"],
                        ),
                      ),
                    ),
                  )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget.openSansBoldText(
                    color: ColorConst.textColor22,
                    text: welcomeList[indexPage]["text"],
                    fontSize: 24.0,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: Get.height / 61.33,
                ),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextWidget.openSansRegularText(
                        color: ColorConst.textColor22,
                        text:
                            "Lorem Ipsum is simply dummy text of  the printing and typesetting industry.",
                        fontSize: 14.0,
                        textAlign: TextAlign.center)),
                SizedBox(
                  height: Get.height / 36.8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (position) => Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        width: indexPage == position ? 18 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: indexPage == position
                              ? ColorConst.textColor22
                              : ColorConst.greyC5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 15.33,
                ),
                TextWidget.openSansSemiBoldText(
                    text: "SKIP",
                    color: ColorConst.textColor22,
                    fontSize: 14.0),
                SizedBox(
                  height: Get.height / 32,
                ),
                Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConst.appColor, width: 1),
                      shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () {
                      if (indexPage != 3) {
                        pageController.nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      } else {
                        Get.to(LoginScreen());
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorConst.appColor, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_forward, color: ColorConst.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 18.4,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
