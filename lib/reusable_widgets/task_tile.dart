import 'package:flutter/material.dart';

// the widget below is used to create the task tile

class TaskTile extends StatelessWidget {




  // since now our widget is a stateless widget so it cannot have
  // a variable property so let us now convert the isChecked
  // property to a final property rather than a variable property
  final bool isChecked;

 
  // creating a new property here named taskTitle to set the task
  // in the list tile that is needed to be done
  final String taskTitle;

  // creating a new property here of type Function to trigger
  // the onChange callback when the user interacts with the
  // checkbox
  final Function checkboxCallback;

  // initializing the above properties using the dart constructor
  TaskTile({
    this.isChecked,
    this.taskTitle,
    this.checkboxCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        // 'Buy Milk',

        // using the taskTitle property here
        taskTitle,
        // adding the style to the text above
        style: TextStyle(
          // changing the text decoration based on the value
          // of isChecked state
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        // changing the active color of checkbox to light blue accent
        activeColor: Colors.lightBlueAccent,
       

        // using the isChecked property as the input of the
        // property value of the checkbox
        value: isChecked,

        // using the checkboxCallback as input to the onChange
        // property
        onChanged: checkboxCallback,

       
      ),
    );
  }
}

