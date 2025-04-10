// base theme
import 'package:flutter/material.dart';

import 'constants.dart' show appColors, signLearnTextTheme;
import '../../gen/fonts.gen.dart';

final baseTheme = ThemeData.light();

// base border
final inputBorderBase = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(
    color: appColors.transparent,
  ),
);

final ThemeData signLearnTheme = baseTheme.copyWith(
  primaryColor: appColors.blue,
  appBarTheme: AppBarTheme(
    backgroundColor: appColors.white,
    elevation: 0,
    foregroundColor: appColors.black,
  ),
  scaffoldBackgroundColor: appColors.white,
  colorScheme: baseTheme.colorScheme.copyWith(
    surface: appColors.white,
    secondary: appColors.blue,
  ),
  dividerColor: appColors.dividerGrey,
  brightness: Brightness.light,
  buttonTheme: baseTheme.buttonTheme.copyWith(
    height: 55,
    minWidth: double.infinity,
    buttonColor: appColors.blue,
    textTheme: ButtonTextTheme.normal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    disabledColor: appColors.blue.withValues(alpha: .3),
  ),
  tabBarTheme: baseTheme.tabBarTheme.copyWith(
    labelStyle: baseTheme.textTheme.bodySmall!.copyWith(
      color: appColors.blue,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: baseTheme.textTheme.bodySmall!.copyWith(
      color: appColors.black,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorColor: appColors.blue,
    labelColor: appColors.blue,
    unselectedLabelColor: appColors.black,
  ),
  inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: inputBorderBase,
    enabledBorder: inputBorderBase,
    focusedBorder: inputBorderBase,
    fillColor: appColors.white,
    filled: true,
    hintStyle: TextStyle(
      fontSize: 14,
      color: appColors.greyAEAEAE,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.generalSans,
    ),
    labelStyle: TextStyle(
      fontSize: 12,
      color: appColors.greyAEAEAE,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.generalSans,
    ),
  ),
  textTheme: signLearnTextTheme.apply(
    fontFamily: FontFamily.generalSans,
    bodyColor: appColors.black,
  ),
);
