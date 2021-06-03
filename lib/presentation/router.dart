import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toto_block/presentation/screens/add_todo_screen.dart';
import 'package:flutter_toto_block/presentation/screens/edit_todo_screen.dart';
import 'package:flutter_toto_block/presentation/screens/todo_screen.dart';


class AppRouter{

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_)=>TodoScreen());
      case "/add_tod":
        return MaterialPageRoute(builder: (_)=>AddTodoScreen());
      case "/edit_todo":
        return MaterialPageRoute(builder: (_)=>EditTodoScreen());
      default:
        return null;
    }
  }


}