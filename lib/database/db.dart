import 'dart:async';

import '../models/time.dart';
import '../repositories/time_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  // ignore: prefer_final_fields
  static Database? _database;

  FutureOr<dynamic> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database;

    return initDatabase();
  }

  static get() async {
    return DB.instance.database;
  }

  initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'futebol.db'),
      version: 1,
      onCreate: (db, versao) async {
        await db.execute(times);
        await db.execute(titulos);
        await setupTimes(db);
      },
    );
  }

  String get times => '''
  CREATE TABLE times(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    pontos INTEGER;
    brasao TEXT,
    cor TEXT
  );
''';

  String get titulos => '''
CREATE TABLE titulos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    campenoato TEXT,
    ano TEXT,
    time_id INTEGER,
    FOREIGN KEY (time_id) REFERENCES times(id) ON DELETE CASCADE
);
''';

  setupTimes(Database db) {
    for (Time time in TimesRepository.setupTimes()) {
      db.insert('times', {
        'nome': time.nome,
        'brasao': time.brasao,
        'pontos': time.pontos,
        'cor':
            time.cor.toString().replaceAll('Color()', '').replaceAll(')', ''),
      });
    }
  }
}
