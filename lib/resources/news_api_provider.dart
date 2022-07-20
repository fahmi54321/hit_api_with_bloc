import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:hit_api_with_bloc/models/item_model.dart';

const _root = 'https://hacker-news.firebaseio.com/v0';

//todo 2 (finish)
class NewsApiProvider{

  Client client = Client();


  fetchTopId() async{
    final response = await client.get(Uri.parse('$_root/topstories.json'));

    final ids = json.decode(response.body);

    return ids;

  }

  fetchItem(int id) async{
    final response = await client.get(Uri.parse('$_root/item/$id.json'));
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);

  }
}