import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/modules/home/repositories/home_repository.dart';

import '../models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> items = [];
  TodoBloc() : super(TodoInitialState()) {
    var repository = Modular.get<HomeRepository>();

    on<TodoLoad>((event, emit) async {
      try {
        var items = await repository.getData();
        emit(TodoSuccessState(itemsTodo: items));
      } catch (error) {
        emit(TodoError(message: '$error'));
      }
    });

    on<TodoInsert>(((event, emit) async {
      if (event.item.isNotEmpty) {
        try {
          await repository.insertData(event.item, event.check);
          items = await repository.getData();
          emit(TodoSuccessState(itemsTodo: items));
        } catch (error) {
          emit(TodoError(message: '$error'));
        }
      }
    }));

    on<TodoEdit>(((event, emit) async {
      if (event.name.isNotEmpty) {
        try {
          await repository.updateData(event.id, event.name, event.completed);
          items = await repository.getData();
          emit(TodoSuccessState(itemsTodo: items));
        } catch (error) {
          emit(TodoError(message: '$error'));
        }
      }
    }));

    on<TodoDelete>(((event, emit) async {
      await repository.deleteData(event.id);
      items = await repository.getData();
      emit(TodoSuccessState(itemsTodo: items));
    }));
  }
}
