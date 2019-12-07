import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:intl/intl.dart';
import 'package:googleapis/calendar/v3.dart';

class EventsView extends StatelessWidget {
  const EventsView(
      {Key key,
      this.events,
      this.month,
      this.currentDay,
      this.onEventTapped,
      this.titleField,
      this.detailField,
      this.dateField,
      this.theme})
      : super(key: key);

  final Map<int, List> events;
  final int month;
  final int currentDay;
  final Function onEventTapped;
  final String titleField;
  final String detailField;
  final String dateField;
  final ThemeData theme;

//  Widget dateBadge(day) => ConstrainedBox(
//    constraints: new BoxConstraints(minWidth: 75.0),
//    child: new Container(
//      margin: EdgeInsets.all(8.0),
//      padding: EdgeInsets.all(16.0),
//      decoration: BoxDecoration(
//        shape: BoxShape.rectangle,
//        color: Color(0xFF01426A),
//      ),
//      child: Column(
//        children: <Widget>[
//          Text(
//            month.toString() + "/" + day.toString(),
//            textAlign: TextAlign.center,
//            style: (TextStyle(color: prefix0.Colors.white)),
//          ),
//        ],
//      ),
//    ),
//  );

  String getLocations(Map<String, String> event) {
    if (event['location'] != null) {
      return event['location'];
    } else {
      return "Macalester College";
    }
  }

  String getName(Map<String, String> event) {
    if (event['name'] != null) {
      return event['name'];
    } else {
      return "Untitled Event";
    }
  }

  String getDescription(Map<String, String> event) {
    if (event['description'] != null) {
      return event['description'];
    } else {
      return "Untitled Event";
    }
  }

  String formatTime(event) {
    // print(event[dateField]);
    final date = DateTime.parse(event[dateField]).toLocal();
    return DateFormat.jm().format(date);
  }

  String getMonthName(int month) {
    if (month == 1) {
      return "January";
    } else if (month == 2) {
      return "February";
    } else if (month == 3) {
      return "March";
    } else if (month == 4) {
      return "April";
    } else if (month == 5) {
      return "May";
    } else if (month == 6) {
      return "June";
    } else if (month == 7) {
      return "July";
    } else if (month == 8) {
      return "August";
    } else if (month == 9) {
      return "September";
    } else if (month == 10) {
      return "October";
    } else if (month == 11) {
      return "November";
    } else {
      return "December";
    }
  }

  Widget eventRow(int day, Map<String, String> event) => Container(
      // width: 420.0,
      // height: 140,
      margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      decoration: BoxDecoration(
        color: prefix0.Colors.white,
        border: Border.all(
          color: prefix0.Colors.grey[200],
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: prefix0.Colors.grey[300],
            blurRadius: 15.0,
            spreadRadius: 5.0,
            offset: Offset(
              5.0,
              5.0,
            ),
          )
        ],
      ),
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              child: Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF01426A),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "   " + getMonthName(month) + " " + day.toString(),
                        style: TextStyle(
                          color: prefix0.Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        formatTime(event) + "   ",
                        style: TextStyle(
                          color: prefix0.Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(7),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                //"Event",
                getName(event),
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.place,
                  size: 16,
                  color: Color(0xFF5B6770),
                ),
                Flexible(
                  child: Text(
                    getLocations(event),
                    style:
                        TextStyle(fontSize: 14, color: prefix0.Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 15.0)),
          ]));


  List<Widget> eventList() {
    List<Widget> list = [];
    events.forEach((int day, List dayEvents) {
      if (currentDay == 0 || currentDay == day) {
        for (var i = 0; i < dayEvents.length; i++) {
          list.add(eventRow(day, dayEvents[i]));
          list.add(Divider(
            color: prefix0.Colors.black,
            height: 0.0,
          ));
        }
      }
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: theme.canvasColor,
        child: ListView(
          children: eventList(),
        ),
      ),
    );
  }
}
