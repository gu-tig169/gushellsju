import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TodoListView.dart';
import 'model.dart';

void main() {
  var state = MyState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoListView(),
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.deepOrange,
        ));
  }
}
