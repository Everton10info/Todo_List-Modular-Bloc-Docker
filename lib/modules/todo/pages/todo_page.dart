import 'package:flutter/material.dart';
import 'package:modular_bloc_docker/shared/app_http_client.dart';
import 'package:modular_bloc_docker/modules/todo/repositories/todo_repository.dart';

class TodoPage extends StatelessWidget {
   TodoPage({super.key});
var repository =    TodoRepository(HttpClient());
  @override
  Widget build(BuildContext context) {
    repository.getTodo(); //apenas teste 
    return Scaffold(
      appBar: AppBar(title: const Text('Todo')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text('123'),
          Text('123'),
        ],
      ),
    );
  }
}
