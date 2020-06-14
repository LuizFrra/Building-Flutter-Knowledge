import 'package:flutter/material.dart';
import 'package:todolist/Models/Todo.dart';
import 'package:todolist/ViewModels/TodoListViewModel.dart';
import 'package:todolist/ViewModels/TodoViewModel.dart';
import 'package:todolist/Widgets/todo_form.dart';
import 'package:todolist/Widgets/todo_list.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TodoListViewModel todoListViewModel = TodoListViewModel();
  TodoViewModel lastRemovedTask;
  int lastRemovedIndex;

  void addTask(String input) {
    if (input == null || input.isEmpty) return;

    if (todoListViewModel.getByTask(input) != null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("$input Já Existe."),
      ));
    }

    setState(() {
      todoListViewModel.add(Todo(task: input));
    });
  }

  void undoRemove() {
    setState(() {
      todoListViewModel.addInPosition(
          Todo(task: lastRemovedTask.task, isDone: lastRemovedTask.isDone),
          lastRemovedIndex);
    });
  }

  TodoViewModel updateTodo(TodoViewModel todoViewModel, int index) {
    return todoListViewModel.updateTodo(todoViewModel, index);
  }

  TodoViewModel removeTodo(int index) {
    setState(() {
      TodoViewModel todoViewModel = todoListViewModel.removeTodo(index);
      lastRemovedIndex = index;
      String task = todoViewModel.task;
      lastRemovedTask = todoViewModel;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("$task Removida"),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            undoRemove();
          },
        ),
      ));
      return todoViewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          TodoForm(
            onHandleAdd: addTask,
          ),
          TodoList(todoListViewModel,
              updateTodo: updateTodo, removeTodo: removeTodo)
        ],
      ),
    );
  }
}
