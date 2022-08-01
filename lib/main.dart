import 'package:flutter/material.dart';
import 'my_drawer_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //var currentPage = DrawerSections.dashboard;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: const Text('Drawer Demo'),
      ),
      body: Container(
        child: const Center(
          child: Text('Home Page'),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget MyDrawerList() {
  var currentPage = DrawerSections.dashboard;
  return Container(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      //Shows the list of menu items
      children: [
        MenuItems(1, 'Dashboard', Icons.dashboard_outlined,
            currentPage == DrawerSections.dashboard ? true : false),
        MenuItems(2, 'Contacts', Icons.people_alt_outlined,
            currentPage == DrawerSections.contacts ? true : false),
        MenuItems(3, 'Events', Icons.event,
            currentPage == DrawerSections.events ? true : false),
        MenuItems(4, 'Notes', Icons.notes,
            currentPage == DrawerSections.notes ? true : false),
        const Divider(color: Colors.black),
        MenuItems(5, 'Settings', Icons.settings_outlined,
            currentPage == DrawerSections.settings ? true : false),
        MenuItems(6, 'Notifications', Icons.notifications_outlined,
            currentPage == DrawerSections.notifications ? true : false),
        const Divider(color: Colors.grey),
        MenuItems(7, 'Privacy Policy', Icons.privacy_tip_outlined,
            currentPage == DrawerSections.privacy_policy ? true : false),
        MenuItems(8, 'Send Feedback', Icons.feedback_outlined,
            currentPage == DrawerSections.send_feedback ? true : false),
      ],
    ),
  );
}

Widget MenuItems(int id, String title, IconData icon, bool selected) {
  return Material(
    color: selected ? Colors.grey[300] : Colors.transparent,
    child: InkWell(
      onTap: () {
        //Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
