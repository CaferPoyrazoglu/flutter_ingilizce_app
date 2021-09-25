import 'package:flutter/material.dart';
import 'package:flutter_ingilizce_app/theme/MyTheme.dart';
import 'package:flutter_ingilizce_app/widgets/HeadlineForWidgets.dart';
import 'package:flutter_ingilizce_app/widgets/KelimeWidget.dart';

class Kelimeler extends StatefulWidget {
  const Kelimeler({Key key}) : super(key: key);

  @override
  _KelimelerState createState() => _KelimelerState();
}

class _KelimelerState extends State<Kelimeler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.renkBeyaz,
      body: ListView(
        padding: MyTheme.myPadding,
        children: [
          baslikGetir(),
          KelimeWidget(
            text: "electronic",
            text1: "elektronik",
            yuzde: "%92",
          ),
          KelimeWidget(
            text: "apple",
            text1: "elma",
            yuzde: "%55",
          ),
          KelimeWidget(
            text: "congratulations",
            text1: "tebrikler",
            yuzde: "%76",
          ),
        ],
      ),
    );
  }

  Padding baslikGetir() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MyTheme.myPaddingOnly * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeadlineForWidgets(
            text: "Kelimeler",
            myFW: FontWeight.w600,
            fSize: 1.25,
          ),
          IconButton(
              onPressed: () {
                showModal();
              },
              icon: Icon(
                Icons.add,
                size: 32,
              ))
        ],
      ),
    );
  }

  showModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: MyTheme.myPadding,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/en.png"),
                      ),
                      title: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'EN',
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/tr.png"),
                      ),
                      title: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'TR',
                        ),
                      ),
                    ),
                    ListTile(
                      title: Container(
                        decoration: BoxDecoration(
                            border: MyTheme.myBorder,
                            boxShadow: [MyTheme.myShadow],
                            color: MyTheme.renkBeyaz,
                            borderRadius: MyTheme.myRadius),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0, primary: Colors.transparent),
                          onPressed: () {},
                          child: HeadlineForWidgets(
                            fSize: 0.8,
                            myFW: FontWeight.w600,
                            myColor: MyTheme.renkSiyah,
                            text: "Kaydet",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
