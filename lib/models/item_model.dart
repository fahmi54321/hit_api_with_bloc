
//todo 1 (next news_api_provider)
class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> poll;
  final String kids;
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
        poll = parsedJson['poll'] ?? [],
        kids = parsedJson['kids'] ??'',
        url = parsedJson['url'] ?? 0,
        score = parsedJson['score'] ?? '',
        title = parsedJson['title'] ?? '',
        parts = parsedJson['parts'] ?? [],
        descendants = parsedJson['descendants'] ?? 0;

}