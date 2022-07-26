import 'package:flutter/material.dart';
import 'package:hit_api_with_bloc/widgets/new_list_tile.dart';
import '../blocs/stories_provider.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo 13 initial bloc
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  //todo 14 (next stories_provider)
  Widget buildList(StoriesBloc bloc) {
    //todo 15 fetch data ids
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (
            context,
            int index,
          ) {
            //todo 16 fetch data item (next new_list_tile)
            return NewListTile(
              itemId: snapshot.data?[index] ?? 0,
            );
          },
        );
      },
    );
  }
}
