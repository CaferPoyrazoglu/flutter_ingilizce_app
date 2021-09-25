import 'package:flutter/material.dart';

class MyTheme {
  //INFO
  static const String appName = "Eng App";
  static const String mainFont = "OpenSans";
  static ThemeData myTheme = ThemeData(
    fontFamily: mainFont,
    iconTheme: new IconThemeData(color: Colors.black),
  );
  //PADDING
  static const EdgeInsetsGeometry myPadding = EdgeInsets.all(13.0);
  static const double myPaddingOnly = 13.0;
  //RADIUS
  static const BorderRadius myRadius = BorderRadius.all(Radius.circular(8));
  static const Radius myRadiusOnly = Radius.circular(8);
  //BORDER
  static Border myBorder = Border.all(color: Colors.grey[400], width: 0.3);
  //SHADOW
  static BoxShadow myShadow = BoxShadow(
    color: Colors.grey[300],
    offset: Offset(0.0, 0.0), //(x,y)
    blurRadius: 5.5,
  );
  //COLORS
  static const Color renk1 = Color(0xFF069a9c);
  static const Color renk2 = Color(0xFF093339);
  static const Color renk3 = Color(0xFF88b6b9);
  static const Color renk4 = Color(0xFFa77555);
  static const Color renkBeyaz = Colors.white;
  static const Color renkSiyah = Color(0xFF242431);

  //GRADIENTS
  static const LinearGradient myGrad1 = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [Color(0xFF0071DF), Color(0xFF003973)]);
  //SIZES
  static const double appNavHeight = 55;
}

deviceWidth(BuildContext context) {
  Size size = MediaQuery.of(context).size * 0.056;
  double mySize = size.width;
  return mySize;
}

deviceHeight(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double mySize = size.height;
  return mySize;
}

extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}
