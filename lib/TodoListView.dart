import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTaskView.dart';
import 'TodoList.dart';
import 'model.dart';

class TodoListView extends StatefulWidget {
  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  List<String> filterBy = ['All Tasks', 'Completed', 'Incompleted'];
  String filterValue = 'All Tasks';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Todo List'),
        actions: [
          _dropDownButton(),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            TodoList(state.filterOptions(filterValue)),
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

          // lägg till newTask i todolistan.

          Provider.of<MyState>(context, listen: false).addTask(newTask);
          return TodoListView();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )),
    );
  }

  Widget _dropDownButton() {
    return DropdownButton(
      onChanged: (newValue) {
        setState(() {
          filterValue = newValue;
        });
      },
      items: filterBy.map((filter) {
        return DropdownMenuItem<String>(
          value: filter,
          child: Text(filter),
        );
      }).toList(),
      icon: Icon(Icons.more_vert, size: 25, color: Colors.black),
    );
  }
}
