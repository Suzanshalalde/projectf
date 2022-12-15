import 'package:flutter/widgets.dart';
import 'package:flutter_application_22/Moduels/subtask.dart';
import 'package:flutter_application_22/Moduels/task.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:flutter_application_22/Widget/subtask_Tile.dart';
import 'package:provider/provider.dart';

class SubTaskList extends StatefulWidget {
  late Task task;
  SubTaskList({super.key, required this.task});

  @override
  State<SubTaskList> createState() => _SubTaskListState();
}

class _SubTaskListState extends State<SubTaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Task_data>(
      builder: (context, task_Data, child) {
        List<SubTask> subtasks = widget.task.subtasks;
        return ListView.builder(
          itemCount: subtasks.length,
          itemBuilder: ((context, index) {
            return SubTask_Tile(
                checkboxChange: (newValue) {
                  task_Data.updateSubTask(subtasks[index]);
                },
                subTask: widget.task.subtasks[index]);
          }),
        );
      },
    );
  }
}
