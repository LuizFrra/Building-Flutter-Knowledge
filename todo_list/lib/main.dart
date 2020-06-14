import 'package:flutter/material.dart';
import 'package:todolist/Models/Todo.dart';
import 'package:todolist/Pages/todo_list_page.dart';
import 'package:todolist/Widgets/todo_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Tarefas '),
          centerTitle: true,
        ),
        body: TodoListPage()
      ),
    );
  }
}
