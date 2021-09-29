import 'package:flutter/material.dart';
import 'package:flutter_ingilizce_app/sqflite/KelimelerModel.dart';

class KelimelerProvider with ChangeNotifier {
  List<KelimelerModel> kelimeList = [];

  void esitle(var km) {
    this.kelimeList = km;
    notifyListeners();
  }

  void kelimeEkle(KelimelerModel km) {
    this.kelimeList.add(km);
    notifyListeners();
  }

  void kelimeSil(int index) {
    this.kelimeList.removeWhere((element) => element.id == index);
    notifyListeners();
  }
}
