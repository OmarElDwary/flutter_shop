import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/MainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      child: MainScreen()));
}
