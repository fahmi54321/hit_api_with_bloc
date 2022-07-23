import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository{

  //todo 5
  NewsDbProvider dbProvider = NewsDbProvider();

  //todo 6
  NewsApiProvider apiProvider = NewsApiProvider();

  //todo 7
  Future<List<int>> fetchTopIds(){
    return apiProvider.fetchTopId();
  }

  //todo 8
  Future<ItemModel> fetchItem(int id) async{
    var item = await dbProvider.fetchItem(id);
    if(item != null){
      return item;
    }

    item = await apiProvider.fetchItem(id);
    dbProvider.addItem(item);
    return item;

  }

  //todo 9 (coba flutter test)
  //       akan muncul error
  //       "'List<dynamic>' is not a subtype of type 'FutureOr<List<int>>'"

  // untuk mengatasinya, gunakan casting lists (next news_api_provider)

}