import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:modular_bloc_docker/modules/home/models/todo_model.dart';
import 'package:modular_bloc_docker/shared/core/http_client/app_http_interface.dart';

import 'app_api.dart';

class ClientHttp implements HttpClientInterface {
  String errorServer = 'Ops, sem conexão, tente mais tarde!';

  @override
  Future<String> deleHttp(String id) async {
    try {
      Response response = await http.delete(
        Uri.parse('${AppApi.baseUrl} ${AppApi.endPoint}$id'),
      );
      return response.body;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<List> getHttp() async {
    try {
      Response response =
          await http.get(Uri.parse('${AppApi.baseUrl} ${AppApi.endPoint}'));
      List data = jsonDecode(response.body);
      return data;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<Map<String, dynamic>> insertHttp(TodoModel todo) async {
    var header = {'Content-Type': 'application/json'};
    try {
      Response response = await http.post(
          Uri.parse('${AppApi.baseUrl} ${AppApi.endPoint}'),
          headers: header,
          body: jsonEncode(todo));
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future updateHttp(TodoModel todo) async {
    var header = {'Content-Type': 'application/json'};
    try {
      var response = await http.put(
          Uri.parse('${AppApi.baseUrl} ${AppApi.endPoint}${todo.id}'),
          headers: header,
          body: jsonEncode(todo));
      return response.body;
    } catch (e) {
      throw errorServer;
    }
  }
}
