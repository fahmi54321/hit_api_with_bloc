import 'package:flutter/material.dart';
import 'package:hit_api_with_bloc/pages/news_list_page.dart';
import 'blocs/stories_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoriesProvider( //todo 12 (next news_list_page)
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsListPage(),
      ),
    );
  }
}
