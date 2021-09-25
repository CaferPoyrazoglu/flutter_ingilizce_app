import 'package:flutter/material.dart';
import '../theme/MyTheme.dart';

class HeadlineTitle extends StatelessWidget {
  final String text;

  const HeadlineTitle({
    Key key,
    this.text = 'Button',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$text",
          style: TextStyle(
            color: MyTheme.renkSiyah,
            fontWeight: FontWeight.w700,
            fontSize: deviceWidth(context) * 1.45,
          ),
        ),
      ],
    );
  }
}
