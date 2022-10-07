part of 'todo_bloc.dart';


abstract class TodoState {
  List<TodoModel> itemsTodo;
  TodoState({required this.itemsTodo});
}


class TodoInitial extends TodoState {
TodoInitial() : super(itemsTodo: []);
}

class TodoSuccess  extends TodoState {
 TodoSuccess({required List<TodoModel> itemsTodo}) : super(itemsTodo: []);
}
