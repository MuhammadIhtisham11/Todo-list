import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todolist/widget/mybutton.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  Dialogbox(
      {required this.onCancel,
      required this.onSave,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add New Task',
                hintStyle: TextStyle(color: Colors.green),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(btnName: 'Cancel', OnClick: onCancel),
                Gap(5),
                MyButton(btnName: 'Save', OnClick: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
