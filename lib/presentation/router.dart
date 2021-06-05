import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toto_block/constants/strings.dart';
import 'package:flutter_toto_block/cubit/add_todo_cubit.dart';
import 'package:flutter_toto_block/cubit/edit_todo_cubit.dart';
import 'package:flutter_toto_block/cubit/todo_cubit.dart';
import 'package:flutter_toto_block/data/models/todo.dart';
import 'package:flutter_toto_block/data/network-service.dart';
import 'package:flutter_toto_block/data/repository.dart';
import 'package:flutter_toto_block/presentation/screens/add_todo_screen.dart';
import 'package:flutter_toto_block/presentation/screens/edit_todo_screen.dart';
import 'package:flutter_toto_block/presentation/screens/todo_screen.dart';


class AppRouter{

  Repository repository;
  TodoCubit todosCubit;



  AppRouter(){
    repository=Repository(networkService: NetworkService());
    todosCubit=TodoCubit(repository: repository);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: todosCubit,
            child: TodoScreen(),
          ),
        );
      case EDIT_TODO_ROUTE:
        final todo = settings.arguments as Todo;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => EditTodoCubit(
              repository: repository,
              todosCubit: todosCubit,
            ),
            child: EditTodoScreen(todo: todo),
          ),
        );
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddTodoCubit(repository: repository,todoCubit: todosCubit),
            child: AddTodoScreen(),
          ),
        );
      default:
        return null;
    }
  }


}