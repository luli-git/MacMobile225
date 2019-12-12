import 'package:flutter/material.dart';
import 'package:mac_mobile_attempt/helpers/ServiceLocator.dart';
import 'package:mac_mobile_attempt/helpers/eventAPI.dart';
import 'package:mac_mobile_attempt/pages/eventTabPage.dart';
import 'pages/resources.dart';
import 'pages/dining.dart';
import 'pages/facility_hours.dart';

void main() {
  EventApi.initEvents();

  setupLocator();

  runApp(MaterialApp(

      // Title
      title: "Using Tabs",
      // Home
      home: MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    controller = new TabController(vsync: this, length: 4);
    controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});

    // Initialize the Tab Controller
    // controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EventApi.initEvents();

    return Scaffold(
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[
          ResourcesTab(),
          DiningTab(),
          HoursTab(),
          EventsPage(),
        ],

        // set the controller
        controller: controller,
      ),

      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.transparent, //Color(0xFF01426A),
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: [
            Container(
              height: 55.0,
              child: new Tab(
                  text: "Home",
                  icon: Icon(Icons.home,
                      color: controller.index == 0
                          ? Color(0xFF01426A)
                          : Color(0xFF5B6770))),
            ),
            Container(
                height: 55,
                child: Tab(
                    text: "Dining",
                    icon: Icon(Icons.fastfood,
                        color: controller.index == 1
                            ? Color(0xFF01426A)
                            : Color(0xFF5B6770)))),
            Container(
                height: 55,
                child: Tab(
                    text: "Hours",
                    icon: Icon(Icons.access_time,
                        color: controller.index == 2
                            ? Color(0xFF01426A)
                            : Color(0xFF5B6770)))),
            Container(
                height: 55,
                child: Tab(
                    text: "Events",
                    icon: Icon(Icons.calendar_today,
                        color: controller.index == 3
                            ? Color(0xFF01426A)
                            : Color(0xFF5B6770)))),
          ],
          labelColor: Color(0xFF01426A),
          labelPadding: EdgeInsets.fromLTRB(0, 0.001, 0, 0),
          unselectedLabelColor: Color(0xFF5B6770),
          controller: controller,
        ),
      ),
    );
  }
}
