import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/item_model.dart';
import '../repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<ItemModel> items = [];
  HomeBloc() : super(HomeInitialState()) {
    var repository = Modular.get<HomeRepository>();

    on<HomeLoad>((event, emit) async {
      emit(HomeInitialState());
      try {
        var items = await repository.readData();
        await Future.delayed(const Duration(seconds: 3));
        emit(HomeSuccessState(itemsTodo: items));
      } catch (error) {
        emit(HomeErrorState(message: '$error'));
      }
    });

    on<HomeCreateItemEvent>(
      ((event, emit) async {
        try {
          await repository.createData(event.item, event.check);
          items = await repository.readData();
          emit(HomeSuccessState(itemsTodo: items));
        } catch (error) {
          emit(HomeErrorState(message: '$error'));
        }
      }),
    );

    on<HomeEditItemEvent>(
      ((event, emit) async {
        if (event.name.isNotEmpty) {
          try {
            await repository.updateData(event.id, event.name, event.completed);
            items = await repository.readData();
            emit(HomeSuccessState(itemsTodo: items));
          } catch (error) {
            emit(HomeErrorState(message: '$error'));
          }
        }
      }),
    );

    on<HomeDeleteItemEvent>(
      ((event, emit) async {
        try {
          await repository.deleteData(event.id);
          items = await repository.readData();
          emit(HomeSuccessState(itemsTodo: items));
        } catch (error) {
          emit(HomeErrorState(message: '$error'));
        }
      }),
    );
  }
}
