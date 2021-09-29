import 'package:flutter/material.dart';
import 'package:flutter_ingilizce_app/provider/model.dart';
import 'package:flutter_ingilizce_app/sqflite/db_helper.dart';
import 'package:flutter_ingilizce_app/theme/MyTheme.dart';
import 'package:flutter_ingilizce_app/widgets/HeadlineForWidgets.dart';
import 'package:provider/provider.dart';

class KelimeWidget extends StatefulWidget {
  final int id;
  final String text;
  final String text1;
  final String yuzde;
  final int deger;
  final int sonEleman;

  const KelimeWidget(
      {Key key,
      this.id,
      this.text,
      this.text1,
      this.yuzde,
      this.deger,
      this.sonEleman})
      : super(key: key);

  @override
  State<KelimeWidget> createState() => _KelimeWidgetState();
}

class _KelimeWidgetState extends State<KelimeWidget> with DatabaseHelper {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => KelimeDialog(
            id: widget.id,
            en: widget.text,
            tr: widget.text1,
            yuzde: "%" + widget.yuzde,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 0),
        child: Container(
          height: deviceHeight(context) * 0.08,
          decoration: BoxDecoration(
              border: MyTheme.myBorder,
              color: MyTheme.renkAna,
              borderRadius: radBelirle(widget.deger, widget.sonEleman)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MyTheme.myPaddingOnly),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                      color: MyTheme.renkBeyaz,
                      fontSize: deviceWidth(context) * 0.8,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  radBelirle(int deger, int sonEleman) {
    if (deger == 0) {
      return BorderRadius.only(
          topLeft: MyTheme.myRadiusOnly, topRight: MyTheme.myRadiusOnly);
    } else if (deger == sonEleman - 1) {
      return BorderRadius.only(
          bottomLeft: MyTheme.myRadiusOnly, bottomRight: MyTheme.myRadiusOnly);
    } else {
      return MyTheme.myRadius * 0;
    }
  }

  belirle(String yuzde) {
    double tmp = double.parse(yuzde);

    if (0 <= tmp && tmp < 25) {
      return Colors.red[300];
    } else if (26 <= tmp && tmp < 50) {
      return Colors.orange;
    } else if (51 <= tmp && tmp < 75) {
      return Colors.yellow;
    } else
      return Colors.green;
  }
}

// ignore: must_be_immutable
class KelimeDialog extends StatelessWidget with DatabaseHelper {
  final int id;
  final String en;
  final String tr;
  final String yuzde;

  KelimeDialog({Key key, this.id, this.en, this.tr, this.yuzde})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: MyTheme.myRadius),
      actions: [
        IconButton(
            onPressed: () async {
              try {
                await delete(id);
                Provider.of<KelimelerProvider>(context, listen: false)
                    .kelimeSil(en);
                Navigator.of(context).pop();
              } catch (err) {
                print("err");
              }
            },
            icon: Icon(Icons.delete_outline_rounded))
      ],
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeadlineForWidgets(
                myFW: FontWeight.w600,
                text: "Başarı Oranı: ",
              ),
              HeadlineForWidgets(
                text: yuzde,
              ),
            ],
          ),
          Divider(
            height: deviceHeight(context) * 0.04,
            color: Colors.transparent,
          ),
          SizedBox(
              height: deviceHeight(context) * 0.04,
              child: Image.asset("assets/images/en.png")),
          HeadlineForWidgets(
            text: en,
          ),
          SizedBox(
            height: deviceHeight(context) * 0.04,
          ),
          SizedBox(
              height: deviceHeight(context) * 0.04,
              child: Image.asset("assets/images/tr.png")),
          HeadlineForWidgets(
            text: tr,
          ),
        ],
      ),
    );
  }

  belirle(String yuzde) {
    double tmp = double.parse(yuzde);

    if (0 <= tmp && tmp < 25) {
      return Colors.red[300];
    } else if (26 <= tmp && tmp < 50) {
      return Colors.orange;
    } else if (51 <= tmp && tmp < 75) {
      return Colors.yellow;
    } else
      return Colors.green;
  }
}
