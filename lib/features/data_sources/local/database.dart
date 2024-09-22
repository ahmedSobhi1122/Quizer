import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

class DB {

  static Database ? _dp ;

  get dp async
  {
    _dp ??= await initial();  // if(_dp == null) _dp = await initial();
    return _dp;
  }

  initial()async
  {
    String pathDB = await getDatabasesPath();
    String path = join(pathDB,'note.db');
    Database myDB = await openDatabase(path,onCreate: _onCreate,version: 1,onUpgrade: _onUpgrade);
    return myDB;
  }

  myDeleteDB()async
  {
    String pathDB = await getDatabasesPath();
    String path = join(pathDB,'note.db');
    await deleteDatabase(path);
  }

  _onCreate(Database db,int version)async
  {
    Batch batch = db.batch();
    batch.execute('''
    Create table "Notes" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT , 
    "title" text not null ,
    "note" text not null ,
    "color" text not null     
    )
    ''');
    await batch.commit();

    // print('onCreate is done ================================');
  }


  _onUpgrade(Database db,int oldVersion,int newVersion) async
  {

    // print('onUpgrade is done ================================');
  }

  Future<List<Map>> read(String table)async
  {
    Database mydb = await dp;
    List<Map> response = await mydb.query(table);
    return response;
  }

  Future<int> add({required String table ,required String title ,required String note ,required String color }) async
  {
    Database mydb = await dp;
    Map<String, Object?> values = {'title':title,'note':note,'color':color};
    int response = await mydb.insert(table,values);
    return response;
  }

  Future<int> update({required String table ,required String title ,required String note ,required String color  ,required String where }) async
  {
    Database mydb = await dp;
    Map<String, Object?> values = {'title':title,'note':note,'color':color};
    int response = await mydb.update(table,values,where: where);
    return response;
  }

  Future<int> delete({required String table ,required String where }) async
  {
    Database mydb = await dp;
    int response = await mydb.delete(table, where: where);
    return response;
  }

  rowRead({required String sql})async
  {
    Database mydb = await dp;
    List<Map> response = await mydb.rawQuery(sql);
    return response;
  }

  rowAdd({required String sql }) async
  {
    Database mydb = await dp;
    int response = await mydb.rawInsert(sql);
    return response;
  }

  rowUpdate({required String sql }) async
  {
    Database mydb = await dp;
    int response = await mydb.rawUpdate(sql);
    return response;
  }

  rowDelete({required String sql }) async
  {
    Database mydb = await dp;
    int response = await mydb.rawDelete(sql);
    return response;
  }


}
