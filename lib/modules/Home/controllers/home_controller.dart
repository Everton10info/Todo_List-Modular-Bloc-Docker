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

  Future setItems(String name, bool completed) async {
    return await repository.setData(name, completed);
  }

  Future  deleteItems(String id) async {
    return await repository.deleteData(id);
  }
Map<String,dynamic> eu = {'name':'everton', 'completed': true};
  Future updateItems(String id, eu) async {
    return await repository.updateData(id,eu);
  }
}
