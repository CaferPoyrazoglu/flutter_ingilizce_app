import 'package:flutter_ingilizce_app/sqflite/KelimelerModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _database;

  String _tableName = "Kelimeler";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), "Kelimeler.db");
    var kelimeDB = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return kelimeDB;
  }

  void createDb(Database db, int version) async {
    await db.execute('''
          CREATE TABLE Kelimeler (
            id INTEGER PRIMARY KEY,
            en TEXT NOT NULL UNIQUE,
            tr TEXT NOT NULL,
            dogru INTEGER,
            yanlis INTEGER 
          )
          ''');
  }

  //Crud Methods
  Future<List<KelimelerModel>> getAllKelime() async {
    Database db = await this.database;
    var result = await db.query("$_tableName");
    return List.generate(result.length, (i) {
      return KelimelerModel.fromMap(result[i]);
    });
  }

  Future<int> insert(KelimelerModel km) async {
    Database db = await this.database;
    var result = await db.insert("$_tableName", km.toMap());

    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    var result = await db.rawDelete("delete from $_tableName where id=$id");
    return result;
  }

  Future<int> update(KelimelerModel km) async {
    Database db = await this.database;
    var result = await db
        .update("$_tableName", km.toMap(), where: "id=?", whereArgs: [km.id]);
    return result;
  }
}
