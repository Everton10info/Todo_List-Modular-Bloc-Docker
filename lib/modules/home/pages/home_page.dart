import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../bloc/todo_bloc.dart';

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

  @override
  void initState() {
    bloc.add(TodoLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Padding(
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
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: BlocBuilder<TodoBloc, TodoState>(
                bloc: bloc,
                builder: ((context, state) {
                  if (state is TodoInitialState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TodoSuccessState) {
                    return ListView.builder(
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
                                    return AlertDialog(
                                      content: TextField(
                                        style: const TextStyle(fontSize: 20),
                                        controller: fieldEditionTodo =
                                            TextEditingController(
                                                text: state
                                                    .itemsTodo[index].name),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            bloc.add(TodoEdit(
                                                name: fieldEditionTodo.text,
                                                completed: state
                                                    .itemsTodo[index]
                                                    .completed!,
                                                id: state
                                                    .itemsTodo[index].id!));
                                            fieldEditionTodo.text = '';
                                            Modular.to.pop();
                                          },
                                          child: const Text('OK'),
                                        )
                                      ],
                                    );
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
                    );
                  }
                  return Container();
                }),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  bloc.add(TodoInsert(check: check, item: fieldAddTodo.text));
                  fieldAddTodo.text = '';
                },
                icon: const Icon(Icons.add),
                label: const Text('Insert')),
            SizedBox(height: height * 0.02)
          ],
        ),
      ),
    );
  }
}
