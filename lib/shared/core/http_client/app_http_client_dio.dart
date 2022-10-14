import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/shared/core/http_client/app_api.dart';

class HttpClient {
  final _dio = _createDio();

  var appApi = Modular.get<AppApi>();
  String errorServer = 'Ops, sem conexão, tente mais tarde!';

  static Dio _createDio() {
    var dio = Dio(
      BaseOptions(
        receiveTimeout: 15000,
        connectTimeout: 15000,
        sendTimeout: 1500,
      ),
    );

    return dio;
  }

  Future<Response> getHttp() async {
    try {
      Response response = await _dio.get(appApi.baseUrl + appApi.itemsRoute);
      return response;
    } on DioError catch (e) {
      debugPrint('${e.error}');
      throw errorServer;
    }
  }

  Future<Response> posttHttp(String name, bool check) async {
    try {
      Response response = await _dio.post(appApi.baseUrl + appApi.itemsRoute,
          data: {"name": name, "completed": check});
      return response;
    } on DioError catch (e) {
      debugPrint('${e.error}');
      throw errorServer;
    }
  }

  Future<Response> deleteHttp(String id) async {
    try {
      var response = await _dio.delete(appApi.baseUrl + appApi.itemsRoute + id);
      debugPrint('${response.statusCode}');
      return response;
    } on DioError catch (e) {
      debugPrint('${e.error}');
      throw errorServer;
    }
  }

  Future<Response> updateHttp(String id, data) async {
    try {
      var response =
          await _dio.put(appApi.baseUrl + appApi.itemsRoute + id, data: data);
      return response;
    } on DioError catch (e) {
      debugPrint('${e.error}');
      throw errorServer;
    }
  }
}
