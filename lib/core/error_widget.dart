import 'package:flutter/material.dart';

class ErrorsWidget extends StatelessWidget {
  // final String msg;
  final VoidCallback? onRetryPressed;

  const ErrorsWidget(
      {Key? key,
      //  required this.msg,
      this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.warning_amber_rounded,
            // color: AppColors.primaryColor,
            size: 120,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const Text(
            'No Data',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        // Container(
        //     margin: const EdgeInsets.symmetric(vertical: 5),
        //     child: Text(
        //       'Try Again',
        //       style: const TextStyle(
        //           color: Colors.grey,
        //           fontSize: 18,
        //           fontWeight: FontWeight.w500),
        //     )),
        // Container(
        //     width:MediaQuery.of(context).size.width* 0.55,
        //     margin: const EdgeInsets.symmetric(vertical: 15),
        //     child: DefaultButton(
        //         btnLbl:
        //             AppLocalizations.of(context)!.translate('reload_screen')!,
        //         onPressed: () {
        //           if (onRetryPressed != null) {
        //             onRetryPressed!();
        //           }
        //         }))
      ],
    );
  }
}
