import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository{

  List<Source> sources = [
    NewsApiProvider(),
    NewsDbProvider(),
  ];

  List<Cache> caches = [
    NewsDbProvider(),
  ];

  Future<List<int>> fetchTopIds(){
    return sources[0].fetchTopIds();
  }

  Future<ItemModel?> fetchItem(int id) async{

    ItemModel? item;

    for(var source in sources){
      item = await source.fetchItem(id);
      if(item!= null){
        break;
      }
    }

    for(var cache in caches){
      if(item!=null) {
        cache.addItem(item);
      }
    }


  }
}

abstract class Source{
  Future<List<int>> fetchTopIds();
  Future<ItemModel?> fetchItem(int id);
}

abstract class Cache{
  Future<int>? addItem(ItemModel item);
}