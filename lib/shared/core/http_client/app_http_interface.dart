import '../../../../modules/home/models/item_model.dart';

abstract class HttpClientInterface {
  Future<Map<String, dynamic>> createHttp(ItemModel todo);
  Future<List> readHttp();
  Future<dynamic> updateHttp(ItemModel todo);
  Future<String> deleteHttp(String id);
}
