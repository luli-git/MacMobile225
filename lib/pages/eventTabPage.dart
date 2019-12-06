import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/calendar/v3.dart' as prefix1;
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:mac_mobile_attempt/pages/eventsView.dart';
import 'multiSelectChip.dart';
import 'eventAPI.dart';
import 'calendarView.dart';
import 'calendarView.dart';
import 'eventsView.dart';


class EventsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //print(EventCreate.allEvents().length);
    return EventPageStateful();
  }
}

class EventPageStateful extends State<EventsPage> {
  int _counter = 0;

  StreamController<List<Map<String, String>>> eventsController =
  new StreamController();



  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void dispose() {
    eventsController.close();
    super.dispose();
  }
  
//  static String getDateProper(Event event){
//    String date1 = event.start.date.year.toString()
//        + "-" + event.start.date.month.toString()
//        + "-" + event.start.date.day.toString() + "  ";
//    String time1 = event.start.date.hour.toString() + ":" +
//        event.start.date.minute.toString() + ":"
//    + event.start.date.second.toString();
//    return date1 + time1;
//  }


  static String getMonth(Event event) {
    if (event.start.dateTime != null) {
      if (event.start.dateTime.month > 9) {
        return event.start.dateTime.month.toString();
      } else {
        return "0" + event.start.dateTime.month.toString();
      }
    }
    else {
        if (event.start.date.month > 9) {
          return event.start.date.month.toString();
        } else {
          return "0" + event.start.date.month.toString();
        }
      }
    }


  static String getDay(Event event) {
    if (event.start.dateTime != null) {
      if (event.start.dateTime.day > 9) {
        return event.start.dateTime.day.toString();
      } else {
        return "0" + event.start.dateTime.day.toString();
      }
    }
    else {
      if (event.start.date.day > 9) {
        return event.start.date.day.toString();
      } else {
        return "0" + event.start.date.day.toString();
      }
    }
  }

  static String getYear(Event event) {
    if (event.start.dateTime != null) {
      return event.start.dateTime.year.toString();
    }
    else {
     return event.start.date.year.toString();
    }
  }

  static String getHour(Event event) {
    if (event.start.dateTime != null) {
      if (event.start.dateTime.hour > 9) {
        return event.start.dateTime.hour.toString();
      } else {
        return "0" + event.start.dateTime.hour.toString();
      }
    }
    else {
      if (event.start.date.hour > 9) {
        return event.start.date.hour.toString();
      } else {
        return "0" + event.start.date.hour.toString();
      }
    }
  }

  static String getMinute(Event event) {
    if (event.start.dateTime != null) {
      if (event.start.dateTime.minute > 9) {
        return event.start.dateTime.minute.toString();
      } else {
        return "0" + event.start.dateTime.minute.toString();
      }
    }
    else {
      if (event.start.date.minute > 9) {
        return event.start.date.minute.toString();
      } else {
        return "0" + event.start.date.minute.toString();
      }
    }
  }
  static String getSecond(Event event) {
    if (event.start.dateTime != null) {
      if (event.start.dateTime.second > 9) {
        return event.start.dateTime.second.toString();
      } else {
        return "0" + event.start.dateTime.second.toString();
      }
    }
    else {
      if (event.start.date.second > 9) {
        return event.start.date.second.toString();
      } else {
        return "0" + event.start.date.second.toString();
      }
    }
  }


  static String getDateFormat(Event event){
    return getYear(event) + "-" + getMonth(event) + "-" + getDay(event) + " " + getHour(event) + ":" + getMinute(event) + ":" + getSecond(event);
  }


  static List<Map<String,String>> getEventList() {
    bool duplicate = false;
    List<Map<String, String>> listOfEvents = [];
    List<Event> originalEvents = EventApi.getAllEvents();
    for (int i = 0; i < originalEvents.length; i++) {
      for (int z = 0; z < listOfEvents.length; z++){
        if (listOfEvents[z]['name'] == originalEvents[i].summary && listOfEvents[z]['date'] == getDateFormat(originalEvents[i])){
          duplicate = true;

        }
      }
     if (duplicate == false) {
       listOfEvents.add({
         'name'
             : originalEvents[i].summary,
         'location': originalEvents[i].location,
         'date': getDateFormat(originalEvents[i])});
     }
      duplicate = false;
      }

    return listOfEvents;

  }





  @override
  Widget build(BuildContext context) {
    List<Map<String,String>> eventList = getEventList();


//    void onEventTapped(Map<String, String> event) {
//      print(event);
//    }

    eventsController.add(eventList);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(

      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // default String parameter values used below as example
            new CalendarView(
              //onEventTapped: onEventTapped,
              titleField: 'name',
              detailField: 'location',
              dateField: 'date',
              separatorTitle: 'Events',
              //theme: theme,
              eventStream: eventsController.stream,
            ),
          ],
        ),
      ),
    );
  }
}
