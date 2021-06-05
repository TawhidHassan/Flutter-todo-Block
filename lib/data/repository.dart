import 'package:flutter_toto_block/data/models/todo.dart';
import 'package:flutter_toto_block/data/network-service.dart';

class Repository{

  final NetworkService networkService;

  Repository({this.networkService});

  Future<List<Todo>> fetchTodos() async {
    final todoRaw=await networkService.fetchTodos();
    // print(todoRaw);
    return todoRaw.map((e) => Todo.fromJson(e)).toList();
  }

  Future<bool> changeCompletion(bool isCompleted, int id) async{
    final patchObj = { "isCompleted": isCompleted.toString() };
    return await networkService.patchTodo(patchObj, id);
  }

  Future<Todo> addTodo(String message) async {
    final todoObj = { "todo": message, "isCompleted": "false" };

    final todoMap = await networkService.addTodo(todoObj);
    if (todoMap == null) return null;

    return Todo.fromJson(todoMap);

  }

  Future<bool> updateTodo(String message, int id) async{
    final patchObj = { "todo": message };
    return await networkService.patchTodo(patchObj, id);
  }

  Future<bool> deleteTodo(int id) async {
    return await networkService.deleteTodo(id);
  }


  
}