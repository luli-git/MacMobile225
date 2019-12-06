//import 'package:flutter/material.dart';
//import 'package:flutter/material.dart' as prefix0;
//import 'package:googleapis/calendar/v3.dart';
//import 'package:googleapis/calendar/v3.dart' as prefix1;
//import 'package:googleapis_auth/auth_io.dart';
//import 'package:flutter_multiselect/flutter_multiselect.dart';
//import 'multiSelectChip.dart';
//import 'eventAPI.dart';
//
////
//
//const _SCOPES = [CalendarApi.CalendarScope];
//
//class EventCreate {
//  final String eventName;
//  final EventDateTime eventStartDate;
//  final EventDateTime eventEndDate;
//  final String eventLocation;
//  final String category;
//
//  EventCreate(
//      {this.eventName,
//      this.eventStartDate,
//      this.eventEndDate,
//      this.eventLocation,
//      this.category});
//}
//
////
////List<Event>
////
//
//class EventTab extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    //print(EventCreate.allEvents().length);
//    return EventTabStateful();
//  }
//}
//
//class EventTabStateful extends State<EventTab> {
//  //final List<EventCreate> _allEvents = EventCreate.allEvents();
//
//  static String getLocation(int index) {
//    if (EventApi.getAllEvents()[index].eventLocation != null) {
//      return EventApi.getAllEvents()[index].eventLocation;
//    } else {
//      return "Macalester College";
//    }
//  }
//
//  static String getStartTime(int index) {
//    if ( //EventApi.getAllEvents()[index].eventStartDate.date != null &&
//        EventApi.getAllEvents()[index].eventStartDate.dateTime != null &&
//            EventApi.getAllEvents()[index].eventStartDate.dateTime.hour != 00) {
//      return EventApi.getAllEvents()[index].eventStartDate.date.toString() +
//          ":";
//    } else {
//      return "All Day";
//    }
//  }
//
//  static String getEndTime(int index) {
//    if ( //EventApi.getAllEvents()[index].eventEndDate.date != null &&
//        EventApi.getAllEvents()[index].eventEndDate.dateTime != null &&
//            EventApi.getAllEvents()[index].eventEndDate.dateTime.hour != 00) {
//      return EventApi.getAllEvents()[index].eventEndDate.date.toString();
//    } else {
//      return "";
//    }
//  }
//
//  List<String> reportList = [
//    "Academic",
//    // "Alumni",
//    "Art, Music, Theater",
//    "Athletic",
//    "Campus",
//    "Career",
//    "Film & Video",
//    "Meetings",
//    "Religious",
//    "Student Org",
//  ];
//
//  _showReportDialog() {
//    showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          //Here we will build the content of the dialog
//          return AlertDialog(
//            title: Text("Categories"),
//            content: MultiSelectChip(
//              reportList,
//              onSelectionChanged: (selectedList) {
//                setState(() {
//                  //selectedReportList = selectedList;
//                });
//              },
//            ),
//            actions: <Widget>[
//              FlatButton(
//                child: Text("Confirm"),
//                onPressed: () => Navigator.of(context).pop(),
//              )
//            ],
//          );
//        });
//  }
//
//  DateTime selectedDate = DateTime.now();
//
//  // Future<Null> _selectDate(BuildContext context) async {
//  //   final DateTime picked = await showDatePicker(
//  //       context: context,
//  //       initialDate: selectedDate,
//  //       firstDate: DateTime(2019, 11, 9),
//  //       lastDate: DateTime(2021));
//  //   if (picked != null && picked != selectedDate)
//  //     setState(() {
//  //       selectedDate = picked;
//  //     });
//  // }
//
//  //final List<Event> _allEvents = Event.allEvents();
//  //EventTab(){}
//  @override
//  Widget build(BuildContext context) {
//    return LayoutBuilder(
//      builder: (BuildContext context, BoxConstraints viewportConstraints) {
//        return SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                children: <Widget>[
//                  RaisedButton(
//                      color: Color(0xFF01426A),
//                      child: Text(
//                        "Select Categories",
//                        style: TextStyle(color: prefix0.Colors.white),
//                      ),
//                      onPressed: () => _showReportDialog(),
//                      shape: RoundedRectangleBorder(
//                          borderRadius: new BorderRadius.circular(30.0))),
//                  // RaisedButton(
//                  //     color: Color(0xFF01426A),
//                  //     onPressed: () => _selectDate(context),
//                  //     child: Text(
//                  //       'Select date',
//                  //       style: TextStyle(color: prefix0.Colors.white),
//                  //     ),
//                  //     shape: RoundedRectangleBorder(
//                  //         borderRadius: new BorderRadius.circular(30.0))),
//                  //getHomePageBody(context)
//                ],
//              ),
//              new Padding(
//                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//                  child: getHomePageBody(context)),
//            ],
//          ),
//        );
//      },
//    );
//  }
//
//  getHomePageBody(BuildContext context) {
//    //print(_allEvents.length);
//    return ListView.builder(
//      shrinkWrap: true,
//      itemCount: EventApi.getAllEvents().length,
//      itemBuilder: _getItemUI,
//      //padding: EdgeInsets.all(0.0),
//    );
//  }
//
//  Widget _getItemUI(BuildContext context, int index) {
//    return new Container(
//        width: 400.0,
//        height: 200,
//        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
//        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
//        decoration: BoxDecoration(
//          color: prefix0.Colors.white,
//          border: Border.all(
//            color: prefix0.Colors.grey[200],
//            style: BorderStyle.solid,
//          ),
//          borderRadius: BorderRadius.all(Radius.circular(15)),
//          boxShadow: [
//            BoxShadow(
//              color: prefix0.Colors.grey[300],
//              blurRadius: 15.0,
//              spreadRadius: 5.0,
//              offset: Offset(
//                5.0,
//                5.0,
//              ),
//            )
//          ],
//        ),
//        child: new Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              InkWell(
//                child: Container(
//                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                  decoration: BoxDecoration(
//                    color: Color(0xFF01426A),
//                    borderRadius: BorderRadius.only(
//                        topLeft: Radius.circular(15.0),
//                        topRight: Radius.circular(15.0)),
//                  ),
//                  child: Text(
//                    getStartTime(index) + getEndTime(index),
//                    style: TextStyle(color: prefix0.Colors.white, fontSize: 18),
//                    textAlign: TextAlign.left,
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.all(7),
//              ),
//              Container(
//                padding: const EdgeInsets.only(bottom: 8),
//                child: Text(
//                  //"Event",
//                  EventApi.getAllEvents()[index].eventName,
//                  textAlign: TextAlign.center,
//                  softWrap: true,
//                  style: TextStyle(
//                    fontWeight: FontWeight.normal,
//                    fontSize: 15,
//                  ),
//                ),
//              ),
//              Icon(Icons.place),
//              Text(
//                getLocation(index),
//
//                //"Location",
//                style: TextStyle(
//                  color: prefix0.Colors.grey[500],
//                  fontSize: 13,
//                ),
//                textAlign: TextAlign.center,
//              ),
//            ]));
//  }
//}
