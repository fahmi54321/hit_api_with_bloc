import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import '../models/item_model.dart';
import 'respository.dart';


class NewsDbProvider implements Source,Cache{
  Database? db;

  // jangan lupa ini, sebab untuk panggil init sebagai inisialisasi awal
  NewsDbProvider(){
    init();
  }

  // return [] karena pada class ini method ini belum digunnakan
  // method ini digunakan untuk store and fetch top ids
  @override
  Future<List<int>> fetchTopIds() async{
    return [].cast<int>();
  }

  void init() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path,"items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb,int version){
        newDb.execute("""
        
        CREATE TABLE Items
        (
          id INTEGER PRIMARY KEY,
          deleted INTEGER,
          type TEXT,
          by TEXT,
          time INTEGER,
          text TEXT,
          dead INTEGER,
          parent INTEGER,
          kids BLOB,
          url TEXT,
          score INTEGER,
          title TEXT,
          parts BLOB,
          descendants INTEGER
        )
        
        """);
      }
    );
  }


  @override
  Future<ItemModel?> fetchItem(int id) async{
    List<Map<String, dynamic>>? maps = await db?.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if((maps?.length??0) > 0){
      return ItemModel.fromDb(maps?.first??{});
    }

    return null;

  }

  @override
  Future<int>? addItem(ItemModel item){
    return db?.insert("Items", item.toMapForDb());
  }

}