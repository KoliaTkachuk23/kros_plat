import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'note.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'notes.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, created_at TEXT)',
        );
      },
    );
  }

  Future<int> addNote(Note note) async {
    final db = await database;
    return db.insert('notes', note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Note>> getNotes() async {
    final db = await database;
    final result = await db.query('notes', orderBy: 'id DESC');
    return result.map((map) => Note.fromMap(map)).toList();
  }
}