import 'package:flutter/material.dart';
import 'package:website/globals/gothic_text_theme.dart';
import 'package:website/globals/settings.dart';

import 'home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    settings.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuasiStellar',
      theme: ThemeData(
          primaryColor: Colors.black,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          textTheme: blackGothic,
          fontFamily: 'Century Gothic'),
      darkTheme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          textTheme: whiteGothic,
          fontFamily: 'Century Gothic'),
      themeMode: settings.themeMode,
      home: const HomePage(title: 'QuasiStellar'),
    );
  }
}
