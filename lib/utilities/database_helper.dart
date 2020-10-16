import 'dart:async';
import 'dart:io';
import 'package:leimo/models/exchange.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  final String table = "moneyTable";
  final String columnId = "id";
  final String columnCrypto = "cryptocurrency";
  final String columnFiat = "fiatcurrency";
  final String columnval = "value";
  static Database _db;

  Future<Database> get db async{
    if(_db!= null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }
  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "maindb.db");
   var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
   return ourDb;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $table($columnId INTEGER PRIMARY KEY, $columnCrypto TEXT, $columnval TEXT, $columnFiat TEXT)"
    );
  }

  Future<int> saveMoney(Exchange exchange) async{
    var dbClient = await db;
    int res = await dbClient.insert("$table", exchange.toMap());
    return res;
  }

  Future<List> getAllMoney() async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $table");
    return result.toList();
  }

  Future<int> getCount() async{
    var dbClient = await db;
    return Sqflite.firstIntValue(
      await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $table"
      )
    );
  }

  Future<Exchange> getMoney(int id) async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $table WHERE $columnId = $id");
    if(result.length == 0) return null;
    return new Exchange.fromMap(result.first);
  }

  Future<int> deleteMoney(int id) async{
    var dbClient = await db;
    return await dbClient.delete(table,
        where: "$columnId = ?",whereArgs: [id]);
  }

  Future<int> updateMoney(Exchange exchange) async{
    var dbClient = await db;
    return await dbClient.update(table, exchange.toMap(),
        where: "$columnId = ?",whereArgs: [exchange.id]);
  }

  Future close() async{
    var dbClient = await db;
    return dbClient.close();
  }
}