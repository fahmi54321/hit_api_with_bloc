import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository{

  //todo 1
  List<Source> sources = [
    NewsApiProvider(),
    NewsDbProvider(),
  ];

  //todo 2
  List<Cache> caches = [
    NewsDbProvider(),
  ];

  //todo 6 (finish)
  Future<List<int>> fetchTopIds(){
    return sources[1].fetchTopIds();
  }

  Future<ItemModel?> fetchItem(int id) async{

    //todo 3
    ItemModel? item;

    //todo 4
    for(var source in sources){
      item = await source.fetchItem(id);
      if(item!= null){
        break;
      }
    }

    //todo 5
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