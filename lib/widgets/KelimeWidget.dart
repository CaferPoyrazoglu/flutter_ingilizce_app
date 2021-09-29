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

  const KelimeWidget({Key key, this.id, this.text, this.text1, this.yuzde})
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
            en: widget.text,
            tr: widget.text1,
            yuzde: "%" + widget.yuzde,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          height: deviceHeight(context) * 0.1,
          decoration: BoxDecoration(
              border: MyTheme.myBorder,
              boxShadow: [MyTheme.myShadow],
              color: MyTheme.renkBeyaz,
              borderRadius: MyTheme.myRadius),
          child: Padding(
            padding: MyTheme.myPadding,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 14,
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            fontSize: deviceWidth(context) * 0.8,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "%" + widget.yuzde,
                        style: TextStyle(
                            color: belirle(widget.yuzde),
                            fontSize: deviceWidth(context) * 0.8,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                          onPressed: () async {
                            try {
                              await delete(widget.id);
                              Provider.of<KelimelerProvider>(context,
                                      listen: false)
                                  .kelimeSil(widget.text);
                            } catch (err) {
                              print("err");
                            }
                          },
                          icon: Icon(Icons.highlight_remove_rounded)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
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
