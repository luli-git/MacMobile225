import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
//import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import '../helpers/filterChips.dart';
import '../helpers/boxContainers.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import '../helpers/multiSelectChip.dart';

// Initialize the Event class. 
class Event{
  final String eventName;
  final String eventStartTime;
  final String eventEndTime;
  final String eventLocation;
  final String category;
  final String eventDate;
  Event({this.eventName, this.eventStartTime, this.eventEndTime, this.eventLocation, this.category, this.eventDate});

  static List<Event> allEvents(){
    var lstOfEvents = new List<Event>();
    lstOfEvents.add(new Event(eventName: " Esri Info Session: GIS Careers ", eventStartTime: "1:00 PM", eventEndTime: "8:00 AM", eventLocation: "Carnegie Hall 107", eventDate: "Oct 20, 2019"));
    return lstOfEvents;
    }
}

class EventTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EventTabStateful();
  }
}







class EventTabStateful extends State<EventTab> {

  List<String> reportList = [
    "Academic",
    "Alumni",
    "Art, Music, Theater",
    "Athletic",
    "Campus",
    "Career",
    "Film & Video",
    "Meetings",
    "Religious",
    "Student Org",
  ];

  _showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(

            title: Text("Categories"),
            content: MultiSelectChip(
              reportList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  //selectedReportList = selectedList;
                });
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Confirm"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019,11,9),
        lastDate: DateTime(2021));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  final List<Event> _allEvents = Event.allEvents();
  //EventTab(){}
  @override
  Widget build(BuildContext context) {

      // return Widget
        return
        Scaffold (
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFF01426A),
                  child: Text("Select Categories",style: TextStyle(color: Colors.white),),
                  onPressed: () => _showReportDialog(),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                ),
                  RaisedButton(
                    color: Color(0xFF01426A),
                    onPressed: () => _selectDate(context),
                    child: Text('Select date', style: TextStyle(color: Colors.white),),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                  ),
                ],


            )






            ),

          );
}
}