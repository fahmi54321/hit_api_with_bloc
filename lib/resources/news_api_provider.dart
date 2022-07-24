import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:hit_api_with_bloc/models/item_model.dart';
import 'respository.dart';

const _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source{

  Client client = Client();


  @override
  Future<List<int>> fetchTopIds() async{
    final response = await client.get(Uri.parse('$_root/topstories.json'));

    final ids = json.decode(response.body);

    return ids.cast<int>();

  }

  @override
  Future<ItemModel?> fetchItem(int id) async{
    final response = await client.get(Uri.parse('$_root/item/$id.json'));
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);

  }
}