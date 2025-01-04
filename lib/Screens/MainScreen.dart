import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_shop/Screens/HomeScreen.dart';
import 'package:ecommerce_shop/Screens/SignUp.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Techno Shop',
      theme: ThemeData(
          primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      home:SignUpScreen(),
    );
  }
}
