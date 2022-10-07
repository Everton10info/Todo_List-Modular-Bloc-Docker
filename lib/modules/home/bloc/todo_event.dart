part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoLoad extends TodoEvent{}
class TodoInsert extends TodoEvent{
 final String item;

  TodoInsert(this.item);
}
