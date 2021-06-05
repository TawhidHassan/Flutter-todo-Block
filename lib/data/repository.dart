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
  
}