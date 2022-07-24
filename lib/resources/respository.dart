import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository{

  NewsDbProvider dbProvider = NewsDbProvider();

  NewsApiProvider apiProvider = NewsApiProvider();

  Future<List<int>> fetchTopIds(){
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel?> fetchItem(int id) async{
    var item = await dbProvider.fetchItem(id);
    if(item != null){
      return item;
    }

    item = await apiProvider.fetchItem(id);
    if(item!=null) {
      dbProvider.addItem(item);
      return item;
    }
    return null;

  }
}

//todo 5
abstract class Source{
  Future<List<int>> fetchTopIds();
  Future<ItemModel?> fetchItem(int id);
}

//todo 6 (next news_api_provider)
abstract class Cache{
  Future<int>? addItem(ItemModel item);
}