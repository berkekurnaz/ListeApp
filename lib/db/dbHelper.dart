import 'dart:io';
import 'package:Liste/models/mylist.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  String tblList = "Lists";
  String colId = "Id";
  String colTitle = "Title";
  String colDate = "Date";
  String colCompleted = "Completed";

  static final DbHelper _dbHelper = DbHelper._internal();
  DbHelper._internal(); 

  factory DbHelper(){
    return _dbHelper;
  }

  static Database _db;
  Future<Database> get db async{
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "mylist.db";

    var dbList = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbList;
  }

  void _createDb(Database db, int version) async{
    await db.execute("Create Table $tblList($colId integer primary key, $colTitle text, $colDate text, $colCompleted text)");
  }

  /* Insert Islemi Yazilmasi */
  Future<int> insert(MyList myList) async{
    Database db = await this.db;
    var result = await db.insert(tblList, myList.toMap());
    return result;
  }

  /* Update Islemi Yazilmasi */
  Future<int> update(MyList myList) async{
    Database db = await this.db;
    var result = await db.update(tblList, myList.toMap(), where: "$colId = ?", whereArgs: [myList.id]);
    return result;
  }

  /* Delete Islemi Yazilmasi */
  Future<int> delete(int id) async{
    Database db = await this.db;
    var result = await db.rawDelete("Delete From $tblList where $colId = $id");
    return result;
  }

  /* Listeleme Islemi Yazilmasi */
  Future<List> getMyList() async{
    Database db = await this.db;
    var result = await db.rawQuery("Select * From $tblList");
    return result;
  }

  /* Butun Kayitlarin Silinme Islemi Yazilmasi */
  Future<int> deleteAllNotes() async{
    Database db = await this.db;
    var result = await db.rawDelete("Delete From $tblList");
    return result;
  }

}