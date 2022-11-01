import 'package:dio/dio.dart';
import 'app_api.dart';
import 'app_http_interface.dart';

import '../../../../modules/home/models/item_model.dart';

class ClientDio implements HttpClientInterface {
  final _dio = _createDio();

  String errorServer = 'Server error, try again later!';

  static Dio _createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: AppApi.baseUrl,
        receiveTimeout: 15000,
        connectTimeout: 15000,
        sendTimeout: 1500,
      ),
    );

    return dio;
  }

  @override
  Future<Map<String, dynamic>> createHttp(ItemModel todo) async {
    try {
      Response response = await _dio.post(AppApi.items, data: todo);
      Map<String, dynamic> data = (response.data);
      return data;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<List> readHttp() async {
    try {
      Response response = await _dio.get(AppApi.items);
      List data = (response.data);
      return data;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<dynamic> updateHttp(ItemModel todo) async {
    try {
      var response = await _dio.put('${AppApi.items}${todo.id}', data: todo);
      return response;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<String> deleteHttp(String id) async {
    try {
      Response response = await _dio.delete(AppApi.items + id);

      return response.data;
    } catch (e) {
      throw errorServer;
    }
  }
}
