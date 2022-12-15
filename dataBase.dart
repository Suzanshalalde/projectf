import 'package:flutter_application_22/Moduels/subtask.dart';
import 'package:flutter_application_22/Moduels/task.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static final String tablename = 'tasks';
  static final String tablename1 = 'sub_tasks';

  static final version = 1;
  static Database? _database;

  get database async {
    if (_database == null) _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = await getDatabasesPath();
    path += "tasks.db";

    return await openDatabase(
      path,
      version: version,
      onCreate: ((db, version) async {
        await db.execute('''
          create table tasks(
            taskName text not null
            dateTime DATETIME not null
            taskDone INTEGER NOT NULL DEFAULT false CHECK(is_friend IN (false,true))
          )
          ''');

        await db.execute('''
          create table sub_tasks(
            name_sub text 
            info text 
            taskDone INTEGER NOT NULL DEFAULT false CHECK(is_friend IN (false,true))
          )
          ''');
      }),
    );
  }

  Future insert(Task task) async {
    final db = await database;
    return await db.insert(tablename, task.toMap());
  }

  Future insertSub(SubTask subTask) async {
    final db = await database;
    return await db.insert(tablename1, subTask.toMap());
  }
}
