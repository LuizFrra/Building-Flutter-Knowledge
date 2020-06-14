import 'package:flutter/material.dart';
import 'package:todolist/ViewModels/TodoListViewModel.dart';
import 'package:todolist/ViewModels/TodoViewModel.dart';
import 'package:todolist/Widgets/todo_item.dart';

class TodoList extends StatefulWidget {

  TodoListViewModel todoListViewModel;
  Function updateTodo;
  Function removeTodo;

  TodoList(this.todoListViewModel, {this.updateTodo, this.removeTodo});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.todoListViewModel.getLenght(),
          itemBuilder: (context, item) {
            TodoViewModel todoViewModel =
                widget.todoListViewModel.getByIndex(item);

            return TodoItem(todoViewModel, item, updateTodo: widget.updateTodo, removeTodo: widget.removeTodo);
          }),
    );
  }
}
