import 'package:flutter/material.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(Todoey());
}

// creating a stateless widget as the root widget for our app
class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasksScreen(),
    );
  }
}
