import 'package:flutter/material.dart';
import './model.dart';
import 'TaskWidget.dart';

class AddTaskView extends StatelessWidget {
  final TodoTasks task;

  AddTaskView(this.task);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add tasks', style: TextStyle(color: Colors.black)),
      ),
      body: Column(children: [
        TaskWidget(task),
      ]),
    );
  }
}
