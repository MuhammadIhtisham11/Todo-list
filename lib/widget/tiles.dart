import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Tile extends StatelessWidget {
  String nameTask;
  bool taskCompleted;
  Function(bool?)? onchangeMethod;
  Function(BuildContext) deleteFunction;
  Tile(
      {super.key,
      required this.nameTask,
      required this.taskCompleted,
      required this.onchangeMethod,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 20, left: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onchangeMethod,
                activeColor: Colors.black,
              ),
              Text(
                '$nameTask',
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
