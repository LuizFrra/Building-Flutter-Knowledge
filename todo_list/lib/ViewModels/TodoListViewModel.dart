import 'package:flutter/material.dart';
import 'package:todolist/Models/Todo.dart';
import 'package:todolist/ViewModels/TodoViewModel.dart';

class TodoListViewModel {
  List<TodoViewModel> _todos = List<TodoViewModel>();

  TodoListViewModel() {
    _todos.add(TodoViewModel(Todo(task: 'Varrer a casa', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Ler Mistborn', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Estudar Flutter', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Estudar P.O', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Estudar A.P.A', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Estudar Cálculo', isDone: false)));
    _todos
        .add(TodoViewModel(Todo(task: 'Estudar Alguma Coisa', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Assistir Série', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Estudar S.O', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Assistir Dark', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Ver Facebook', isDone: false)));
    _todos.add(TodoViewModel(Todo(task: 'Ler Emails', isDone: false)));
  }

  void add(Todo todo) {
    return _todos.add(TodoViewModel(todo));
  }

  void addInPosition(Todo todo, int index) {
    _todos.insert(index, TodoViewModel(todo));
  }

  List<TodoViewModel> getAll() {
    return _todos;
  }

  TodoViewModel getByIndex(int index) {
    if (index >= _todos.length) return null;
    return _todos.elementAt(index);
  }

  TodoViewModel getByTask(String task) {
    return _todos.firstWhere((element) => element.task == task, orElse: () {
      return null;
    });
  }

  Iterable<TodoViewModel> getWhereIsDoneEqual(bool isDone) {
    return _todos.where((element) => element.isDone == isDone);
  }

  int getLenght() {
    return _todos.length;
  }

  TodoViewModel updateTodo(TodoViewModel todoViewModel, int index) {
    _todos.replaceRange(index, index + 1, [todoViewModel]);
    return _todos.elementAt(index);
  }

  TodoViewModel removeTodo(int index) {
    return _todos.removeAt(index);
  }
}
