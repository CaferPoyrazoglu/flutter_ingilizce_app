import 'package:flutter/material.dart';
import '../theme/MyTheme.dart';

class HeadlineForWidgets extends StatelessWidget {
  final String text;
  final double fSize;
  final Color myColor;
  final FontWeight myFW;
  final TextOverflow myoF;
  final TextAlign myTa;
  final String fontFamily;

  const HeadlineForWidgets({
    Key key,
    this.text = 'Button',
    this.fSize = 1.0,
    this.myColor,
    this.myoF,
    this.myTa,
    this.fontFamily,
    this.myFW = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$text",
          overflow: myoF,
          textAlign: myTa,
          style: TextStyle(
            fontFamily: fontFamily,
            color: myColor,
            fontWeight: myFW,
            fontSize: deviceWidth(context) * fSize,
          ),
        ),
      ],
    );
  }
}
