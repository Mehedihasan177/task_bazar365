import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_bazar365/models/task.dart';

class DBHelper {
  static final _databaseName = 'shoppingappTask.db';
  static final _tasks_table = 'tasks_table';
  static final _databaseVersion = 1;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDB();
    return _database!;
  }

  _initDB() async {
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

 
 _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $_tasks_table('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, foodName STRING, isStock STRING, image STRING, actualPrice STRING, saveMoney STRING, plastic STRING, off STRING, kg INTEGER'
        ')');
  }

  Future<int> insertTask(Task task) async {
    Database? db = await DBHelper._database;
    return await db!.insert(_tasks_table, {
      'foodName': task.foodName,
      'isStock': task.inStock,
      'image': task.image,
      'actualPrice': task.actualPrice,
      'saveMoney': task.saveMoney,
      'plastic': task.plastic,
      'off': task.off,
      'kg' : task.kg
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await DBHelper._database;
    return await db!.query(_tasks_table);
  }


  Future<int> delete(int id) async {
    Database? db = await DBHelper._database;
    return await db!.delete(_tasks_table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllTasks() async {
    Database? db = await DBHelper._database;
    return await db!.delete(_tasks_table);
  }

  Future<int> update(int id)async{
    return await _database!.rawUpdate('''
    UPDATE $_tasks_table
    SET isCompleted = ?, color = ?
    WHERE id = ?
    ''',[1, 1, id]);
  }

}
