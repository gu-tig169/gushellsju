import 'package:flutter/material.dart';
import 'package:to_dolist/pages/add_task_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009688),
        title: Text('TIG169 Todo List'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 0,
            color: Colors.teal[700],
          ),
          _mainContent(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent[400],
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    child: AddTaskPage(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))));
              });
        },
        //Lägger till en "lägg till knapp" så att man sedan
        //så småning om ska kunna lägga till tasks

        child: Icon(Icons.add),
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

  Column _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 1),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        _taskUncomplete("Call Emma About the Video"),
        _taskUncomplete("Buy Halloween Candy"),
        _taskUncomplete("Coffee Meeting with client"),
        _taskUncomplete("Tidy the Apartment"),
        _taskUncomplete("Complete Homework"),
        Divider(),
        SizedBox(height: 16),
        _taskComplete("Buy Christmas Gift"),
        _taskComplete("Celebrate Fanny"),
      ],
    );
  }

  Widget _taskComplete(String task) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 24.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_checked,
              color: Colors.tealAccent[700],
              size: 24,
            ),
            SizedBox(
              width: 28,
            ),
            Text(task)
          ],
        ));
  }

  Widget _taskUncomplete(String task) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        bottom: 10.0,
        top: 15.0,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.radio_button_unchecked,
            color: Colors.teal,
            size: 24,
          ),
          SizedBox(
            width: 28,
          ),
          Text(task)
        ],
      ),
    );
  }
}
