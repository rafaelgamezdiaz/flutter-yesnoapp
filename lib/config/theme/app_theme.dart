import 'package:flutter/material.dart';


const Color _customColor = Color(0xff5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.indigo,
];


class AppTheme {

  final int selectedColor;
  final Brightness brightness;

  AppTheme({this.selectedColor = 0, this.brightness = Brightness.light})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length}');
 

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: brightness,
    );
  }
}