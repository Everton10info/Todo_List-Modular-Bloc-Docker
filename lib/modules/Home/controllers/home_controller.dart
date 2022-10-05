import 'package:modular_bloc_docker/modules/Home/models/todo_model.dart';

import '../repositories/home_repository.dart';

class HomeController {
  final HomeRepository repository;

  HomeController(this.repository);

  List<TodoModel> items = [];

  Future<List<TodoModel>> getItems() async {
    items = await repository.getData();
    return items;
  }

  Future<List<TodoModel>> setItems(String name, bool completed) async {
    return await repository.setData(name, completed);
  }

  Future<List<TodoModel>> deleteItems(String id) async {
    return await repository.deleteData(id);
  }
}
