import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_toto_block/cubit/todo_cubit.dart';
import 'package:flutter_toto_block/data/repository.dart';
import 'package:meta/meta.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {

  final Repository repository;
  final TodoCubit todoCubit;
  AddTodoCubit({this.todoCubit,this.repository}) : super(AddTodoInitial());

  void addTodo(String message) {
    if(message.isEmpty){
      emit(AddTodoError(error: "todo message is empty"));
      return;
    }
    
    emit(AddingTodo());
    Timer(Duration(seconds: 2),(){
      repository.addTodo(message).then((todo) {
        if (todo != null) {
          todoCubit.addTodo(todo);
          emit(TodoAdded());
        }
      });
    });
  }
}
