import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_ingilizce_app/provider/model.dart';
import 'package:flutter_ingilizce_app/sqflite/KelimelerModel.dart';
import 'package:flutter_ingilizce_app/theme/MyTheme.dart';
import 'package:flutter_ingilizce_app/widgets/HeadlineForWidgets.dart';
import 'package:provider/provider.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<KelimelerModel> tumList;
  var secenekHelper = ["element1", "element2", "element3", "element4"];

  final _random = new Random();
  int soruIndex;
  int dogruCevapIndex;
  String dogruEN;
  String dogruTR;
  String tempSecenek;
  Color dogruRenk = MyTheme.renkAna;

  @override
  void initState() {
    super.initState();
    tumList = Provider.of<KelimelerProvider>(context, listen: false).kelimeList;
  }

  @override
  Widget build(BuildContext context) {
    soruIndex = _random.nextInt(tumList.length);
    dogruCevapIndex = _random.nextInt(4);
    dogruEN = tumList[soruIndex].en;
    dogruTR = tumList[soruIndex].tr;
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
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Container(
                  height: deviceHeight(context) * 0.25,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: MyTheme.myRadius,
                    color: MyTheme.renkBeyaz,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [HeadlineForWidgets(text: dogruEN)],
                  ),
                ),
                for (int i = 0; i < 4; i++)
                  if (i == dogruCevapIndex)
                    dogruTRGetir(context, dogruTR)
                  else
                    secenekGetir(
                      context,
                    )
              ],
            ),
          ],
        ),
      ),
    );
  }

  InkWell dogruTRGetir(BuildContext context, String dogruTR) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.only(top: 14),
        child: Container(
          height: deviceHeight(context) * 0.09,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: MyTheme.myRadius,
            color: dogruRenk,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: MyTheme.myPaddingOnly),
                child: HeadlineForWidgets(
                  text: dogruTR,
                  myColor: MyTheme.renkBeyaz,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell secenekGetir(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(top: 14),
        child: Container(
          height: deviceHeight(context) * 0.09,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: MyTheme.myRadius,
            color: MyTheme.renkAna,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: MyTheme.myPaddingOnly),
                child: HeadlineForWidgets(
                  text: rastgeleGetir(),
                  myColor: MyTheme.renkBeyaz,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  rastgeleGetir() {
    String temp = tumList[_random.nextInt(tumList.length)].tr;
    for (int i = 0; i < 100; i++) {
      if (temp == dogruTR ||
          temp == [secenekHelper.length - 1].toString() ||
          temp == [secenekHelper.length - 2].toString() ||
          temp == [secenekHelper.length - 3].toString() ||
          temp == [secenekHelper.length - 4].toString()) {
        temp = tumList[_random.nextInt(tumList.length)].tr;
      } else {
        break;
      }
    }
    secenekHelper.add(temp);
    return temp;
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
