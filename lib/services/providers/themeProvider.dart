import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDark => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}

class TBDTheme {
  static ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 3.0,
      centerTitle: true,
      backgroundColor: Color(0xff46cab8),
      titleTextStyle: TextStyle(
        color: Color(0xfffffbfa),
        fontSize: 25.0,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xff46cab8),
    // scaffoldBackgroundColor: const Color(0xff8bd7d2),
  );
}
