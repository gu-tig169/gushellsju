import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTaskView.dart';
import 'TodoList.dart';
import 'model.dart';

class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text('Todo List')),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
        onPressed: () async {
          var newTask = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddTaskView(TodoTasks(message: 'Add task here'))));

          if (newTask != null) {
            // lägg till newTask i todolistan.

            Provider.of<MyState>(context, listen: false).addTask(newTask);
            return TodoListView();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )),
      drawer: Drawer(),
    );
  }
}
