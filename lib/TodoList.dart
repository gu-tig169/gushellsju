import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TodoList extends StatelessWidget {
  final List<TodoTasks> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((task) => _taskItem(context, task)).toList());
  }

  Widget _taskItem(context, task) {
    return Card(
      color: Colors.deepOrangeAccent,
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(task.message),
        value: task.done,
        onChanged: (bool checked) {
          var state = Provider.of<MyState>(context, listen: false);
          state.getCheckboxValue(task, checked);
        },
        secondary: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeTask(task);
          },
        ),
      ),
    );
  }
}
