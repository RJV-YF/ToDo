import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String todoItem;
  final bool isCompleted;
  final void Function(bool?)? onChanged;

  const ToDoTile({
    super.key,
    required this.todoItem,
    required this.isCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.deepPurple.shade400,
        ),
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              todoItem.length > 20
                  ? '${todoItem.substring(0, 20)} ...'
                  : todoItem,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
