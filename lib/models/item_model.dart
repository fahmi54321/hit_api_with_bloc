
import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final int url;
  final String score;
  final String title;
  final List<dynamic> parts;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'] ?? 0,
        deleted = parsedJson['delete'] ?? false,
        type = parsedJson['type'] ?? '',
        by = parsedJson['by'] ??'',
        time = parsedJson['time'] ?? 0,
        text = parsedJson['text'] ??'',
        dead = parsedJson['dead'] ?? false,
        parent = parsedJson['parent'] ?? 0,
        kids = parsedJson['kids'] ??[],
        url = parsedJson['url'] ?? 0,
        score = parsedJson['score'] ?? '',
        title = parsedJson['title'] ?? '',
        parts = parsedJson['parts'] ?? [],
        descendants = parsedJson['descendants'] ?? 0;

  ItemModel.fromDb(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'] ?? 0,
        deleted = parsedJson['delete'] ?? 1,
        type = parsedJson['type'] ?? '',
        by = parsedJson['by'] ??'',
        time = parsedJson['time'] ?? 0,
        text = parsedJson['text'] ??'',
        dead = parsedJson['dead'] ?? 1,
        parent = parsedJson['parent'] ?? 0,
        kids = jsonDecode(parsedJson['kids'] ??[]),
        url = parsedJson['url'] ?? 0,
        score = parsedJson['score'] ?? '',
        title = parsedJson['title'] ?? '',
        parts = parsedJson['parts'] ?? [],
        descendants = parsedJson['descendants'] ?? 0;

  Map<String,dynamic> toMapForDb(){
    return<String,dynamic> {
        'id' : id,
        'type' : type,
        'by' : by,
        'time' : time,
        'text' : text,
        'parent' : parent,
        'url' : url,
        'score' : score,
        'title' : title,
        'descendants' : descendants,
        'dead' : dead==true ? 1 : 0, // db gak bisa menyimpan tipe boolean
        'delete' : deleted==true ? 1 : 0, // db gak bisa menyimpan tipe boolean
        'kids' : jsonEncode('kids'),
    };
  }

}