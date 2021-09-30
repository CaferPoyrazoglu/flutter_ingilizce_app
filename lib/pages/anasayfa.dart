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
          text: "Anasayfa",
          myColor: MyTheme.renkBeyaz,
          myFW: FontWeight.w600,
          fSize: 1.25,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.transparent,
              size: 32,
            ))
      ],
    );
  }
}
