class Kelimeler {
  int id;
  String en;
  String tr;
  int dogru;
  int yanlis;

  Kelimeler.fromDbMap(Map<String, dynamic> map)
      : id = map['id'],
        en = map['en'],
        tr = map['tr'],
        dogru = map['dogru'],
        yanlis = map['yanlis'];

  Map<String, dynamic> toDbMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['en'] = en;
    map['tr'] = tr;
    map['dogru'] = dogru;
    map['yanlis'] = yanlis;
    return map;
  }
}
