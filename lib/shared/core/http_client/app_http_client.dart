import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:modular_bloc_docker/shared/core/http_client/app_api.dart';

class HttpClient {
  final _http = _createHttp();

  var appApi = Modular.get<AppApi>();

  String errorServer = 'Ops, sem conexão, tente mais tarde!';

  static Client _createHttp() {
    var http = Client();
    return http;
  }

  Future<Response> getHttp() async {
    try {
      Response response = await _http.get(
        Uri.parse(appApi.baseUrl + appApi.itemsRoute),
      );
      return response;
    } catch (e) {
      throw errorServer;
    }
  }

  Future<Response> posttHttp(String name, bool check) async {
    var header = {'Content-Type': 'application/json'};
    var bodyTodo = {"name": name, "completed": check};
    try {
      Response response = await _http.post(
          Uri.parse(appApi.baseUrl + appApi.itemsRoute),
          headers: header,
          body: jsonEncode(bodyTodo));

      return response;
    } catch (e) {
      throw errorServer;
    }
  }

  Future<Response> deleteHttp(String id) async {
    try {
      var response = await _http
          .delete(Uri.parse(appApi.baseUrl + appApi.itemsRoute + id));
      debugPrint('${response.statusCode}');
      return response;
    } catch (e) {
      throw errorServer;
    }
  }

  Future<Response> updateHttp(String id, body) async {
    var header = {'Content-Type': 'application/json'};
    try {
      var response = await _http.put(
          Uri.parse(appApi.baseUrl + appApi.itemsRoute + id),
          headers: header,
          body: jsonEncode(body));
      return response;
    } catch (e) {
      throw errorServer;
    }
  }
}
