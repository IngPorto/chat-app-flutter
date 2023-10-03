import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.teal,
  Colors.pink,
  Colors.orange,
  Colors.yellow
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorTheme.length,
            'Color must be between 0 and ${_colorTheme.length - 1}');

  // Tiene que ser de tipo ThemeData porque es el tipo de dato que recibe el Material
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorTheme[selectedColor],
        brightness: Brightness.dark);
  }

  get customColor => _customColor;
}
