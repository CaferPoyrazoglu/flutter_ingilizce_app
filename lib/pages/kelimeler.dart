import 'package:flutter/material.dart';
import 'package:flutter_ingilizce_app/provider/model.dart';
import 'package:flutter_ingilizce_app/sqflite/KelimelerModel.dart';
import 'package:flutter_ingilizce_app/sqflite/db_helper.dart';
import 'package:flutter_ingilizce_app/theme/MyTheme.dart';
import 'package:flutter_ingilizce_app/widgets/HeadlineForWidgets.dart';
import 'package:flutter_ingilizce_app/widgets/KelimeWidget.dart';
import 'package:provider/provider.dart';

class Kelimeler extends StatefulWidget {
  const Kelimeler({Key key}) : super(key: key);

  @override
  _KelimelerState createState() => _KelimelerState();
}

class _KelimelerState extends State<Kelimeler> {
  //DB
  DatabaseHelper _databaseHelper = DatabaseHelper();
  // ignore: deprecated_member_use
  //Modal
  var _enController = TextEditingController();
  var _trController = TextEditingController();

  void getNotes() async {
    var notesFuture = _databaseHelper.getAllKelime();
    await notesFuture.then((data) {
      Provider.of<KelimelerProvider>(context, listen: false).esitle(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    var tumList = Provider.of<KelimelerProvider>(context);
    return Scaffold(
      backgroundColor: MyTheme.renk2,
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
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: tumList.kelimeList.length,
                  itemBuilder: (context, index) {
                    return KelimeWidget(
                      id: tumList.kelimeList[index].id,
                      text: tumList.kelimeList[index].en,
                      text1: tumList.kelimeList[index].tr,
                      yuzde: yuzdeHesapla(tumList.kelimeList[index].dogru,
                          tumList.kelimeList[index].yanlis),
                    );
                  }),
            ),
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
          text: "Kelimeler",
          myColor: MyTheme.renkBeyaz,
          myFW: FontWeight.w600,
          fSize: 1.25,
        ),
        IconButton(
            onPressed: () {
              showModal();
            },
            icon: Icon(
              Icons.add,
              color: MyTheme.renkBeyaz,
              size: 32,
            ))
      ],
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
                        controller: _enController,
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
                        controller: _trController,
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
                          onPressed: () async {
                            try {
                              await _databaseHelper.insert(KelimelerModel(
                                  _enController.text,
                                  _trController.text,
                                  0,
                                  0));
                              Provider.of<KelimelerProvider>(context,
                                      listen: false)
                                  .kelimeEkle(KelimelerModel(_enController.text,
                                      _trController.text, 0, 0));

                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            } catch (err) {
                              print(err);
                            }
                          },
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

  showAlertDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: Text("Tamam"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Hata"),
      content: Text("HATA"),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  yuzdeHesapla(int dogru, int yanlis) {
    int toplam = dogru + yanlis;
    double yuzde = (dogru / toplam) * 100;
    String tmp = yuzde.toStringAsFixed(0);
    if (tmp == "NaN") {
      tmp = "0";
    }
    return tmp;
  }
}
