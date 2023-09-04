import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite {
  static Database? db;
  Future<Database?> get dB async {
    db ??= await initialDB();
    return db;
  }

  initialDB() async {
    String databasePath = await getDatabasesPath();
    String databaseName = "favoriteProducts.db";
// database path/note.db
    String path = join(databasePath, databaseName);
    Database? myDb = await openDatabase(path, version: 2, onCreate: _onCreate);
    return myDb;
  }

  final myTab1e = "note";
  final id = "id";
  final title = "title";
  final description = "description";
  final color = "color";
  _onCreate(Database db, int version) async {
    await db.execute('''

CREATE TABLE"$myTab1e"(
"$id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
"$title" TEXT NOT NULL,
"$description" TEXT NOT NULL,)''');
  }
}
