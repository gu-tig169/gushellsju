import 'package:flutter/material.dart';
import 'TodoListView.dart';
import 'model.dart';
import 'custom_button.dart';

class TaskWidget extends StatefulWidget {
  final TodoTasks task;

  TaskWidget(this.task);

  @override
  State<StatefulWidget> createState() {
    return TaskWidgetState(task);
  }
}

class TaskWidgetState extends State<TaskWidget> {
  String message;

  TextEditingController textEditingController;

  TaskWidgetState(TodoTasks task) {
    this.message = task.message;

    textEditingController = TextEditingController(text: task.message);
    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            "Add task",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          )),
          SizedBox(
            height: 24,
          ),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                labelStyle: new TextStyle(
                  height: 0,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                labelText: 'Enter task here'),
          ),
          SizedBox(
            height: 24,
          ),
          _actionButton(context)
        ],
      ),
    );
  }

  Row _actionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TodoListView()));
          },
          buttonText: "Close",
          color: Colors.white,
          textColor: Colors.black,
        ),
        CustomButton(
          buttonText: "Save",
          onPressed: () {
            Navigator.pop(context, TodoTasks(message: message));
          },
          color: Colors.deepOrangeAccent,
          textColor: Colors.white,
        )
      ],
    );
  }
}
