import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/reusable_widgets/task_tile.dart';

// the widget below is used to create the list of tasks in the todoey

// changing the widget below from a stateless widget to a stateful
// widget
class TasksList extends StatefulWidget {
  // creating a property named tasks here of type list<Task>
  // to add the tasks to the task tile
  final List<Task> tasks; // initially the list is empty

  // initalizing the above property using the dart constructors
  TasksList({
    this.tasks,
  });

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  // using the initState() method here
  @override
  void initState() {
    super.initState();

    // the below line of the code is for debugging purpose
    for (var i = 0; i < widget.tasks.length; i++) {
      print('The tasks present in the list are: ${widget.tasks[i]}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(

    // using the Listview.builder() to dynamically create the
    // list of task from the task list
    return ListView.builder(
      itemBuilder: (context, index) {
        // the itemBuilder will be returning the tasktile widget
        // based on the tasks present in the task list
        return TaskTile(
          taskTitle: widget.tasks[index].taskName, // setting the task present
          //  at the index position in the task list as the taskTitle
          // of this task tile
          isChecked: widget.tasks[index].isDone,

          // in the checkboxCallback property below we have
          // provided an anonymous function as input
          // to this property and this function takes
          // an input named currentCheckboxState of type
          // bool to set the state of the task tile / checkbox
          // when the user interacts with the checkbox
          checkboxCallback: (bool currentCheckboxState) {
            // in the code below the setState() method is used
            // to set the state of the tasktile based on the
            // doneness of the task
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      // setting the length i.e. the item count of the
      // ListView.builder equal to the length of the tasks
      // present in the task list above
      itemCount: widget.tasks.length,
    );
  }
}
