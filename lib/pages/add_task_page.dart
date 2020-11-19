import 'package:flutter/material.dart';
import 'package:to_dolist/widgets/custom_button.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            "Add new task",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
          SizedBox(
            height: 24,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
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
            Navigator.of(context).pop();
          },
          buttonText: "Close",
        ),
        CustomButton(
          onPressed: () {},
          buttonText: "Save",
          color: Colors.tealAccent[700],
          textColor: Colors.white,
        )
      ],
    );
  }
}
