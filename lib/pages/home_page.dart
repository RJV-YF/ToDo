import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/components/dialog_box.dart';
import 'package:todo/database/database.dart';

import '../components/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // hive instance
  final myBox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();

  // list to hold todos
  // List todoList = [
  //   ["Complete the app", false],
  //   ["Do excercise", true],
  //   ["Get a hair cut", false],
  //   ["Take mom to shopping and then take sister to tuition", false],
  // ];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // check box tapped
  void onTapped(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  // save new todo
  void saveNewTodo() {
    setState(() {
      db.todoList.add([controller.text, false]);
    });
    controller.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteTask(index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade400,
        title: const Text(
          'T o  D o',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) => ToDoTile(
          todoItem: db.todoList[index][0],
          isCompleted: db.todoList[index][1],
          onChanged: (value) => onTapped(value, index),
          onPressed: (context) => deleteTask(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                controller: controller,
                onPressed: saveNewTodo,
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
