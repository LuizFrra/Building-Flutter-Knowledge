import 'package:flutter/material.dart';
import 'package:todolist/ViewModels/TodoViewModel.dart';

class TodoItem extends StatefulWidget {
  TodoViewModel _todoViewModel;
  Function updateTodo;
  Function removeTodo;
  int index = 0;

  TodoItem(this._todoViewModel, this.index, {this.updateTodo, this.removeTodo});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  void update() {
    widget._todoViewModel.toggleIsDone();
    widget._todoViewModel =
        widget.updateTodo(widget._todoViewModel, widget.index);
  }

  Widget myIconButton(Color color) {
    return Ink(
      child: IconButton(
        icon: Icon(Icons.done),
        color: color,
        onPressed: () {
          setState(() {
            update();
          });
        },
      ),
    );
  }

  void handleDismiss(DismissDirection direction) {
    print(direction);
    if (DismissDirection.startToEnd == direction) {
      widget.removeTodo(widget.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Dismissible(
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Colors.red,
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
              padding: EdgeInsets.only(left: 10), child: Icon(Icons.delete, color: Colors.white,)),
        ),
        onDismissed: handleDismiss,
        key: Key(widget._todoViewModel.task),
        child: ListTile(
            title: Text(widget._todoViewModel.task),
            trailing: myIconButton(widget._todoViewModel.isDone == true
                ? Colors.green
                : Colors.grey)),
      ),
    );
  }
}
