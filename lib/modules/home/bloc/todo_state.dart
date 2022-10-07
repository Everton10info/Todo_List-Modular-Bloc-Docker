part of 'todo_bloc.dart';


abstract class TodoState {
  List<TodoModel> itemsTodo;
  TodoState({required this.itemsTodo});
}


class TodoInitialState extends TodoState {
TodoInitialState() : super(itemsTodo: []);
}

class TodoSuccessState  extends TodoState {
 TodoSuccessState({required List<TodoModel> itemsTodo}) : super(itemsTodo: []);
}
