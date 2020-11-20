import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TodoTasks {
  String message;
  Color color = Colors.deepOrange;
  bool completed;

  TodoTasks({this.message, this.color, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}

class MyState extends ChangeNotifier {
  List<TodoTasks> _list = [];

  List<TodoTasks> get list => _list;

  void addTask(TodoTasks task) {
    _list.add(task);
    notifyListeners();
  }

  List<TodoTasks> filteredOptions(String filter) {
    if (filter == 'Completed') {
      return _list.where((task) => task.completed == true).toList();
    } else if (filter == 'Incompleted') {
      return _list.where((task) => task.completed == false).toList();
    }
    return _list;
  }

  void removeTask(TodoTasks task) {
    _list.remove(task);
    notifyListeners();
  }

  void toggleTodo(TodoTasks task) {
    final taskIndex = _list.indexOf(task);
    _list[taskIndex].toggleCompleted();
    notifyListeners();
  }

  List<TodoTasks> filterOptions(String filter) {
    if (filter == 'Completed') {
      return _list.where((task) => task.completed == true).toList();
    } else if (filter == 'Incompleted') {
      return _list.where((task) => task.completed == false).toList();
    }
    return _list;
  }
}
