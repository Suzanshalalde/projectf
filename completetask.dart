import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:flutter_application_22/Widget/ListTile_.dart';
import 'package:provider/provider.dart';

class CpmpletedTask extends StatefulWidget {
  const CpmpletedTask({super.key});

  @override
  State<CpmpletedTask> createState() => _CpmpletedTaskState();
}

class _CpmpletedTaskState extends State<CpmpletedTask> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Task_data>(
      builder: (context, TaskData, child) {
        return ListView.builder(
            itemCount: TaskData.completedTasks.length,
            itemBuilder: (context, index) {
              return ListTile_Task(
                task: TaskData.completedTasks[index],
                checkboxChange: (isChecked) {},
              );
            });
      },
    );
  }
}
