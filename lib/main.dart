import 'package:flutter/material.dart';
import 'package:mac_mobile_attempt/pages/events.dart';
import 'package:mac_mobile_attempt/pages/home.dart';
import 'pages/resources.dart';
import 'pages/dining.dart';
import 'pages/events.dart';
import 'pages/facility_hours.dart';


void main() {
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

    // Initialize the Tab Controller
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
       appBar: AppBar(
         // Title
         title: Image.asset('assets/images/maclogo.jpg',height: 45,), centerTitle: true,
         // Set the background color of the App Bar
         backgroundColor: Color(0xFF01426A),
       ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[HomeTab(), DiningTab(), HoursTab(), EventTab(),ResourcesTab()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Color(0xFF01426A),
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
            Tab(
            text: "Dining",
            icon: Icon(Icons.fastfood),
          ),
          Tab(
            text: "Hours",
            icon: Icon(Icons.access_time),
          ),

          Tab(
            text: "Events",
            icon: Icon(Icons.calendar_today),
          ),
          Tab(
            text: "Resources",
            icon: Icon(Icons.school),
          ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}