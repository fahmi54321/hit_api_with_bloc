import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';

class NewListTile extends StatelessWidget {
  int itemId;

  NewListTile({
    Key? key,
    required this.itemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //todo 17
    final bloc = StoriesProvider.of(context);

    //todo 18
    return StreamBuilder(
      stream: bloc.items,
      builder: (
        context,
        AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return Text('Stream still loading');
        }

        //todo 19 (finish)
        return FutureBuilder(future: snapshot.data?[itemId],builder: (context,AsyncSnapshot<ItemModel> itemSnapshot){
          if(!itemSnapshot.hasData){
            return Text('Still loading item $itemId');
          }

          return Text(itemSnapshot.data?.title??'');

        },);
      },
    );
  }
}
