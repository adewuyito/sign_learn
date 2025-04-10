// app colors
import 'package:flutter/material.dart';

const appColors = ThemeModel(
  paleGreen: Color(0xFF7EE7D6),
  purple: Color(0xFFC6BCFA),
  paleOrange: Color(0xFFFFE4C9),
  black: Colors.black,
  white: Colors.white,
  transparent: Colors.transparent,
  blue: Color(0xFF0A66C2),
  red: Color(0xFFE01515),
  lightGreyAAABAD: Color(0xFFAAABAD),
  greyF6F6F6: Color(0xFFF6F6F6),
  greyE9E9E9: Color(0xFFE9E9E9),
  greyAEAEAE: Color(0xFFAEAEAE),
  grey767676: Color(0xFF767676),
  gradientHigh: Color(0xFFE198F0),
  gradientLow: Color(0xFF3D05DD),
  dividerGrey: Color.fromARGB(1, 241, 241, 241),
  inputDecoration: Color(0xFFAAABAD),
  appGradient: appGradient,
  secondryAppGradient: secondryAppGradient,
  appbarUnderline: Color(0x4B00040A),
  buttonYellow: Color(0xFFFFD92C),
);

// theme model
class ThemeModel {
  final Color paleGreen;
  final Color paleOrange;
  final Color grey767676;
  final Color white;
  final Color black;
  final Color transparent;
  final Color purple;
  final Color blue;
  final Color red;
  final Color buttonYellow;
  final Color lightGreyAAABAD;
  final Color greyF6F6F6;
  final Color greyE9E9E9;
  final Color greyAEAEAE;
  final Color gradientHigh;
  final Color gradientLow;
  final Color dividerGrey;
  final Color inputDecoration;
  final Map<String, Color> appGradient;
  final Map<String, Color> secondryAppGradient;
  final Color appbarUnderline;
  const ThemeModel({
    required this.paleGreen,
    required this.paleOrange,
    required this.purple,
    required this.buttonYellow,
    required this.grey767676,
    required this.white,
    required this.black,
    required this.transparent,
    required this.blue,
    required this.red,
    required this.lightGreyAAABAD,
    required this.greyF6F6F6,
    required this.greyE9E9E9,
    required this.greyAEAEAE,
    required this.gradientHigh,
    required this.gradientLow,
    required this.dividerGrey,
    required this.inputDecoration,
    required this.appGradient,
    required this.secondryAppGradient,
    required this.appbarUnderline,
  });
}

const Map<String, Color> appGradient = {
  'first': Color(0xFF3D05DD),
  "second": Color(0xFFE198F0)
};
const Map<String, Color> secondryAppGradient = {
  'first': Color(0xFFFBA33B),
  "second": Color(0xFFF2EA34)
};

// const List<Color> myCirclesColors = [
//   Color(0xFFF7FBF1),
//   Color(0xFFE5F2F0),
//   Color(0xFFF4F4F4),
// ];
