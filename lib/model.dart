import 'package:flutter/material.dart';
import 'api.dart';

class TodoTasks {
  String message;
  String id;
  bool done;

  TodoTasks({this.message, this.id, this.done = false});

  static Map<String, dynamic> toJson(TodoTasks task) {
    return {
      'title': task.message,
      'done': task.done,
    };
  }

  void checkboxValue() {
    this.done = !this.done;
  }

  static TodoTasks fromJson(Map<String, dynamic> json) {
    return TodoTasks(
      id: json['id'],
      done: json['done'],
      message: json['title'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TodoTasks> _tasks = [];
  List<TodoTasks> get task => _tasks;

  Future fetchList() async {
    List<TodoTasks> task = await Api.getTasks();
    _tasks = task;
    notifyListeners();
  }

  void addTask(TodoTasks task) async {
    await Api.addTasks(task);
    await fetchList();
  }

  void removeTask(TodoTasks task) async {
    await Api.removeTasks(task.id);
    await fetchList();
  }

  void getCheckboxValue(TodoTasks task, bool checked) async {
    task.done = checked;
    await Api.changeStatus(task);
    notifyListeners();
  } //Om checkboxen blir tryckt på anropas checkboxValue() och värdet ändras

  List<TodoTasks> filterOptions(String filter) {
    if (filter == 'Completed') {
      return _tasks.where((task) => task.done).toList();
    } else if (filter == 'Incompleted') {
      return _tasks.where((task) => !task.done).toList();
    }
    return _tasks;
  } //Om filtreringen är 'Completed' visas bara de tasks som har värdet completed
}
