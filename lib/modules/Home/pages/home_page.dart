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
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey.shade300,
                elevation: 4,
                child: ListTile(
                  title: Text(
                    controller.items[index].name!,
                    style: const TextStyle(fontSize: 24),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                       // controller.setItems('everton', true);// teste
                        controller.deleteItems(controller.items[index].id!);
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ));
          },
        ));
  }
}
