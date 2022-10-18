part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoad extends HomeEvent {}

class HomeCreateItemEvent extends HomeEvent {
  final String item;
  final bool check;
  HomeCreateItemEvent({required this.item, required this.check});
}

class HomeDeleteItemEvent extends HomeEvent {
  final String id;

  HomeDeleteItemEvent({required this.id});
}

class HomeEditItemEvent extends HomeEvent {
  final String id;
  final String name;
  final bool completed;

  HomeEditItemEvent({required this.name, required this.completed, required this.id});
}
