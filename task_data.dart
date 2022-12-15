import 'package:flutter/widgets.dart';
import 'package:flutter_application_22/Moduels/subtask.dart';
import 'package:flutter_application_22/Moduels/task.dart';

class Task_data extends ChangeNotifier {
  List<Task> tasks = [];
  List<SubTask> subtasks = [];
  List<Task> completedTasks = [];
  String selectedType = "Inbox";

  void addTask(taskname, datetime, type) {
    tasks.add(
      Task(dateTime: datetime, taskName: taskname, type: type),
    );
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeStatus(task);
    completedTasks.add(task);
    deleteTask(task);
    notifyListeners();
  }

  void addSubTask(Task task, nameSub, Info) {
    subtasks.add(SubTask(name_sub: nameSub, info: Info));
    notifyListeners();
  }

  void updateSubTask(SubTask subtask) {
    subtask.changeStatus(subtask);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  String getselectedType() {
    return selectedType;
  }

  void setType(String type) {
    selectedType = type;
    notifyListeners();
  }
}
