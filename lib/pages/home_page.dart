import 'package:flutter/material.dart';
import 'package:todo/components/dialog_box.dart';

import '../components/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // list to hold todos
  List todoList = [
    ["Complete the app", false],
    ["Do excercise", true],
    ["Get a hair cut", false],
    ["Take mom to shopping and then take sister to tuition", false],
  ];
  TextEditingController controller = TextEditingController();
  // check box tapped
  void onTapped(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // save new todo
  void saveNewTodo() {
    setState(() {
      todoList.add([controller.text, false]);
    });
    controller.clear();
    Navigator.of(context).pop();
  }

  void deleteTask(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        title: const Text(
          'T o  D o',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => ToDoTile(
          todoItem: todoList[index][0],
          isCompleted: todoList[index][1],
          onChanged: (value) => onTapped(value, index),
          onPressed: (context) => deleteTask(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
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
          color: Colors.black,
        ),
      ),
    );
  }
}
