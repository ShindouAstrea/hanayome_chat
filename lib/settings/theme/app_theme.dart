import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 19, 116, 129);
const List<Color> _colorthemes = [
  _customColor,
  Colors.cyan,
  Colors.amber,
  Colors.orange,
  Colors.redAccent,
  Colors.deepPurple
];

class AppTheme {

  static const Color mainItsuki = Colors.redAccent;
   static const Color primary = menuBackground;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);
  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen =  Color.fromARGB(255, 20, 148, 160);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: _colorthemes[4]);
  }
}
