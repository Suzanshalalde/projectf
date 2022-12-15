import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_22/Moduels/task.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:flutter_application_22/Screen/menu.dart';
import 'package:flutter_application_22/Screen/subtask.dart';
import 'package:flutter_application_22/Widget/completetask.dart';
import 'package:flutter_application_22/Widget/tasklist.dart';
import 'package:provider/provider.dart';

class Task_Page extends StatefulWidget {
  const Task_Page({
    super.key,
  });

  @override
  State<Task_Page> createState() => _Task_PageState();
}

class _Task_PageState extends State<Task_Page> {
  DateTime datetime = DateTime.now();
  String taskname = "";
  bool onChecked = false;

  void initState() {
    super.initState();
  }

  final List<Task> _tasks = <Task>[];
  final List<Task> _taskscomplete = <Task>[];
  List<String> types = [
    "Inbox",
    "Welcome",
    "Work",
    "Personal",
    "Shopping",
    "WishList",
    "Birthday"
  ];
  String? selectedType;

  // create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("New Task:", textAlign: TextAlign.left),
              content: SingleChildScrollView(
                  child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      taskname = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter your Task",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: datetime,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (newDate == null) return;
                        setState(() {
                          datetime = newDate;
                        });

                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                              hour: datetime.hour, minute: datetime.minute),
                        );
                        if (newTime == null) return;

                        final newDateTime = DateTime(
                            newDate.year,
                            newDate.month,
                            newDate.day,
                            newTime.hour,
                            newTime.minute);

                        setState(() {
                          datetime = newDateTime;
                        });
                      },
                      child: const Text(
                        'Select Date & Time',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                  DropdownButton(
                      items: types
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() {
                            selectedType = value;
                          }),
                      value: selectedType),
                ],
              )),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    if (taskname != "" && datetime != false) {
                      Provider.of<Task_data>(context, listen: false)
                          .addTask(taskname, datetime, selectedType);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Name & Date of task can\'t be null',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.white,
                        ),
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Save",
                      style: TextStyle(color: Colors.blueGrey)),
                ),
                CupertinoDialogAction(
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    final String selectedType =
        Provider.of<Task_data>(context, listen: false).getselectedType();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text(
              "Planner Task",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
          drawer: const MenuScreen(),
          backgroundColor: const Color(0xFFEEEFF5),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 35, bottom: 15),
                    child: const Text(
                      "Your Tasks",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
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
                    child: const TaskList(),
                  ),
                ]),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 260, top: 12),
              ),
              Expanded(
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 35, bottom: 15),
                    child: const Text(
                      "Completed Tasks",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 120,
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
                    child: const CpmpletedTask(),
                  ),
                ]),
              ),
              Expanded(
                child: FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  onPressed: createNewTask,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
