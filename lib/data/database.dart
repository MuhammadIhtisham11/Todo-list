import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  final _mybox = Hive.box('mybox');
  List todoList = [];
  void intialData() {
    todoList = [
      ['Make Tutorial', false],
      ['Do Exercise', false],
    ];
  }

  void loadData() {
    todoList = _mybox.get('TODOLIST');
  }

  void updateData() {
    _mybox.put("TODOLIST", todoList);
  }
}
