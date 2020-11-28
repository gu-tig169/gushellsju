import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_dolist/model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '25463fb2-290c-42e8-9470-e33bc3ee601f';

class Api {
  static Future addTasks(TodoTasks task) async {
    var json = jsonEncode(TodoTasks.toJson(task));
    print(json);
    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});

    print('Added');
  }

  static Future<List<TodoTasks>> getTasks() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    print(response.body);
    var json = jsonDecode(response.body);
    print(json);
    return json.map<TodoTasks>((data) {
      return TodoTasks.fromJson(data);
    }).toList();
  }

  static Future removeTasks(String taskMessage) async {
    await http.delete('$API_URL/todos/$taskMessage?key=$API_KEY');
    print('remove tasks');
  }

  static Future changeStatus(TodoTasks task) async {
    String taskID = task.id;
    var json = jsonEncode(TodoTasks.toJson(task));
    print('changeStatus: id=$taskID, boyd=$json');
    await http.put('$API_URL/todos/$taskID?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
    print('status changed');
  }
}
