import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(Todoey());
}

// creating a stateless widget as the root widget for our app
class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // using the change notifier provider to return the data present in the
    // TaskData class of the  app
    return ChangeNotifierProvider<TaskData>(
      create: (context) =>
          TaskData(), // here we are returning the TaskData() object
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
