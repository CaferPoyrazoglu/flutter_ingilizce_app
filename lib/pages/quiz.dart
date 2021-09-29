import 'package:flutter/material.dart';
import 'package:flutter_ingilizce_app/theme/MyTheme.dart';
import 'package:flutter_ingilizce_app/widgets/HeadlineForWidgets.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.renkArkaplan,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MyTheme.myPaddingOnly * 0.7,
            horizontal: MyTheme.myPaddingOnly),
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight(context) * 0.05,
            ),
            baslikGetir(),
          ],
        ),
      ),
    );
  }

  Row baslikGetir() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadlineForWidgets(
          text: "Quiz",
          myColor: MyTheme.renkBeyaz,
          myFW: FontWeight.w600,
          fSize: 1.25,
        ),
      ],
    );
  }
}
