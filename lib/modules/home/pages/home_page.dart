import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/todo_bloc.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var controller = Modular.get<HomeController>();

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<TodoBloc>();
  @override
  void initState() {
    bloc.add(TodoLoad());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    print(bloc.state.toString());
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
                child: BlocBuilder<TodoBloc, TodoState>(
                
                  bloc: bloc,
                  builder: ((context, state) {
                    if (state is TodoInitialState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is TodoSuccessState) {
                      final items = state.itemsTodo;

                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.grey.shade300,
                            elevation: 4,
                            child: ListTile(
                              title: Text(
                                items[index].name!,
                                style: const TextStyle(fontSize: 24),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    controller.deleteItems(
                                        controller.items[index].id!, index);
                                  });
                                  //
                                  //controller.updateItems(index,controller.items[index].id!,{'name': '2everton upadate', 'completed': false})
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() {
            setState(() {
              //  bloc.add(TodoInsert(controller.fieldAddTodo.text));
            });
          }),
          child: const Icon(Icons.add)),
    );
  }
}
