import 'package:flutter/material.dart';
import 'package:flutter_toto_block/presentation/router.dart';
import 'package:flutter_toto_block/presentation/screens/todo_screen.dart';

void main() {
  runApp(MyApp(
    router: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {

  final AppRouter router;

  const MyApp({Key key, this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     onGenerateRoute: router.generateRoute,
    );
  }
}
