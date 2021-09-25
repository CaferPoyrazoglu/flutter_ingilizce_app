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
      backgroundColor: MyTheme.renkBeyaz,
      body: ListView(
        padding: MyTheme.myPadding,
        children: [
          HeadlineForWidgets(
            text: "Quiz",
          )
        ],
      ),
    );
  }
}
