import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toto_block/constants/strings.dart';
import 'package:flutter_toto_block/cubit/todo_cubit.dart';
import 'package:flutter_toto_block/data/network-service.dart';
import 'package:flutter_toto_block/data/repository.dart';
import 'package:flutter_toto_block/presentation/screens/add_todo_screen.dart';
import 'package:flutter_toto_block/presentation/screens/edit_todo_screen.dart';
import 'package:flutter_toto_block/presentation/screens/todo_screen.dart';


class AppRouter{

  Repository repository;

  AppRouter(){
    repository=Repository(networkService: NetworkService());
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context)=> TodoCubit(repository: repository),
            child: TodoScreen(),
          ),
        );
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            child: EditTodoScreen(),
          ),
        );
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            child: AddTodoScreen(),
          ),
        );
      default:
        return null;
    }
  }


}