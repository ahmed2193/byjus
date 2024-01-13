// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../preferences/preferences_manager.dart';
// import 'app_localization.dart';

// class LocaleCubit extends Cubit<Locale> {
//   LocaleCubit() : super(const Locale(codeEn)) {
//     getDefaultLocale();
//   }

//   PreferencesManager? preferenceManager;

//   void changeLocale(LocaleApp selectedLanguage) async {
//     final defaultLanguageCode = await preferenceManager!.getLocale();

//     if (selectedLanguage == LocaleApp.ar && defaultLanguageCode != codeAr) {
//       await preferenceManager!.setLocale(codeAr);
//       emit(const Locale(codeAr));
//     } else if (selectedLanguage == LocaleApp.en &&
//         defaultLanguageCode != codeEn) {
//       await preferenceManager!.setLocale(codeEn);
//       emit(const Locale(codeEn));
//     }
//   }

//   void getDefaultLocale() async {
//     final defaultLanguageCode = await preferenceManager!.getLocale();
//     Locale locale;
//     if (defaultLanguageCode == null) {
//       locale = Locale(defaultSystemLocale);
//     } else {
//       locale = Locale(defaultLanguageCode);
//     }
//     emit(locale);
//   }

//   String get defaultSystemLocale => Platform.localeName.substring(0, 2);
// }

// enum LocaleApp { en, ar, }
