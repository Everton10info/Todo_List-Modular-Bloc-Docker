import 'package:flutter/material.dart';
import 'package:modular_bloc_docker/modules/home/models/todo_model.dart';

import '../repositories/home_repository.dart';

class HomeController {
  final HomeRepository repository;

  HomeController(this.repository);
  List<TodoModel> items = [];

  var fieldAddTodo = TextEditingController();

  Future<List<TodoModel>> getItems() async {
    items = await repository.getData();
    return items;
  }

  Future setItems(String name) async {
    Map<String, dynamic> map = await repository.setData(name);
    //await getItems();
    items.add(TodoModel.fromJson(map));
  }

  Future deleteItems(String id, int index) async {
    items.removeAt(index);
    await repository.deleteData(id);
  }

  Future updateItems(int index, String id, Map<String, dynamic> item) async {
    Map<String, dynamic> map = await repository.updateData(id, item);
    items[index] = TodoModel.fromJson(map);
    return items[index];
  }
}
