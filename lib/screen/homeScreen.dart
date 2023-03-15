import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/widget/dialogBox.dart';
import 'package:todolist/widget/tiles.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _mybox = Hive.box('myBox');
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (_mybox.get("TODO") == null) {
      db.initialSate();
    } else {
      db.loadState();
    }
  }

  void updateTask(int index, bool? value) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateState();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateState();
  }

  void addNewTask() {
    setState(() {
      db.todoList.add(['${_controller.text}', false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text('Todo List')),
        backgroundColor: Color.fromARGB(31, 209, 201, 201),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTiles(
            taskName: db.todoList[index][0],
            value: db.todoList[index][1],
            onChange: (v) => updateTask(index, v),
            deleteTask: (v) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: showDialogBox,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  void showDialogBox() {
    showDialog(
      context: context,
      builder: (v) => Dialogbox(
        onCancel: () => Navigator.of(context).pop(),
        onSave: addNewTask,
        controller: _controller,
      ),
    );
  }
}
