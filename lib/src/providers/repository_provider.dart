import 'dart:io';
import 'package:notes_app/src/models/note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class RepositoryProvider {
  static const int errorCode = -1;
  static Database _database;

  static final RepositoryProvider repoProvider = RepositoryProvider._();

  RepositoryProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    //PAth donde almacenamos la base de datos.

    Directory documentsDirectory =
        await getExternalStorageDirectory(); //este solo funciona en android.
    final path = join(documentsDirectory.path, 'NotesDB.db');
    print(path);

    //crear db
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(''' 
        CREATE TABLE Notes(
          id INTEGER PRIMARY KEY,
          title TEXT,
          content TEXT,
          complete INTEGER,
          creationDate TEXT
        )
        ''');
    });
  }

  Future<int> createNote(NoteModel entity) async {
    final db = await database;
    //final resp =await db.insert('Notes', entity.toJson());
    final resp = await db
        .insert('Notes', entity.toJson())
        .then((value) => value)
        .catchError((error) => errorCode);
    print(resp);
    return resp;
  }

  Future<List<NoteModel>> findAllNotes() async {
    final db = await database;
    final resp = await db.query('Notes');
    return resp.isNotEmpty
        ? resp.map((e) => NoteModel.fromJson(e)).toList()
        : [];
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    final resp = await db.delete('Notes', where: 'id=?', whereArgs: [id]);

    return resp;
  }
}
