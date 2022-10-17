import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:modular_bloc_docker/shared/core/http_client/app_api.dart';
import 'package:modular_bloc_docker/shared/core/http_client/app_http_interface.dart';

import '../../../modules/home/models/todo_model.dart';

class ClientDio implements HttpClientInterface {
  final _dio = _createDio();

  String errorServer = 'Ops, sem conexão, tente mais tarde!';

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
  Future<String> deleHttp(String id) async {
    try {
      Response response = await _dio.delete(AppApi.endPoint + id);

      return response.data;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<List> getHttp() async {
    try {
      Response response = await _dio.get(AppApi.endPoint);
      List data = (response.data);
      return data;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future<Map<String, dynamic>> insertHttp(TodoModel todo) async {
    try {
      Response response = await _dio.post(AppApi.endPoint, data: todo);
      Map<String, dynamic> data = (response.data);
      return data;
    } catch (e) {
      throw errorServer;
    }
  }

  @override
  Future updateHttp(TodoModel todo) async {
    try {
      var response = await _dio.put('${AppApi.endPoint}${todo.id}', data: todo);
      return response;
    } catch (e) {
      throw errorServer;
    }
  }
}
