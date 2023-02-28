import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/widget/dialogBox.dart';
import 'package:todolist/widget/tiles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _mybox = Hive.box('mybox');
  DataBase db = DataBase();
  final _controller = TextEditingController();
  @override
  void initState() {
    if (_mybox.get('TODOLIST') == null) {
      db.intialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkedBoxChanged(int index, bool? value) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (v) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Center(child: Text('To Do List')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addNewTask,
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return Tile(
              nameTask: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onchangeMethod: (value) => checkedBoxChanged(index, value),
              deleteFunction: (value) => deleteTask(index),
            );
          }),
    );
  }
}
