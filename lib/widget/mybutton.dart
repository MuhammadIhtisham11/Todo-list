import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String name;
  VoidCallback onClick;
  MyButton({super.key, required this.name, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.black,
      color: Theme.of(context).primaryColor,
      onPressed: onClick,
      child: Text('$name'),
    );
  }
}
