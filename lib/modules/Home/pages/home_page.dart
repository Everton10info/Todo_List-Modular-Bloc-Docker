import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/modules/Home/models/todo_model.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var controller = Modular.get<HomeController>();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    controller.getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                  style: const TextStyle(fontSize: 20),
                  controller: controller.fieldAddTodo,
                  decoration: const InputDecoration(
                    hintText: 'Digite a tarefa',
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.8,
                child: ListView.builder(
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
                                controller.deleteItems(
                                    controller.items[index].id!, index);
                              });

                              //controller.updateItems(index,controller.items[index].id!,{'name': '2everton upadate', 'completed': false})
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() {
            setState(() {
              controller.setItems(controller.fieldAddTodo.text);
            });
          }),
          child: const Icon(Icons.add)),
    );
  }
}
