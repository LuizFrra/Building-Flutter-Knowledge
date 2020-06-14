import 'package:todolist/Models/Todo.dart';

class TodoViewModel {
  final Todo _todo;

  TodoViewModel(this._todo);

  String get task {
    return this._todo.task;
  }

  bool get isDone {
    return this._todo.isDone;
  }

  bool toggleIsDone() {
    _todo.isDone = !_todo.isDone;
  }

}