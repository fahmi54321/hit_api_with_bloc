import 'package:flutter/material.dart';
import 'package:hit_api_with_bloc/blocs/stories_bloc.dart';
import 'stories_bloc.dart';
// agar nanti class StoriesBloc bisa terbaca di widget, next new_list_page
export 'stories_bloc.dart';

class StoriesProvider extends InheritedWidget{

  //todo 1
  final StoriesBloc bloc;

  //todo 2
  StoriesProvider({Key? key, required Widget child})
      : bloc = StoriesBloc(),
        super(key: key, child: child);

  //todo 3
  @override
  bool updateShouldNotify(StoriesProvider oldWidget) {
    return true;
  }

  //todo 4 (next stories_bloc)
  static StoriesBloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<StoriesProvider>() as StoriesProvider).bloc;
  }

}