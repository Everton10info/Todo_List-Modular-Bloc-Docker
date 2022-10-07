part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoLoad extends TodoEvent {}

class TodoInsert extends TodoEvent {
  final String item;
  final bool check;
  TodoInsert({required this.item, required this.check});
}

class TodoDelete extends TodoEvent {
  final String id;

  TodoDelete({required this.id});
}

class TodoEdit extends TodoEvent {
  final String id;
  final String name;
  final bool completed;

  TodoEdit({required this.name, required this.completed, required this.id});
}
