import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todolist/widget/mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade400,
      content: Container(
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter New Task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  name: 'Save',
                  onClick: onSave,
                ),
                Gap(5),
                MyButton(
                  name: 'Cancel',
                  onClick: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
