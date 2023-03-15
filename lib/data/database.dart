import 'dart:ffi';

import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  final _mybox = Hive.box('myBox');
  List todoList = [];
  void initialSate() {
    todoList = [
      ['Do Excerise', false],
      ['Do Coding', true]
    ];
  }

  void loadState() {
    todoList = _mybox.get("TODO");
  }

  void updateState() {
    _mybox.put('TODO', todoList);
  }
}

final db = DataBase();
