import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as prefix0;
import 'package:mac_mobile_attempt/pages/ServiceLocator.dart';
import 'package:mac_mobile_attempt/pages/calendar_tile.dart';
import 'package:mac_mobile_attempt/pages/eventAPI.dart';
import 'package:mac_mobile_attempt/pages/eventTabPage.dart';
import 'package:mac_mobile_attempt/pages/events.dart';
//import 'package:mac_mobile_attempt/pages/flutter_clean_calendar.dart';
import 'package:mac_mobile_attempt/pages/home.dart';
import 'pages/resources.dart';
import 'pages/dining.dart';
import 'pages/events.dart';
import 'pages/facility_hours.dart';
import 'pages/eventAPI.dart';
//import 'pages/calendar.dart';

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

    controller = new TabController(vsync: this, length: 5);
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
      // Appbar
      // appBar: AppBar(
      //   // Title
      //   title: Image.asset(
      //     'assets/images/mac-primary-logo-spot blue.png',
      //     height: 45,
      //   ),
      //   centerTitle: true,
      //   // Set the background color of the App Bar
      //   backgroundColor : Color(0xFF501426A).withOpacity(0.4),
        
      // ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[
          HomeTab(),
          DiningTab(),
          HoursTab(),
          EventsPage(),
          ResourcesTab()
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
              height: 60.0,
              child: new Tab(
                  text: "Home",
                  icon: Icon(Icons.home,
                      color: controller.index == 0
                          ? Color(0xFF01426A)
                          : Color(0xFF5B6770))),
            ),
            Container(
                height: 60,
                child: Tab(
                    text: "Dining",
                    icon: Icon(Icons.fastfood,
                        color: controller.index == 1
                            ? Color(0xFF01426A)
                            : Color(0xFF5B6770)))),
            Container(
                height: 60,
                child: Tab(
                    text: "Hours",
                    icon: Icon(Icons.access_time,
                        color: controller.index == 2
                            ? Color(0xFF01426A)
                            : Color(0xFF5B6770)))),
            Container(
                height: 60,
                child: Tab(
                    text: "Events",
                    icon: Icon(Icons.calendar_today,
                        color: controller.index == 3
                            ? Color(0xFF01426A)
                            : Color(0xFF5B6770)))),
            Container(
                height: 60,
                width: 100,
                child: Tab(
                    text: "Resources",
                    icon: Icon(Icons.school,
                        color: controller.index == 4
                            ? Color(0xFF01426A)
                            : Color(0xFF5B6770)))),
          ],
          labelColor: Color(0xFF01426A),
          labelPadding: EdgeInsets.all(1),
          unselectedLabelColor: Color(0xFF5B6770),
          // labelStyle: TextStyle(fontSize: 15),
          controller: controller,
        ),
      ),
    );
  }
}