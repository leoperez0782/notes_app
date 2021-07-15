import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomColorBackgrounds {
  List<Color> _whiteThemeColors = [
    Color(0xffF8BBD0),
    Color(0xffE1BEE7),
    Color(0xffC5CAE9),
    Color(0xff69F0AE),
    Color(0xffFFCCBC),
    Color(0xffFFE57F),
    Color(0xffCFD8DC),
    Color(0xff80DEEA),
    Color(0xffF0F4C3),
    Color(0xffFF8F00),
  ];

  List<Color> _darkThemeColors = [
    Color(0xff880E4F),
    Color(0xff512DA8),
    Color(0xff004D40),
    Color(0xff2E7D32),
    Color(0xff4E342E),
    Color(0xff424242),
    Color(0xffBF360C),
    Color(0xff00796B),
    Color(0xff2962FF),
    Color(0xff00695C),
  ];

  Color getCustomColor() {
    int max = _darkThemeColors.length - 1;
    int index = Random().nextInt(max);

    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    return brightness == Brightness.light
        ? _whiteThemeColors.elementAt(index)
        : _darkThemeColors.elementAt(index);
  }

  Color getCustomLightColor() {
    int max = _whiteThemeColors.length - 1;
    int index = Random().nextInt(max);

    return _whiteThemeColors.elementAt(index);
  }

  Color getCustomDarkColor() {
    int max = _darkThemeColors.length - 1;
    int index = Random().nextInt(max);

    return _darkThemeColors.elementAt(index);
  }
}
