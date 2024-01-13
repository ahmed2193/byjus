// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_phoenix/flutter_phoenix.dart';

// import '../../../../config/locale/app_localizations.dart';
// import '../features/landing/pre/cubit/locale_cubit.dart';
// import '../features/onboarding/presentation/widget/rounded_button.dart';
// import '../res/app_colors.dart';

// class ChangeAppLanguage extends StatefulWidget {
//   const ChangeAppLanguage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ChangeAppLanguage> createState() => _ChangeAppLanguageState();
// }

// class _ChangeAppLanguageState extends State<ChangeAppLanguage> {
//   int _radioSelected = 1;

//   _reloadAppFromScratch() {
//     Navigator.pop(context);
//     Phoenix.rebirth(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         // height: context.height * 0.37,
//         child: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           LayoutBuilder(builder: (context, conatraints) {
//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   width: conatraints.maxWidth * 0.45,
//                 ),
//                 SizedBox(
//                   width: conatraints.maxWidth * 0.26,
//                   child: Text(
//                     AppLocalizations.of(context)!.translate('language'),
//                     style: Theme.of(context).appBarTheme.titleTextStyle,
//                   ),
//                 ),
//                 const Spacer(),
//               ],
//             );
//           }),
//           const SizedBox(
//             height: 20,
//           ),
//           ListTile(
//             title: Text(
//               AppLocalizations.of(context)!.translate('arabic'),
//             ),
//             leading: Radio(
//               value: 1,
//               groupValue: _radioSelected,
//               onChanged: (int? value) {
//                 setState(() {
//                   _radioSelected = value!;
//                 });
//               },
//             ),
//           ),
//           const Divider(
//             color: AppColors.appBarBackground,
//           ),
//           ListTile(
//             title: Text(
//               AppLocalizations.of(context)!.translate('english'),
//             ),
//             leading: Radio(
//               focusColor: AppColors.primaryColor,
//               fillColor: MaterialStateColor.resolveWith(
//                   (states) => AppColors.primaryColor),
//               value: 2,
//               groupValue: _radioSelected,
//               onChanged: (int? value) {
//                 setState(() {
//                   _radioSelected = value!;
//                 });
//               },
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           ReusedRoundedButton(
//             onPressed: () {
//               if (_radioSelected == 1 &&
//                   AppLocalizations.of(context)!.isEnLocale) {
              
//                 BlocProvider.of<LocaleCubit>(context).toArabic();
//                 _reloadAppFromScratch();
//               } else if (_radioSelected == 2 &&
//                   !AppLocalizations.of(context)!.isEnLocale) {
//                 BlocProvider.of<LocaleCubit>(context).toEnglish();
//                 _reloadAppFromScratch();
//               } else {
//                 Navigator.pop(context);
//               }
//             },
//             text: 'Svae',
//           ),
//         ],
//       ),
//     ));
//   }
// }
