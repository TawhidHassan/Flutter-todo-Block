import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toto_block/constants/strings.dart';
import 'package:flutter_toto_block/cubit/todo_cubit.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    BlocProvider.of<TodoCubit>(context).ferchTodos();

    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, ADD_TODO_ROUTE),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Center(
        child: Text("sss"),
      ),
    );
  }
}
