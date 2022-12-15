import 'package:flutter/material.dart';
import 'package:flutter_application_22/Moduels/subtask.dart';

class SubTask_Tile extends StatefulWidget {
  final void Function(bool?) checkboxChange;
  final SubTask subTask;
  const SubTask_Tile(
      {super.key, required this.checkboxChange, required this.subTask});

  @override
  State<SubTask_Tile> createState() => _SubTask_TileState();
}

class _SubTask_TileState extends State<SubTask_Tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.subTask.name_sub,
        style: TextStyle(
            decoration: widget.subTask.taskDone
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      subtitle: Text(
        widget.subTask.info,
      ),
      leading: Checkbox(
        onChanged: widget.checkboxChange,
        value: widget.subTask.taskDone,
      ),
    );
  }
}
