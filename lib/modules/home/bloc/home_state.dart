part of 'home_bloc.dart';

abstract class HomeState {
  List<ItemModel> itemsTodo;
  HomeState({required this.itemsTodo});
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(itemsTodo: []);
}

class HomeSuccessState extends HomeState {
  HomeSuccessState({required List<ItemModel> itemsTodo})
      : super(itemsTodo: itemsTodo);
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message}) : super(itemsTodo: []);
}
