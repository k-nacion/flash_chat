import 'package:flash_chat/util/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: color30,
    accentColor: color10,
    scaffoldBackgroundColor: color60,
    textTheme: GoogleFonts.notoSansTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.black.withOpacity(.6),
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: color30, width: 3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: Colors.black, width: 2),
        visualDensity: VisualDensity(
          vertical: VisualDensity.minimumDensity,
          horizontal: VisualDensity.minimumDensity,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
    dividerTheme: DividerThemeData(
      color: ThemeData.estimateBrightnessForColor(color60) == Brightness.light
          ? Colors.black.withOpacity(.5)
          : Colors.white.withOpacity(.5),
    ),
  );
}
