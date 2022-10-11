import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../shared/core/http_client/app_http_client.dart';
import '../models/todo_model.dart';

class HomeRepository {
  final HttpClient _httpClient;

  HomeRepository(this._httpClient);

  Future<List<TodoModel>> getData() async {
    Response response = await _httpClient.getHttp();
    final result =
        (response.data as List).map((e) => TodoModel.fromJson(e)).toList();
    return result;
  }

  Future insertData(String name, bool check) async {
    try {
      var response = await _httpClient.posttHttp(name, check);

      return response;
    } catch (e) {
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
    Map<String, dynamic> data = {"id": id, "name": name, "completed": check};

    try {
      var response = await _httpClient.updateHttp(id, data);
      return response.data;
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}
