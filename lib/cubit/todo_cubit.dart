import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toto_block/data/models/todo.dart';
import 'package:flutter_toto_block/data/repository.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {

  final Repository repository;

  TodoCubit({this.repository}) : super(TodoInitial());

  void ferchTodos() {
    Timer(Duration(seconds: 3), () {
      repository.fetchTodos().then((todos){
        emit(TodoLoaded(todos: todos));
      });
    });
  }

  void changeCompletion(Todo todo) {
      repository.changeCompletion(!todo.isCompleted,todo.id).then((isChange) {

        if(isChange){
          todo.isCompleted=!todo.isCompleted;
          updateTodoList();
        }
      });
  }

  void updateTodoList() {
    final currentState = state;
    if (currentState is TodoLoaded)
      emit(TodoLoaded(todos: currentState.todos));
  }
}
