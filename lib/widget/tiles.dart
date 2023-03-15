import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

class TodoTiles extends StatelessWidget {
  String taskName;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteTask;
  bool value;
  TodoTiles({
    super.key,
    required this.taskName,
    required this.value,
    required this.onChange,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          Gap(20),
          SlidableAction(
            backgroundColor: Colors.white,
            onPressed: deleteTask,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.green),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: onChange,
                checkColor: Colors.green,
                activeColor: Colors.black,
                hoverColor: Colors.blue,
              ),
              Gap(5),
              Text(
                '$taskName',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
