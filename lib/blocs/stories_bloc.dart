import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/respository.dart';

class StoriesBloc {
  //todo 5
  final _repository = Repository();

  // todo 6 streamController topIds
  final _topIds = PublishSubject<List<int>>();
  // streamController fetchItem
  final _itemsOutput = BehaviorSubject<Map<int,Future<ItemModel>>>();
  final _itemsFetcher = PublishSubject<int>();

  //todo 10 // access stream transformer fetchItem with constructor
  StoriesBloc(){
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
    // pipe maksudnya setiap output event fetct item, akan otomatis di teruskan
    // ke _itemsOutput StreamController
  }

  // todo 7 getters to stream topIds
  Stream<List<int>> get topIds => _topIds.stream;
  // getters to stream fetchItem
  Stream<Map<int,Future<ItemModel>>> get items => _itemsOutput.stream;

  //todo 8 add to sinks
  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    print('ids : $ids');
    _topIds.sink.add(ids);
  }
  // add to sink fetchItem
  Function(int) get fetchItem => _itemsFetcher.sink.add;


  //todo 9 listen fetch item
  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int,Future<ItemModel?>>? cache, int id, index) {

        cache?[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel?>>{}, // initial value empty map
    );
  }

  //todo 11 (next main)
  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}
