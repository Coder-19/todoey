// creating a new class below called task to be used to get
// what the task is and whether the task is completed or not
class Task {
  // creating a new final property here of type String to get
  // the task
  final String taskName;

  // creating another property here to keep a check on whether
  // the task is completed or not
  bool isDone;

  // initializing the above properties using the dart constructor
  Task({this.taskName, this.isDone = false}); // by default the isDone
  // property is set to false since currently the task is not
  // completed

  // creating a new function below of type void to check whether
  // the task is done or not
  void toggleDone() {
    isDone = !isDone; // here we are setting the isDone property
    // to the opposite of itself i.e. if the isDone is true then
    // setting it to false and vice versa
  }
}
