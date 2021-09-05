import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/reusable_widgets/task_tile.dart';

// the widget below is used to create the list of tasks in the todoey

// changing the widget below from a stateless widget to a stateful
// widget

// changing the widget below from statefull widget to stateless widget
class TasksList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    

    // using the Listview.builder() to dynamically create the
    // list of task from the task list

    // since in the lines of code below we are using the TaskData with the provider
    // to get the data from the task list so to make this thing simpler we are going to
    // use the consumer object here from the provider package

    // our consumer is listening to the data present in the TaskData class

    // the consumer widget below is listening to the changes to the data present
    // in the TaskData class
    return Consumer<TaskData>(
      // using the builder property of the consumer widget to update our stateless
      // widget based on the data from the taskdata object

      // the builder property of the consumer widget takes three inputs first the
      // current context, second the object of the class in which our data is present
      // that will be updated (in our case it is the Object named taskData of the
      // TaskData class), third the child widget that will be returned by the builder
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            // the itemBuilder will be returning the tasktile widget
            // based on the tasks present in the task list
            return TaskTile(
              // taskTitle: widget.tasks[index].taskName, // setting the task present
              //  at the index position in the task list as the taskTitle
              // of this task tile

              // using the provider package to get the  name of the task present in the
              // task list
              // taskTitle: Provider.of<TaskData>(context).tasks[index].taskName,

              // using the taskData object from our builder method of the consumer
              // widget to get the data
              // from the tasks list present in the TaskData class to get the name
              // of the task
              taskTitle: taskData.tasks[index].taskName,

              // isChecked: widget.tasks[index].isDone,

              // using the provider package to check that whether the task is done or not
              // isChecked: Provider.of<TaskData>(context).tasks[index].isDone,

              // using the taskData object from our builder method of the consumer
              // object to check that whether a task is done or not
              isChecked: taskData.tasks[index].isDone,

              // in the checkboxCallback property below we have
              // provided an anonymous function as input
              // to this property and this function takes
              // an input named currentCheckboxState of type
              // bool to set the state of the task tile / checkbox
              // when the user interacts with the checkbox
              checkboxCallback: (bool currentCheckboxState) {
                


                // the code below is to use the provider package to call the update
                // task method so as to update the state of the task tile when
                // the user clicks on the check box
                taskData.updateTask(taskData.tasks[index]);
              },
              deleteTaskFunctionality: (){
                taskData.deleteTask(index);
              },
            );
          },
          // setting the length i.e. the item count of the
          // ListView.builder equal to the length of the tasks
          // present in the task list above
          // itemCount: widget.tasks.length,

          // using the provider package to get the length of the tasks
          // itemCount: Provider.of<TaskData>(context).tasks.length,

          // using the taskData object from the builder method of the Consumer widget
          // to get the length/number of the tasks present in the tasks list of the
          // TaskData widget
          // itemCount: taskData.tasks.length,

          // using the getter here from our task_data class to get the
          // length of the tasks list to so as to get the number of tasks
          // present in the task list
          itemCount: taskData.taskCount,
        );
      },
  
    );
  }
}
