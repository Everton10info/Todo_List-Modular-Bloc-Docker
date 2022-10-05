import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var controller = Modular.get<HomeController>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    controller.getItems();
    return Scaffold(
        appBar: AppBar(title: const Text('Todo List'),),
        body: ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.items[index].name!),
              subtitle: Text(controller.items[index].completed.toString()),
            );
          },
        ));
  }
}
