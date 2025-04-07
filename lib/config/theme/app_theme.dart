import 'package:flutter/material.dart';

const _customColor = Color(0xFF49149F); // Custom color (green)

const List<Color> _colorsTheme = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
    : assert(
        selectedColor >= 0 && selectedColor <= _colorsTheme.length - 1,
        'Color debe ser entre 0 y ${_colorsTheme.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorsTheme[selectedColor]);
  }
}
