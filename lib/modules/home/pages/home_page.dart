// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/shared/widgets/custom_dialog_widget.dart';

import '../bloc/todo_bloc.dart';
import '../models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController fieldAddTodo = TextEditingController();
  TextEditingController fieldEditionTodo = TextEditingController();
  final bloc = Modular.get<TodoBloc>();
  bool check = false;
  List<TodoModel> itemHome = [];

  @override
  void initState() {
    bloc.add(TodoLoad());
    super.initState();
  }

  Future<void> refreshTodo(BuildContext context) async {
    return bloc.add(
      TodoLoad(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          actions: [
            IconButton(
                onPressed: (() {
                  refreshTodo(context);
                }),
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: BlocListener<TodoBloc, TodoState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is TodoError) {
              showDialog(
                context: context,
                builder: ((context) {
                  return CustomDialog(
                    content: SizedBox(
                      height: height * 0.1,
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    callFunction: () {
                      Modular.to.pop();
                    },
                  );
                }),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: fieldAddTodo,
                    decoration: const InputDecoration(
                      hintText: 'Digite a tarefa',
                    )),
                _builderList(),
                SizedBox(
                  height: height * 0.02,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      bloc.add(
                        TodoInsert(
                          item: fieldAddTodo.text,
                          check: check,
                        ),
                      );
                      fieldAddTodo.text = '';
                      FocusScope.of(context).unfocus();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Insert')),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ));
  }

  Widget _builderList() {
    return Expanded(
      child: BlocBuilder<TodoBloc, TodoState>(
        bloc: bloc,
        builder: ((context, state) {
          if (state is TodoInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodoSuccessState) {
            return RefreshIndicator(
                onRefresh: () => refreshTodo(context),
                child: ListView.builder(
                  itemCount: state.itemsTodo.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey.shade300,
                      elevation: 4,
                      child: ListTile(
                        title: GestureDetector(
                          onDoubleTap: () {
                            showDialog(
                              context: context,
                              builder: ((context) {
                                return CustomDialog(
                                    content: TextField(
                                      controller: fieldEditionTodo =
                                          TextEditingController(
                                              text:
                                                  state.itemsTodo[index].name),
                                    ),
                                    callFunction: () {
                                      bloc.add(TodoEdit(
                                          name: fieldEditionTodo.text,
                                          completed:
                                              state.itemsTodo[index].completed!,
                                          id: state.itemsTodo[index].id!));
                                      Modular.to.pop();
                                    });
                              }),
                            );
                          },
                          child: Text(
                              textAlign: TextAlign.start,
                              state.itemsTodo[index].name!,
                              style: const TextStyle(
                                fontSize: 20,
                              )),
                        ),
                        leading: Checkbox(
                            value: state.itemsTodo[index].completed!,
                            onChanged: (check) {
                              bloc.add(TodoEdit(
                                  name: state.itemsTodo[index].name!,
                                  completed: check!,
                                  id: state.itemsTodo[index].id!));
                            }),
                        trailing: IconButton(
                          color: Colors.black54,
                          onPressed: () {
                            bloc.add(
                                TodoDelete(id: state.itemsTodo[index].id!));
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                ));
          }
          return Container();
        }),
      ),
    );
  }
}
