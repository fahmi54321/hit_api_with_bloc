import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:hit_api_with_bloc/models/item_model.dart';
import 'respository.dart';

const _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source{ //todo 7

  Client client = Client();


  @override //todo 8 (tambah anotasi override)
  Future<List<int>> fetchTopIds() async{
    final response = await client.get(Uri.parse('$_root/topstories.json'));

    final ids = json.decode(response.body);

    return ids.cast<int>();

  }

  @override //todo 9 (tambah anotasi override, next news_db_provider)
  Future<ItemModel?> fetchItem(int id) async{
    final response = await client.get(Uri.parse('$_root/item/$id.json'));
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);

  }
}