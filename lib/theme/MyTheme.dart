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
  static const BorderRadius myRadius = BorderRadius.all(Radius.circular(16));
  static const Radius myRadiusOnly = Radius.circular(16);
  //BORDER
  static Border myBorder = Border.all(color: renkAna, width: 0.5);
  //SHADOW
  static BoxShadow myShadow = BoxShadow(
    color: Colors.grey[400],
    offset: Offset(0.0, 0.0), //(x,y)
    blurRadius: 4.5,
  );
  //COLORS
  static const Color renkAna = Color(0xFF2D46B9);
  static const Color renkArkaplan = Color(0xFF1E3163);

  static const Color renkBeyaz = Color(0xFFffffff);
  static const Color renkSiyah = Color(0xFF242431);

  //GRADIENTS
  /*static const LinearGradient myGrad1 = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFFE0352D),
        Color(0xFFB30D21),
      ]);*/
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
