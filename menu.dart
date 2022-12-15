import 'package:flutter/material.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onTapFunction(String type) {
      Provider.of<Task_data>(context, listen: false).setType(type);
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("S",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Suzan Shala',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: Colors.white54,
                  size: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white54,
                  size: 30,
                ),
              ],
            ),
          ),
          ListTile(
            leading:
                const Icon(Icons.calendar_today_sharp, color: Colors.blueGrey),
            title: const Text('Today'),
            onTap: () => {onTapFunction("Today"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.inbox, color: Colors.blueGrey),
            title: const Text('Inbox'),
            onTap: () => {onTapFunction("Inbox"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.waving_hand, color: Colors.blueGrey),
            title: const Text('Welcome'),
            onTap: () => {onTapFunction("Welcome"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.work, color: Colors.blueGrey),
            title: const Text('Work'),
            onTap: () => {onTapFunction("Work"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blueGrey),
            title: const Text('Personal'),
            onTap: () => {onTapFunction("Personal"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_checkout,
                color: Colors.blueGrey),
            title: const Text('Shopping'),
            onTap: () => {onTapFunction("Shopping"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blueGrey),
            title: const Text('Birthday'),
            onTap: () => {onTapFunction("Birthday"), Navigator.pop(context)},
          ),
        ],
      ),
    );
  }
}
