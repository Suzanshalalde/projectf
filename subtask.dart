import 'package:flutter/material.dart';
import 'package:flutter_application_22/Moduels/subtask.dart';
import 'package:flutter_application_22/Moduels/task.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:flutter_application_22/Widget/subTask_list.dart';
import 'package:provider/provider.dart';

class SubTask_Screen extends StatefulWidget {
  final Task task;
  const SubTask_Screen({super.key, required this.task});

  @override
  State<SubTask_Screen> createState() => _SubTask_ScreenState();
}

class _SubTask_ScreenState extends State<SubTask_Screen> {
  String nameSub = "";
  String info = "";

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<Task_data>(context, listen: false)
        .tasks
        .indexOf(widget.task);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            widget.task.taskName,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
                      onChanged: ((value) {
                        nameSub = value;
                      }),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add sub task of your task',
                        hintText: 'Sub Task',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      onChanged: ((value) {
                        info = value;
                      }),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add info for sub task',
                        hintText: 'Information Sub Task',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          Provider.of<Task_data>(context, listen: false)
                              .tasks[index]
                              .subtasks
                              .add(SubTask(name_sub: nameSub, info: info));
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    offset: Offset(5.0, 5.0),
                  ),
                ], borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SubTaskList(
                  task: widget.task,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
