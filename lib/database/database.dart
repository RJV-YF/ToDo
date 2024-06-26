import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  final myBox = Hive.box('mybox');

  List todoList = [];

  // Run this method if the first time opening the app
  void createInitialData() {
    todoList = [
      ["Go Shopping", false],
      ["Do Excercise", false],
    ];
  }

  void loadData() {
    todoList = myBox.get('TODOLIST');
  }

  void updateDatabase() {
    myBox.put("TODOLIST", todoList);
  }
}
