import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

// the code below is used to create a class for getting the data for the todo tasks
// and updating the state accordingly
class TaskData extends ChangeNotifier {
  // creating a new property here of type List<Task> to keep
  // a check of what the task is and whether the task is completed
  // or not

  // in the line of code below we are making the tasks variable private
  List<Task> _tasks = [
    Task(
      taskName: 'Buy Milk',
    ),
    Task(
      taskName: 'Buy Bread',
    ),
    Task(
      taskName: 'Buy Eggs',
    ),
  ];


  // the code below is used to create a getter for accessing the _tasks list outside
  // of the TaskData class

  // the code below is change the List to the UnmodifiableListView type of list so that
  // the user cannot access out tasks getter and change the data in the _tasks list
  UnmodifiableListView<Task> get tasks {
    // the code below is used to return the Unmodifiable list view version of the _tasks list
    return UnmodifiableListView(_tasks);
  }



  // the code below is used to create a getter to return the length of the tasks
  // list whenever the getter is called

  // Note: in dart get keyword is used to create the getter function

  // the return type of our getter function is int since it is returning an integer
  // value (i.e. the number of tasks present in the tasks list)
  int get taskCount {
    return _tasks.length;
  }

  // the code below is used to create a function to be called when we want to add
  // a new task to our tasks list
  void addTask(String taskTitle){
    // tasks.add(
    //   Task(
    //   taskName: task,
    //   ),
    // );  // here we are using the add function to  add a new task to
    // our list



    // the above functionality can also be written as

    // in the line of code below we are adding a new taskTitle entered by the
    // user in the text field to the Task widget
    final task = Task(
      taskName: taskTitle,
    );

    // in the line of code below we are adding the Task widget to the task list
    // using the add function
    _tasks.add(task);

    // using the notifyListeners() method to notify the change in data to all the
    // listeners listening to the change in data in the task_data class
    notifyListeners();

  }


  // the code below is used to create a method to update the state of the tasktile
  // when the user clicks on the checkbox
  void updateTask(Task task){
    task.toggleDone();   // using the toggle done method here from the task class
    // to change the state of the task tile when the user clicks on the checkbox
    // of the task tile
    notifyListeners();
  }

  // the code below is used to  create a function to delete the task from the
  // tasklist when the user clicks the task tile

  // the function below takes the index of the task in the _tasks list as input
  void deleteTask(int index){
    _tasks.removeAt(index);  // using the remove at method to remove the task
    // at the  index position in the _tasks list
    notifyListeners();
  }
}
