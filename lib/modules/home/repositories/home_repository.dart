import '../../../shared/core/http_client/app_http_interface.dart';
import '../models/todo_model.dart';

class HomeRepository {
  final HttpClientInterface _httpClient;

  HomeRepository(this._httpClient);

  Future<List<TodoModel>> getData() async {
    List response = await _httpClient.getHttp();
    final result = (response).map((todo) => TodoModel.fromJson(todo)).toList();

    return result;
  }

  Future insertData(String name, bool check) async {
    var response =
        await _httpClient.insertHttp(TodoModel(name: name, completed: check));
    return response;
  }

  Future deleteData(String id) async {
    var response = await _httpClient.deleHttp(id);
    return response;
  }

  Future updateData(String id, String name, bool check) async {
    var response = await _httpClient
        .updateHttp(TodoModel(id: id, name: name, completed: check));
    return response;
  }
}
