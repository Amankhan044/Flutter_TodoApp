import 'package:flutter/material.dart';
import 'package:todo_app/screens/todoscreen/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        "/": (context) => const TodoListPagState(),
      },
    );
  }
}
