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

  Future setData(String name, bool check) async {
    try {
      var response = await _httpClient.posttHttp(name, check);
      return response.data;
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  Future deleteData(String id) async {
    try {
      var response = await _httpClient.deleteHttp(id);
      return response;
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  Future updateData(String id, String name, bool check) async {

    Map<String,dynamic> data = {"id": id, "name": name, "completed": check};

    try {
      var response = await _httpClient.updateHttp(id, data);
      return response.data;
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}
