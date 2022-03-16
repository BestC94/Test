import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testproject/model/food.dart';
//import 'package:testproject/model/food.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('food.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableFood (
  ${FoodFields.id} $idType,
  ${FoodFields.name} $textType,
  ${FoodFields.price} $integerType
  );
''');
  }

  Future<Food> create(Food food) async {
    final db = await instance.database;
    final id = await db.insert(tableFood, food.toJson());
    return food.copy(id: id);
  }

  Future<List<Food>> readAllFoods() async {
    final db = await instance.database;
    final orderBy = '${FoodFields.id} ASC';
    final result = await db.query(tableFood, orderBy: orderBy);
    return result.map((json) => Food.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableFood,
      where: '${FoodFields.id} = ?',
      whereArgs: [id],
    );
  }
}
