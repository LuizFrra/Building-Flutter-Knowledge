import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {

  Function onHandleAdd;

  TodoForm({this.onHandleAdd});

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {

  TextEditingController _taskInput;

  @override
  void initState() {
    // TODO: implement initState
    _taskInput = TextEditingController();
    _taskInput.addListener(handleTaskChanged);
    super.initState();
  }

  handleTaskChanged() {

  }

  void handleAdd() {
    if(widget.onHandleAdd != null)
      widget.onHandleAdd(_taskInput.text);
    _taskInput.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _taskInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextFormField(
            controller: _taskInput,
            decoration: InputDecoration(
                labelText: 'Nova Tarefa',
                labelStyle: TextStyle(color: Colors.blue, fontSize: 15)),
          )),
          RaisedButton(
            onPressed: handleAdd,
            textColor: Colors.white,
            color: Colors.blue,
            child: Container(
              child: const Text(
                'ADD',
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
