import 'dart:io';
import 'package:flutter_ingilizce_app/sqflite/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _dbName = "Database.db";
  // Use this class as a singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // Creates and opens the database.
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Creates the database structure
  Future _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute('''
          CREATE TABLE Kelimeler (
            id INTEGER PRIMARY KEY,
            en TEXT NOT NULL,
            tr TEXT NOT NULL,
            dogru INTEGER,
            yanlis INTEGER 
          )
          ''');
  }

  // TÜM KELİMELERİ LİSTELEME METHODU
  Future<List<Kelimeler>> fetchAllKelimeler() async {
    Database database = _database;
    List<Map<String, dynamic>> maps = await database.query('Kelimeler');
    if (maps.isNotEmpty) {
      return maps.map((map) => Kelimeler.fromDbMap(map)).toList();
    }
    return null;
  }

  // YENİ KELİME EKLEME METHODU
  Future<int> yeniKelimeEkle(Kelimeler kelimeler) async {
    Database database = _database;
    return database.insert(
      'Kelimeler',
      kelimeler.toDbMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
