import 'package:flutter/material.dart';
import 'package:flutter_ingilizce_app/theme/MyTheme.dart';
import 'package:flutter_ingilizce_app/widgets/HeadlineForWidgets.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.renkBeyaz,
      body: ListView(
        padding: MyTheme.myPadding,
        children: [
          HeadlineForWidgets(
            text: "Anasayfa",
          )
        ],
      ),
    );
  }
}
