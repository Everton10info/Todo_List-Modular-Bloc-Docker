import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../modules/home/models/item_model.dart';
import 'app_api.dart';
import 'app_http_interface.dart';

class ClientHttp implements HttpClientInterface {
  String errorServer = 'Ops, sem conexão, tente mais tarde!';

  @override
  Future<Map<String, dynamic>> createHttp(ItemModel todo) async {
    var header = {'Content-Type': 'application/json'};
    try {
      Response response = await http.post(
          Uri.parse('${AppApi.baseUrl} ${AppApi.items}'),
          headers: header,
          body: jsonEncode(todo));
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<List> readHttp() async {
    try {
      Response response =
          await http.get(Uri.parse('${AppApi.baseUrl} ${AppApi.items}'));
      List data = jsonDecode(response.body);
      return data;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<dynamic> updateHttp(ItemModel todo) async {
    var header = {'Content-Type': 'application/json'};
    try {
      var response = await http.put(
          Uri.parse('${AppApi.baseUrl} ${AppApi.items}${todo.id}'),
          headers: header,
          body: jsonEncode(todo));
      return response.body;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<String> deleteHttp(String id) async {
    try {
      Response response = await http.delete(
        Uri.parse('${AppApi.baseUrl} ${AppApi.items}$id'),
      );
      return response.body;
    } catch (e) {
      throw errorServer;
    }
  }
}
