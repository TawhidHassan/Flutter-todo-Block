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
}
