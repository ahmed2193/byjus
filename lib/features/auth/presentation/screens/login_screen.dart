import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/images.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/features/auth/presentation/controllers/login_controller.dart';

import 'package:byjus/utils/default_text_form_field/validation_mixin.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:byjus/injection_container.dart' as di;

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final LoginController apiController = Get.put(di.sl<LoginController>());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Center(child: SvgPicture.asset(ImageConst.appLogo2)),
              SizedBox(
                height: 40,
              ),
              TextWidget.openSansBoldText(
                  color: ColorConst.textColor22,
                  fontSize: 26.0,
                  text: "Enter Phone Number"),
              SizedBox(
                height: 10,
              ),
              ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  side: BorderSide(color: ColorConst.greyE4, width: 1),
                )),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: ColorConst.greyE4, width: 1),
                      right: BorderSide(color: ColorConst.greyE4, width: 1),
                      top: BorderSide(color: ColorConst.greyE4, width: 1),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: CountryCodePicker(
                            onChanged: apiController.onCountryCodeChanged,
                            initialSelection: 'IN',
                            favorite: ['+91', 'IN'],
                            textStyle: TextStyle(
                              // fontFamily: TextFontFamily.AVENIR_LT_PRO_BOOK,
                              fontSize: 16,
                              color: ColorConst.grey64,
                            ),
                            showCountryOnly: true,
                            showFlag: true,
                            showOnlyCountryWhenClosed: true,
                            alignLeft: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: SvgPicture.asset(ImageConst.arrowForward),
                      ),
                    ],
                  ),
                ),
              ),
              TextFormField(
                controller: _phoneController,
                validator: validatePhoneNO,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                    color: ColorConst.textColor22,
                    fontSize: 14,
                    fontFamily: openSansSemiBoldFont),
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () {
                          return TextWidget.openSansSemiBoldText(
                              text: apiController.selectedCountryCode.value,
                              color: ColorConst.textColor22,
                              fontSize: 15.0);
                        },
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Container(
                        height: 55,
                        width: 1,
                        color: ColorConst.greyE4,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                    ],
                  ),
                  hintText: "Enter phone number",
                  hintStyle: TextStyle(
                      fontFamily: openSansRegularFont,
                      fontSize: 14,
                      color: ColorConst.grey64),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                      borderSide:
                          BorderSide(color: ColorConst.greyE4, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                      borderSide:
                          BorderSide(color: ColorConst.greyE4, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                      borderSide:
                          BorderSide(color: ColorConst.greyE4, width: 1)),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextWidget.openSansRegularText(
                  color: ColorConst.textColor22,
                  fontSize: 14.0,
                  text:
                      "We’ll Send you a code by SMS to confirm your phone number."),
              SizedBox(
                height: 32,
              ),
              Obx(() {
                return Center(
                  child: apiController.isLoading.value
                      ? CircularProgressIndicator()
                      : MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              apiController.login(
                                context: context,
                                countryCode:
                                    apiController.selectedCountryCode.value,
                                deviceToken: '123sahdsahd',
                                phone: _phoneController.value.text,
                                dviceType: 'A',
                                signUpType: 'S',
                              );
                            }
                          },
                          height: 47,
                          minWidth: 170,
                          child: TextWidget.openSansBoldText(
                              text: "Send OTP",
                              color: ColorConst.white,
                              fontSize: 18.0),
                          color: ColorConst.appColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
