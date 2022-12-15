import 'package:flutter/material.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:flutter_application_22/Screen/subtask.dart';
import 'package:flutter_application_22/Widget/ListTile_.dart';
import 'package:provider/provider.dart';

import '../Moduels/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late final void Function(bool?) checkboxChange;
  late final Task taskModel;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Task_data>(
        builder: (context, value, child) {
          List<Task> taskList = value.tasks
              .where((element) => element.type == value.selectedType)
              .toList();
          return ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile_Task(
                    task: taskList[index],
                    checkboxChange: (isChecked) {
                      value.updateTask(taskList[index]);
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SubTask_Screen(
                              task: taskList[index],
                            )));
                  },
                );
              });
        },
      ),
    );
  }
}
