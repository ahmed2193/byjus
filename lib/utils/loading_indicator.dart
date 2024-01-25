import 'package:byjus/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SpinKitCircle(
                color: ColorConst.appColor,
                size: 50.0,
              ),
    );
  }
}
class LoadingImageIndicator extends StatelessWidget {
  const LoadingImageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
                          child: SpinKitDoubleBounce(
                            color: ColorConst.appColor,
                            size: 20.0,
                          ),
                        );
  }
}
