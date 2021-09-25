import 'package:flutter/material.dart';
import 'package:flutter_ingilizce_app/theme/MyTheme.dart';
import 'package:flutter_ingilizce_app/widgets/HeadlineForWidgets.dart';

class KelimeWidget extends StatelessWidget {
  final String text;
  final String text1;
  final String yuzde;

  const KelimeWidget({Key key, this.text, this.text1, this.yuzde})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => KelimeDialog(
            en: text,
            tr: text1,
            yuzde: yuzde,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          height: deviceHeight(context) * 0.075,
          decoration: BoxDecoration(
              border: MyTheme.myBorder,
              boxShadow: [MyTheme.myShadow],
              color: MyTheme.renkBeyaz,
              borderRadius: MyTheme.myRadius),
          child: Padding(
            padding: MyTheme.myPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: deviceWidth(context) * 0.8,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      yuzde,
                      style: TextStyle(
                          fontSize: deviceWidth(context) * 0.8,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KelimeDialog extends StatelessWidget {
  final String en;
  final String tr;
  final String yuzde;

  const KelimeDialog({Key key, this.en, this.tr, this.yuzde}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          HeadlineForWidgets(
            text: yuzde,
          ),
          HeadlineForWidgets(
            text: en,
          ),
          HeadlineForWidgets(
            text: tr,
          ),
        ],
      ),
    );
  }
}
