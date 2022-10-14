import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../../shared/core/http_client/app_http_client.dart';
import '../models/todo_model.dart';

class HomeRepository {
  final HttpClient _httpClient;

  HomeRepository(this._httpClient);

  Future<List<TodoModel>> getData() async {
    Response response = (await _httpClient.getHttp());

    final result = (jsonDecode(response.body) as List)
        .map((todo) => TodoModel.fromJson(todo))
        .toList();
    return result;
  }

  Future insertData(String name, bool check) async {
    var response = await _httpClient.posttHttp(name, check);
    debugPrint('post http + ${response.body}');
    return response.body;
  }

  Future deleteData(String id) async {
    var response = await _httpClient.deleteHttp(id);
    return response.body;
  }

  Future updateData(String id, String name, bool check) async {
    Map<String, dynamic> data = {"id": id, "name": name, "completed": check};

    var response = await _httpClient.updateHttp(id, data);
    return response.body;
  }
}
