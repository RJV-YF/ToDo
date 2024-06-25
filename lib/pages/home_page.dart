import 'package:flutter/material.dart';

import '../components/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: ToDoTile(
        todoItem: 'Complete the app',
        isCompleted: true,
        onChanged: (p0) => '',
      ),
    );
  }
}
