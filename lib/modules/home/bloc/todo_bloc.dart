import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/todo_model.dart';
import '../repositories/home_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> items = [];
  TodoBloc() : super(TodoInitialState()) {
    var repository = Modular.get<HomeRepository>();

    on<TodoLoad>((event, emit) async {
      emit(TodoInitialState());
      try {
        var items = await repository.getData();
        await Future.delayed(const Duration(seconds: 3));
        emit(TodoSuccessState(itemsTodo: items));
      } catch (error) {
        emit(TodoError(message: '$error'));
      }
    });

    on<TodoInsert>(
      ((event, emit) async {
        if (event.item.isNotEmpty) {
          try {
            await repository.insertData(event.item, event.check);
            items = await repository.getData();
            emit(TodoSuccessState(itemsTodo: items));
          } catch (error) {
            emit(TodoError(message: '$error'));
          }
        }
      }),
    );

    on<TodoEdit>(
      ((event, emit) async {
        if (event.name.isNotEmpty) {
          try {
            await repository.updateData(event.id, event.name, event.completed);
            items = await repository.getData();
            emit(TodoSuccessState(itemsTodo: items));
          } catch (error) {
            emit(TodoError(message: '$error'));
          }
        }
      }),
    );

    on<TodoDelete>(
      ((event, emit) async {
        try {
          await repository.deleteData(event.id);
          items = await repository.getData();
          emit(TodoSuccessState(itemsTodo: items));
        } catch (error) {
          emit(TodoError(message: '$error'));
        }
      }),
    );
  }
}
