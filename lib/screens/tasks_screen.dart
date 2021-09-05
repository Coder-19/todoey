import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/reusable_widgets/tasks_list.dart';
import 'package:todoey/screens/add_task_screen.dart';

// creating a stateless widget named tasksScreen here


// converting the widget below from a statefull widget to a stateless widget

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent, // changing the background color
      // to light blue accent color

      body: Column(
        // in this column also changing the cross axis alignment property from
        // center to start
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // giving some padding around the edges of the container
            padding: EdgeInsets.only(
              top: 60.0,
              right: 30.0,
              bottom: 30.0,
              left: 30.0,
            ),
            child: Column(
              // changing the cross axis alignment property to the start
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // wrapping the icon widget below into a circular avatar widget
                CircleAvatar(
                  backgroundColor:
                      Colors.white, // giving the circle avatar widget
                  // a white background color
                  radius:
                      30.0, // changing the radius of the circle avatar to 30.0
                  // pixels
                  child: Icon(
                    Icons.list, // creating a list icon here
                    color: Colors.lightBlueAccent, // giving a light blue accent
                    // color to the list icon
                    size: 30.0, // changing the size of the icon to 30.0 pixels
                  ),
                ),

                SizedBox(
                  height: 10.0,
                ),

                // creating a text widget here to show the name of the app
                Text(
                  'Todoey',
                  // styling the text using the style property
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // the text widget below is used to show the number of tasks left in
                // the todoey app
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  // changing the style of the text
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),

          // wrapping the container below in an expanded widget so that this
          // container may take as much area as possible
          Expanded(
            // creating a container widget to show all the task that are left to
            // be done
            child: Container(
              // adding some padding on the left and the right of this container
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                // making the top left and right edges of the container as circular
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              // creating a list of the todo tasks using list view widget
              child: TasksList(
                // tasks: tasks,
              ),
            ),
          ),
        ],
      ),

      // creating a floating action button here to help the user to add the todo
      // tasks to the todoey list
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent, // changing the color of the
        // floating action button to light blue accent

        // adding an add icon as the child of the floating action button
        child: Icon(
          Icons.add,
        ),

        // the code below is used for creating the onPressed functionality
        // to show a bottom sheet when the flat action button is pressed
        // so as the user can add new tasks in our todoey
        onPressed: () {
          // here we are using the showModalBottomSheet method to create a
          // modal bottom sheet for the user to add the task
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, // here in the context property we are passing the
            // current context of our app
            
            builder: (context) => SingleChildScrollView(
              child: Container(
                // adding padding to the bottom of the container
                // so as our flat button stays above the keyboard
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                

                child: AddTaskScreen(),
              ),
            ), // using the add task screen widget here
          );
        },
      ),
    );
  }
}
