//todo 1 penamaan file dan lokasinya harus sama dengan file tujuan

import 'package:flutter_test/flutter_test.dart';
import 'package:hit_api_with_bloc/models/item_model.dart';
import 'package:hit_api_with_bloc/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){

  // //todo 2 (example test)
  // test('FetchTop Id returns a list of ids', (){
  //
  //   //todo 3
  //   // setup of test case
  //   final sum = 1+3;
  //
  //   //todo 4
  //   // expectation
  //   expect(sum, 4);
  //
  //   // todo 5 (ketikkan perintah "flutter test")
  //   // todo 6 "all test passed" berarti test sesuai ekpetasi
  //   // todo 7 misal "expect(sum, 5);" maka akan muncul pesan "some test failed"
  //   //        Expected : <5>
  //   //        Actual : <4>
  // });


  //todo 8 test news api provider
  test('FetchTop Id returns a list of ids', () async{

    //todo 9
    final newsApi = NewsApiProvider();
    newsApi.client =  MockClient((request) async{
      return Response(json.encode([1,2,3,4]),200);
    });

    //todo 10
    final ids = await newsApi.fetchTopId();

    //todo 11
    expect(ids, [1,2,3,4]);

    //todo 12 (ketikkan perintah "flutter test")

  });

  //todo 13
  test('FetchItem returns a item model', () async{

    //todo 14
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async{
      final jsonMap = {'id' : 123}; // json harus sesuai dengan respon api nya
      return Response(json.encode(jsonMap),200);
    });

    //todo 15
    ItemModel item = await newsApi.fetchItem(999);

    //todo 16 (finish)
    expect(item.id,123);

  });

}