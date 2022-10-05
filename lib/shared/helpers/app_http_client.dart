import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClient {
  final _dio = _createDio();

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

  final baseUrl = 'http://192.168.0.103:3000/items';

  Future getHttp() async {
    try {
      return await _dio.get(baseUrl);
    } on DioError catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  Future posttHttp(String name, bool completed) async {
    try {
      var response = await _dio
          .post(baseUrl, data: {"name": name, "completed": completed});

      return response;
    } on DioError catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  Future deleteHttp(String id) async {
    try {
      var response = await _dio.delete(baseUrl + id);
      debugPrint('$response');
    } on DioError catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}
