import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String btnName;
  VoidCallback OnClick;
  MyButton({super.key, required this.btnName, required this.OnClick});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: OnClick,
      child: Text(
        '$btnName',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
