import 'package:flutter/material.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:flutter_application_22/Screen/timer.dart';
import 'package:flutter_application_22/Screen/tasks_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Task_data(),
      child: MaterialApp(
        title: 'Planner Task',
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            bottomSheet: const Flexible(
              child: SizedBox(
                height: 45,
                child: TabBar(
                    labelColor: Colors.blueGrey,
                    indicatorColor: Colors.blueAccent,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.check_box),
                      ),
                      Tab(
                        icon: Icon(Icons.timer_outlined),
                      ),
                    ]),
              ),
            ),
            body: TabBarView(children: [
              Task_Page(),
              TimerApp(),
            ]),
          ),
        ),
      ),
    );
  }
}
