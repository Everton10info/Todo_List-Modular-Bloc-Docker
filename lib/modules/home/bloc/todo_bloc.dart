import 'package:flutter/material.dart';
import 'package:modular_bloc_docker/modules/home/repositories/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitialState()) {
    var repo = Modular.get<HomeRepository>();
    on<TodoLoad>((event, emit) async {

      List<TodoModel> items = [];
      items = await repo.getData();
    
      emit(TodoSuccessState(itemsTodo: items));
    });
  }
}


