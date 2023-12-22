import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 19, 116, 129);
const List<Color> _colorthemes = [
  _customColor,
  Colors.cyan,
  Colors.amber,
  Colors.orange,
  Colors.red,
  Colors.deepPurple
];

class AppTheme {
  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: _colorthemes[4]);
  }
}
