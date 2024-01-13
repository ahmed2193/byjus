import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/screen/profile/profile_utills.dart';
import 'package:byjus/screen/profile/subscreen/addPhoto/add_photo_screen.dart';
import 'package:byjus/screen/profile/subscreen/selectcity/select_city_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController(text: "John Doe");

  final TextEditingController genderController = TextEditingController(text: "JEE & NEET (11th)");

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController emailController = TextEditingController(text: "Johndoe123@gmail.com");

  final TextEditingController addressController = TextEditingController(text: "Surat, Gujarat");

  final TextEditingController dateController = TextEditingController(text: "DD/MM/YY");

   DateTime currentDate = DateTime.now();

   final genderList = ["Male",'FeMale'];

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
          dateController.text = currentDate.toString();
        });
      }
    }


    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Stack(
        children: [
          Container(
            height: 250,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConst.bgImage), fit: BoxFit.fill)),
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
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_sharp,color: ColorConst.textColor22,)
                      ),
                      MaterialButton(
                        onPressed: (){
                          // Get.to(ProfileScreen());
                        },
                        height: 30,
                        minWidth: 77,
                        color: ColorConst.appColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: TextWidget.openSansMediumText(
                            color: ColorConst.white,
                            fontSize: 13.0,
                            text: "Save"
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image.asset(ImageConst.drawerProfileImage,height: 88,width: 88,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                            onTap: (){
                              Get.bottomSheet(
                                AddPhotoView(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                                ),
                                isScrollControlled: true,
                              );
                            },
                            child: Container(
                              height: 22,
                              width: 22,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorConst.appColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.edit,color: ColorConst.white,size: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
                  child:  SingleChildScrollView(
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
                              controller: nameController
                          ),
                          commonProfileColumn(
                              text: "GenderCourse",
                              hintText: "Gender",
                              controller: genderController,
                              widget: Icon(Icons.keyboard_arrow_down_outlined,color: ColorConst.greyC5,)
                          ),
                          commonProfileColumn(
                            text: "Name",
                            hintText: "+91-1234567890",
                          ),
                          commonProfileColumn(
                              text: "Email ID",
                              hintText: "Enter Your email",
                              controller: emailController
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              commonProfileColumn(
                                  text: "Address",
                                  hintText: "Address",
                                  controller: addressController
                              ),
                              Positioned(
                                bottom: -10,
                                child: InkWell(
                                  onTap: (){
                                    Get.to(SelectYourCityScreen());
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(ImageConst.locationIcon),
                                      TextWidget.openSansRegularText(
                                          text: " Detect Location",
                                          color: ColorConst.appColor,
                                          fontSize: 12.0
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextWidget.robotoMediumText(
                              color: ColorConst.textColor22,
                              fontSize: 14.0,
                              text: "Date of Birth"
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 20,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: genderList.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 84.0),
                                child: InkWell(
                                  onTap: (){
                                    setState((){
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: selectedIndex==index?ColorConst.appColor:ColorConst.greyA6),
                                            shape: BoxShape.circle
                                        ),
                                        alignment: Alignment.center,
                                        child: selectedIndex==index?Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              color: ColorConst.appColor,
                                              shape: BoxShape.circle
                                          ),
                                        ):SizedBox.shrink(),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      TextWidget.openSansBoldText(
                                          fontSize: 16.0,
                                          color: ColorConst.textColor22,
                                          text: genderList[index]
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: (){
                              selectDate(context);
                            },
                            child: commonProfileColumn(
                                text: "Date of Birth",
                                hintText: "Enter Your email",
                                controller:dateController,
                                enable: false,
                                widget: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(ImageConst.calenderIcon),
                                )
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
              ),
            ),
          )
        ],
      )

      /*SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                 child: Stack(
                   alignment: Alignment.bottomRight,
                   children: [
                     Image.asset(ImageConst.drawerProfileImage,height: 88,width: 88,),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 8.0),
                       child: InkWell(
                         onTap: (){
                           Get.bottomSheet(
                             AddPhotoView(),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                             ),
                             isScrollControlled: true,
                           );
                         },
                         child: Container(
                           height: 22,
                           width: 22,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             color: ColorConst.appColor,
                             shape: BoxShape.circle,
                           ),
                           child: Icon(Icons.edit,color: ColorConst.white,size: 15),
                         ),
                       ),
                     )
                   ],
                 ),
               ),
               SizedBox(
                 height: 60,
               ),
                commonProfileColumn(
                  text: "Name",
                  hintText: "+91-1234567890",
                  controller: nameController
                ),
              commonProfileColumn(
                  text: "GenderCourse",
                  hintText: "Gender",
                  controller: genderController,
                widget: Icon(Icons.keyboard_arrow_down_outlined,color: ColorConst.greyC5,)
              ),
              commonProfileColumn(
                  text: "Name",
                  hintText: "+91-1234567890",
              ),
              commonProfileColumn(
                  text: "Email ID",
                  hintText: "Enter Your email",
                  controller: emailController
              ),
             Stack(
               clipBehavior: Clip.none,
               children: [
                 commonProfileColumn(
                     text: "Address",
                     hintText: "Address",
                     controller: addressController
                 ),
                 Positioned(
                   bottom: -10,
                   child: InkWell(
                     onTap: (){
                       Get.to(SelectYourCityScreen());
                     },
                     child: Row(
                       children: [
                         SvgPicture.asset(ImageConst.locationIcon),
                         TextWidget.openSansRegularText(
                             text: " Detect Location",
                             color: ColorConst.appColor,
                             fontSize: 12.0
                         )
                       ],
                     ),
                   ),
                 )
               ],
             ),
              SizedBox(
                height: 20,
              ),
              TextWidget.robotoMediumText(
                  color: ColorConst.textColor22,
                  fontSize: 14.0,
                  text: "Date of Birth"
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 20,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: genderList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 84.0),
                      child: InkWell(
                        onTap: (){
                          setState((){
                            selectedIndex = index;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color: selectedIndex==index?ColorConst.appColor:ColorConst.greyA6),
                                shape: BoxShape.circle
                              ),
                              alignment: Alignment.center,
                              child: selectedIndex==index?Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: ColorConst.appColor,
                                  shape: BoxShape.circle
                                ),
                              ):SizedBox.shrink(),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            TextWidget.openSansBoldText(
                              fontSize: 16.0,
                              color: ColorConst.textColor22,
                              text: genderList[index]
                            )
                          ],
                        ),
                      ),
                    ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  selectDate(context);
                },
                child: commonProfileColumn(
                    text: "Date of Birth",
                    hintText: "Enter Your email",
                    controller:dateController,
                    enable: false,
                    widget: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(ImageConst.calenderIcon),
                    )
                ),
              )

            ],
          ),
        ),
      ),*/
    );
  }
}
