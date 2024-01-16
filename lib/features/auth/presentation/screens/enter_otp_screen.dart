import 'package:byjus/constants/colors.dart';
import 'package:byjus/constants/textWidget.dart';
import 'package:byjus/features/auth/presentation/controllers/login_controller.dart';
import 'package:byjus/features/auth/presentation/controllers/otp_verify_controller.dart';
import 'package:byjus/utils/default_text_form_field/validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:byjus/injection_container.dart' as di;

class EnterOtpScreen extends StatefulWidget {
  EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> with ValidationMixin {
  final OtpVerifyController apiController =
      Get.put(di.sl<OtpVerifyController>());
  final LoginController loginController = Get.find();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorConst.textColor22,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextWidget.openSansBoldText(
                  text: "Enter OTP",
                  color: ColorConst.textColor22,
                  fontSize: 24.0),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextWidget.openSansRegularText(
                    text:
                        "Put the OTP number below sent to your number +91 12345 67890",
                    textAlign: TextAlign.center,
                    color: ColorConst.grey64,
                    fontSize: 14.0),
              ),
              SizedBox(
                height: 27,
              ),
              Pinput(
                controller: pinController,
                validator: validateOtp,
                // onClipboardFound: (value) {
                //   debugPrint('onClipboardFound: $value');
                //   pinController.setText(value);
                // },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                // onCompleted: (pin) {
                //   debugPrint('onCompleted: $pin');
                // },
                // onChanged: (value) {
                //   debugPrint('onChanged: $value');
                // },
                length: 4,
                defaultPinTheme: PinTheme(
                    height: 50,
                    width: 50,
                    textStyle: TextStyle(
                        color: ColorConst.textColor22,
                        fontFamily: openSansSemiBoldFont,
                        fontSize: 28),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConst.appColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Resend OTP 15 sec",
                    style: TextStyle(
                        color: ColorConst.appColor,
                        fontSize: 14,
                        fontFamily: openSansRegularFont,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Get OTP on call",
                    style: TextStyle(
                        color: ColorConst.appColor,
                        fontSize: 14,
                        fontFamily: openSansRegularFont,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              SizedBox(
                height: 130,
              ),
              Obx(
                () => apiController.isLoading.value
                    ? CircularProgressIndicator()
                    : MaterialButton(
                        onPressed: () {
                          focusNode.unfocus();

                          if (formKey.currentState!.validate()) {
                            apiController.otpVerify(
                              context: context,
                              userId:
                                  loginController.authenticatedUser!.data!.id!,
                              otpCode: pinController.value.text,
                            );
                          }
                          // Get.to(FillDetailsScreen());
                        },
                        height: 47,
                        minWidth: 170,
                        child: TextWidget.openSansBoldText(
                            text: "Continue",
                            color: ColorConst.white,
                            fontSize: 18.0),
                        color: ColorConst.appColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28)),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
