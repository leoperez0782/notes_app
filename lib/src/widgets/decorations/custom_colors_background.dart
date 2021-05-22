import 'dart:math';

import 'package:flutter/material.dart';

class CustomColorBackgrounds {
  Color getCustomColor() {
    List<Color> whiteThemeColors = [
      Color(0xffF8BBD0),
      Color(0xffE1BEE7),
      Color(0xffC5CAE9),
      Color(0xff69F0AE),
      Color(0xffFFCCBC),
      Color(0xffFFE57F),
      Color(0xffCFD8DC),
    ];
    List<Color> darkThemeColors = [
      Color(0xff880E4F),
      Color(0xff512DA8),
      Color(0xff004D40),
      Color(0xff2E7D32),
      Color(0xff4E342E),
      Color(0xff424242),
      Color(0xffBF360C),
    ];
    int max = darkThemeColors.length - 1;
    int index = Random().nextInt(max);
    if (ThemeMode.system == ThemeMode.light) {
      print('Thema light');
    }
    if (ThemeMode.system == ThemeMode.dark) {
      print('Dark thema');
    }
    // return ThemeMode.system == ThemeMode.light
    //     ? whiteThemeColors.elementAt(index)
    //     : darkThemeColors.elementAt(index);
    return whiteThemeColors.elementAt(index);
  }
}
