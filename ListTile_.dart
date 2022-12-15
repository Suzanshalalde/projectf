import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Moduels/task.dart';

class ListTile_Task extends StatelessWidget {
  final void Function(bool?) checkboxChange;
  final Task task;

  const ListTile_Task({
    super.key,
    required this.task,
    required this.checkboxChange,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.taskName,
      ),
      leading: Checkbox(
        activeColor: const Color.fromARGB(255, 35, 81, 111),
        value: task.taskDone,
        onChanged: checkboxChange,
      ),
      trailing: Text(DateFormat('yyyy-MM-dd / kk:mm').format(task.dateTime)),
    );
  }
}
