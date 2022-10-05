import 'package:flutter/foundation.dart';

import '../../../shared/helpers/app_http_client.dart';
import '../models/todo_model.dart';

class HomeRepository {
  final HttpClient _httpClient;

  HomeRepository(this._httpClient);

  Future<List<TodoModel>> getData() async {
    try {
      var response = await _httpClient.getHttp();
      return (response.data as List).map((e) => TodoModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  Future<List<TodoModel>> setData(String name, bool completed) async {
    try {
      var response = await _httpClient.posttHttp(name, completed);
      return response;
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  Future<List<TodoModel>> deleteData(String id) async {
    try {
      var response = await _httpClient.deleteHttp(id);
      return response;
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}
