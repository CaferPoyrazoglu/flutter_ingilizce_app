class KelimelerModel {
  int id;
  String en;
  String tr;
  int dogru;
  int yanlis;

  KelimelerModel(this.en, this.tr, this.dogru, this.yanlis);
  KelimelerModel.withID(this.id, this.en, this.tr, this.dogru, this.yanlis);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["en"] = en;
    map["tr"] = tr;
    map["dogru"] = dogru;
    map["yanlis"] = yanlis;
    return map;
  }

  KelimelerModel.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.en = map["en"];
    this.tr = map["tr"];
    this.dogru = map["dogru"];
    this.yanlis = map["yanlis"];
  }
}
