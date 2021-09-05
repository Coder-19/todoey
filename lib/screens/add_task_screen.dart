import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

// the code below is used for creating a screen or widget that pops
// up when the floating action button is pressed so that the user can add a task
// to our todoey app
class AddTaskScreen extends StatelessWidget {
  // // creating a property here named onPressedCallbackFunctionality
  // final Function onPressedCallbackFunctionality;
  //
  // AddTaskScreen(this.onPressedCallbackFunctionality);

  @override
  Widget build(BuildContext context) {
    // the property below is used to get the new task entered by the
    // user in the text field
    String newTaskTitle;
    return Container(
      // giving a background color to this container
      color: Color(0xff757575),
      child: Container(
        // adding some padding to the container
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          // giving a white background color to the container
          color: Colors.white,
          borderRadius: BorderRadius.only(
            // making the top left and the top right edges of the container as
            // rounded edges
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),

        // creating a column as the child to the container

        child: Column(
          // making the cross axis alignment of the column as stretched
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),

            Text(
              'Add Task',
              // making the text alignment as center
              textAlign: TextAlign.center,
              // styling the above text
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),

            // creating a text field widget below for the user to enter the task
            // to be added in our todoey
            TextField(
              autofocus: true, // making the text field widget auto focused
              textAlign: TextAlign.center, // making the cursor for entering the
              // text as centered
              decoration: InputDecoration(
                focusColor: Colors.lightBlueAccent,
              ),

              // adding onChanged() property here
              onChanged: (value) {
                // using the new task property here
                newTaskTitle = value;

                // the below line of code is used for debugging
                // purpose
                print('The text entered by the user is: $value');
              },
            ),

            SizedBox(
              height: 10.0,
            ),

            // adding a flat button for the user to add the task in our todoey app
            FlatButton(
              // making the button as blue color button
              color: Colors.lightBlueAccent,
              onPressed: () {
                // the code below is for using the onPressedCallback functionality
                // function to add a new task to the list
                // onPressedCallbackFunctionality(newTaskTitle);



                // using the Provider widget to get access to the addTask() method
                // in the task data class to add a new task to the task list
                Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle);


                // using the navigator to close the bottom sheet when the user presses
                // the button
                Navigator.pop(context);

              },
              child: Text(
                'Add',
                // styling the above text
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
