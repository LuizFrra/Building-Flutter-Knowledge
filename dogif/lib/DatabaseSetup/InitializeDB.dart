import 'package:dogif/DatabaseSetup/DatabaseQueriesCreate.dart';
import 'package:sqflite/sqflite.dart';

class InitializeDB {

  static InitializeDB _initializeDB;

  Future _DoneInitialization;

  Future get doneInitialization => _DoneInitialization;

  static Database db;

  factory InitializeDB() {
    //if(_initializeDB == null) {
      _initializeDB = new InitializeDB._factorial();
    //}
    return _initializeDB;
  }

  InitializeDB._factorial() {
    _DoneInitialization = startDB();
  }

  Future<void> startDB() async {

    var queries = DataBaseQueriesCreate();
    print('k');
    db = await openDatabase('dogif.db', version: 1, onCreate: (Database db, int version) {
      queries.getQueries.forEach((key, value) async {
        await db.execute(value);
        //print(value);
      });
    });

    //await deleteDatabase(await getDatabasesPath() + '/dogif.db');
  }
}