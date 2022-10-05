import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
class HttpClient{

final baseUrl = 'http://192.168.0.103:3000/items';

Future getHttp() async {

  try {
    var response = await Dio().get(baseUrl);
    debugPrint('testeee + ${response.data[0]}');
  return(response).data;
  } catch (e) {
   debugPrint('$e');
  }

}

Future posttHttp(String name, bool completed) async {

  try {
    var response = await Dio().post(baseUrl,data: {
      "name": name,
      "completed": completed
    });
   // debugPrint('$response');
  } catch (e) {
   debugPrint('$e');
  }
}

Future deleteHttp(String id) async {

  try {
    var response = await Dio().delete(baseUrl + id);
    debugPrint('$response');
  } catch (e) {
   debugPrint('$e');
  }
}

}