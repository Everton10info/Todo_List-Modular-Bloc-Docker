import '../../../shared/app_http_client.dart';
import '../models/todo_model.dart';

class TodoRepository {
  final HttpClient _httpClient;

  TodoRepository(this._httpClient);

  Future getTodo() async {
    List todo = [];
    var response = await _httpClient.getHttp();
    for (var element in response) {
      todo.add(TodoModel.fromJson(element));
    }
    print(todo[0].name); //exemplo nome
    return todo;
  }
}
