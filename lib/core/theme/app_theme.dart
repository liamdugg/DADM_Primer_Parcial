import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false});

  ThemeData getTheme() {
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colors[selectedColor],
    );
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}

final List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
];

