import 'package:flutter/material.dart';

final settings = Settings();

class Settings with ChangeNotifier {
  var themeMode = ThemeMode.dark;

  void switchTheme() {
    themeMode = themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }
}
