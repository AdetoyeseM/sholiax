import 'package:flutter/material.dart';
import 'package:shopliax/model/todo_model.dart';

class TodoListtile extends StatelessWidget {
  const TodoListtile(
      {super.key,
      required this.todo,
      this.onDeleteClicked,
      this.onChanged,
      this.index});

  final Todo todo;
  final int? index;
  final void Function()? onDeleteClicked;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      color: Colors.white,
      elevation: .25,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 18),
        leading: Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.blue.shade400),
          alignment: Alignment.center,
          child: Text(
            '${index! + 1}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          todo.taskName,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            decoration: todo.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${todo.startTime} - ${todo.endTime}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                decoration: todo.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: todo.completed,
              onChanged: (_) {
                onChanged!.call(_);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                onDeleteClicked!.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
