import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../features/auth/Login/LoginPage.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
          )),
      home: LoginPage(),
    );
  }
}
