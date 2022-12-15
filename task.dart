import 'package:flutter_application_22/Moduels/subtask.dart';

class Task {
  String taskName;
  bool taskDone;
  DateTime dateTime;
  String type;
  List<SubTask> subtasks = [];
  Task({
    required this.taskName,
    this.type = "",
    this.taskDone = false,
    required this.dateTime,
  });

  void changeStatus(Task task) {
    task.taskDone = !taskDone;
  }

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      taskName: data['taskName'],
      dateTime: data['dateTime'],
      taskDone: data['taskDone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "taskName": this.taskName,
      'dateTime': this.dateTime,
      'taskDone': this.taskDone,
    };
  }
}
