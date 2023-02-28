import 'package:flutter/material.dart';
import 'package:todolist/screen/homeScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}
