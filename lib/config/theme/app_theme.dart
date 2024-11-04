
import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colortheme = [
  _customColor,
  Colors.red,
  Colors.yellow,
  Colors.teal,
  Colors.greenAccent,
  Colors.cyan,
  Colors.orangeAccent,

];

class AppTheme {
  final int selecTtedColor;

  AppTheme({this.selecTtedColor = 0}) : 
    assert(selecTtedColor >=0 && selecTtedColor <= _colortheme.length - 1,
    'colorss must be between 0 and ${_colortheme.length}' );


ThemeData theme() {
  return ThemeData(useMaterial3: true, colorSchemeSeed: _colortheme[selecTtedColor]);
    
}
  
}