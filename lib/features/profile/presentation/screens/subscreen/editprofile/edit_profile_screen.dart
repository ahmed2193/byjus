import 'dart:developer';
import 'dart:io';

import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/controller/image_picker.dart';
import 'package:byjus/core/app_state.dart';
import 'package:byjus/features/profile/presentation/screens/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../utils/loading_indicator.dart';
import '../../../../../auth/presentation/controllers/user_info_controller.dart';
import '../../../controllers/edit_profile_controller.dart';
import '../../profile_utills.dart';
import '../addPhoto/add_photo_screen.dart';
import '../selectcity/select_city_screen.dart';

import 'package:byjus/injection_container.dart' as di;

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserInfoController userInfoController = Get.find();
  final EditProfileController apiController =
      Get.put(di.sl<EditProfileController>());
  final ProfileImageController _profileImageController =
      Get.put(ProfileImageController());

  @override
  void initState() {
    super.initState();
  }

  DateTime currentDate = DateTime.now();

  final genderList = ["Male", 'FeMale'];

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Future<void> selectDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: currentDate,
          firstDate: DateTime(2015),
          lastDate: DateTime(2050));
      if (pickedDate != null && pickedDate != currentDate) {
        setState(() {
          currentDate = pickedDate;
          apiController.dateController.text = currentDate.toString();
        });
      }
    }

    return Scaffold(
        backgroundColor: ColorConst.white,
        body: Obx(
          () => Stack(
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
                  child: Obx(() {
                    switch (userInfoController.apiState.value) {
                      case ApiState.loading:
                        return LoadingImageIndicator(); // Show loading indicator
                      case ApiState.success:
                        var userInfo = userInfoController.userInfo.value!.data!;
                        // nameController.text = userInfo.username!;

                        // genderController.text = userInfo.schoolName!;

                        // mobileController.text =
                        //     '${userInfo.countryCode!}-${userInfo.phone!}';

                        // emailController.text = userInfo.email!;

                        // addressController.text = userInfo.address!;

                        // dateController.text = userInfo.birthDate!;
                        log(userInfo.id!);
                        log(userInfo.token!);
                        // userInfo.gender!.contains('male')
                        //     ? selectedIndex = 0
                        //     : selectedIndex = 1;
                        return Column(
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
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_sharp,
                                      color: ColorConst.textColor22,
                                    )),
                                MaterialButton(
                                  onPressed: () {
                                    // Get.to(ProfileScreen());
                                    apiController.editProfile(
                                        context: context,
                                        profileImage: _profileImageController
                                                .profileImageUrl
                                                .value
                                                .isNotEmpty
                                            ? File(_profileImageController
                                                .profileImageUrl.value)
                                            : null);
                                  },
                                  height: 30,
                                  minWidth: 77,
                                  color: ColorConst.appColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: TextWidget.openSansMediumText(
                                      color: ColorConst.white,
                                      fontSize: 13.0,
                                      text: "Save"),
                                ),
                              ],
                            ),
                            Center(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Obx(
                                    () => _profileImageController
                                            .profileImageUrl.value.isNotEmpty
                                        ? ClipOval(
                                            child: Image.file(
                                              File(_profileImageController
                                                  .profileImageUrl.value),
                                              height: 80,
                                              width: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : ClipOval(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  apiController.profileImage!,
                                              fit: BoxFit.cover,
                                              height: 88,
                                              width: 88,

                                              placeholder: (context, url) =>
                                                  LoadingImageIndicator(),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Icon(Icons
                                                      .error), // Widget to display on error
                                            ),
                                          ),
                                  ),

                                  // Image.asset(
                                  //   ImageConst.drawerProfileImage,
                                  //   height: 88,
                                  //   width: 88,
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: InkWell(
                                      onTap: () async {
                                        await _profileImageController
                                            .pickImage();
                                        // Get.bottomSheet(
                                        //   AddPhotoView(),
                                        //   shape: RoundedRectangleBorder(
                                        //       borderRadius: BorderRadius.only(
                                        //           topLeft: Radius.circular(40),
                                        //           topRight: Radius.circular(40))),
                                        //   isScrollControlled: true,
                                        // );
                                      },
                                      child: Container(
                                        height: 22,
                                        width: 22,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: ColorConst.appColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.edit,
                                            color: ColorConst.white, size: 15),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );

                      case ApiState.error:
                        return Container();
                      default:
                        return Container();
                    }
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 230.0),
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
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            commonProfileColumn(
                                text: "Name",
                                hintText: "+91-1234567890",
                                controller: apiController.nameController),
                            commonProfileColumn(
                                text: "GenderCourse",
                                hintText: "Gender",
                                controller: apiController.genderController,
                                widget: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: ColorConst.greyC5,
                                )),
                            commonProfileColumn(
                              text: "Name",
                              hintText: "+91-1234567890",
                            ),
                            commonProfileColumn(
                                text: "Email ID",
                                hintText: "Enter Your email",
                                controller: apiController.emailController),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                commonProfileColumn(
                                    text: "Address",
                                    hintText: "Address",
                                    controller:
                                        apiController.addressController),
                                Positioned(
                                  bottom: -10,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(SelectYourCityScreen());
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            ImageConst.locationIcon),
                                        TextWidget.openSansRegularText(
                                            text: " Detect Location",
                                            color: ColorConst.appColor,
                                            fontSize: 12.0)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GenderSelection(),
                            SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                selectDate(context);
                              },
                              child: commonProfileColumn(
                                  text: "Date of Birth",
                                  hintText: "Enter Your email",
                                  controller: apiController.dateController,
                                  enable: false,
                                  widget: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                        ImageConst.calenderIcon),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          apiController.isLoading.value
                            
                    ? Container(
                        color: Colors.white.withOpacity(0.8),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const LoadingIndicator(),
                      )
                    : const SizedBox()
          
          
            ],
          ),
        ));
  }
}

class GenderSelection extends StatefulWidget {
  GenderSelection({
    super.key,
  });

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  final EditProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget.robotoMediumText(
              color: ColorConst.textColor22,
              fontSize: 14.0,
              text: 'Select your gender:'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(() => RadioListTile(
                      activeColor: ColorConst.appColor,
                      title: TextWidget.openSansBoldText(
                        fontSize: 16.0,
                        color: ColorConst.textColor22,
                        text: 'Male',
                      ),
                      value: 'Male',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        controller.setGender(value!);
                      },
                    )),
              ),
              Expanded(
                child: Obx(() => RadioListTile(
                      activeColor: ColorConst.appColor,
                      title: TextWidget.openSansBoldText(
                        fontSize: 16.0,
                        color: ColorConst.textColor22,
                        text: 'Female',
                      ),
                      value: 'Female',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        controller.setGender(value!);
                      },
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
