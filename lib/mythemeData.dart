
import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData {
  static Color primarycolor = Color(0xff5D9CEC);
  static Color accentcolor = Color(0xffDFECDB);
  static Color accentcolorDark = Color(0xff060E1E);
  static ThemeData Light_theme=ThemeData(
    scaffoldBackgroundColor: accentcolor,
    primaryColor: MyThemeData.primarycolor,
    appBarTheme: AppBarTheme( color: primarycolor,
    elevation: 0,
    titleTextStyle: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold)
    ),

  );
}

