import '../../../modules/home/models/todo_model.dart';

abstract class HttpClientInterface {
  Future getHttp();
  Future insertHttp(TodoModel todo);
  Future deleHttp(String id);
  Future updateHttp(TodoModel todo);
}
