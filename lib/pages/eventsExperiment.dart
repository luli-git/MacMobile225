import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:intl/intl.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:mac_mobile_attempt/helpers/custom_expansion_tile.dart' as customm;

class EventsView extends StatelessWidget {
  const EventsView(
      {Key key,
      this.events,
      this.month,
      this.currentDay,
      this.onEventTapped,
      this.titleField,
      this.desField,
      this.detailField,
      this.dateField,
      this.theme})
      : super(key: key);

  final Map<int, List> events;
  final int month;
  final int currentDay;
  final Function onEventTapped;
  final String titleField;
  final String desField;
  final String detailField;
  final String dateField;
  final ThemeData theme;

  String getDescription(Map <String,String> event){
    if(event['description'] != null){
      return event[desField];
    }
    else{
      return " ";
    }

  }
  String getLocations(Map <String,String> event){
    if (event['location'] != null){
      // print(event.keys);
      return event[detailField];
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

String getEventTime(Map <String,String> event){
    if (DateFormat.jm().format(DateTime.parse(event['date'])) == "12:00 AM"){
      return "All Day";
    } else{
      return DateFormat.jm().format(DateTime.parse(event['date']));
    }
}
  
  String formatTime(event) {
    return DateFormat.jm().format(DateTime.parse(event['date']));
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
  String getAMPM(int hour){
    if (hour <=12){
      return "AM";
    } else {
      return "PM";
    }
  }
   Widget expansionList(BuildContext context, int index) {
    print("Building expansion tile");
    return new ExpansionTile(
      initiallyExpanded: false,
      leading: Icon(Icons.all_inclusive),    
      title: Column(
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Content'),
          RaisedButton(
            child: Text('Button'),
            onPressed: () {},
          ),
          Text('Row 1'),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Content row 2'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('Content row 3')
        ],
      )
    ],
  ),
  children: <Widget>[
    Image.network(
      "https://cdn.sstatic.net/Sites/stackoverflow/company/img/logos/so/so-logo.png",
      height: 55,
    ),
  ],
    );
  }

  Widget eventRow(int day, Map<String, String> event){
    return Container(
      child: ListView.builder(itemBuilder: (BuildContext ctxt, int index) {
        return new Container(
          margin: new EdgeInsets.fromLTRB(0, 10, 20, 0),
          decoration: new BoxDecoration(
            //color:Color.fromRGBO(255, 255,255, 1),
            borderRadius: new BorderRadius.only(
                topRight: const Radius.circular(35),
                bottomRight: const Radius.circular(35)),
          ),
          width: 30,
          // height: 55,
          child: Card(
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.only(
                  topRight: const Radius.circular(35),
                  bottomRight: const Radius.circular(35)),
            ),
            child: Text("haha")//expansionList(ctxt, index),
          ),
        );
      }),
    );
    
    // Container(
      
    //     decoration: BoxDecoration(
    //     color: prefix0.Colors.white,
    //     border: Border.all(
    //       color: prefix0.Colors.grey,
    //       style: BorderStyle.solid,
    //     ),),
    //   child:

    //   customm.ExpansionTile(
    //     backgroundColor: prefix0.Colors.white,
    //   headerBackgroundColor: prefix0.Colors.white,
    //   initiallyExpanded: false,
    //   title: Column(
    //     children: <Widget>[
    //       _singleBlock(day, event),
    //       ],
    //   ),
    //   children: <Widget>[ 
    //     Container(
    //       padding: EdgeInsets.all(10),
    //       child: 
    //     Text(getDescription(event), style: TextStyle(color: prefix0.Colors.black),),)

    //   ],
      // ),
    // );

      
  }
  Widget _singleBlock(int day, Map<String, String> event){
    return 
    // Container(
    //   // width: 420.0,
    //   // height: 140,
    //   margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
    //   padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
    //   decoration: BoxDecoration(
    //     color: prefix0.Colors.white,
    //     border: Border.all(
    //       color: prefix0.Colors.grey[200],
    //       style: BorderStyle.solid,
    //     ),
    //     borderRadius: BorderRadius.all(Radius.circular(15)),
    //     boxShadow: [
    //       BoxShadow(
    //         color: prefix0.Colors.grey[300],
    //         blurRadius: 15.0,
    //         spreadRadius: 5.0,
    //         offset: Offset(
    //           5.0,
    //           5.0,
    //         ),
    //       )
    //     ],
    //   ),
    //   child: new 
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              
              child: Container(
                color: Color(0xFF01426A),
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  // decoration: BoxDecoration(
                  //   // color: Color(0xFF01426A), // head bar of the tile
                  //   borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(15.0),
                  //       topRight: Radius.circular(15.0)),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "   " + getMonthName(month) + " " + day.toString(),
                        style: TextStyle(
                          color: prefix0.Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        formatTime(event) + "   ",
                        style: TextStyle(
                          color: prefix0.Colors.black,
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
              color: prefix0.Colors.white,
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                //"Event",
                getName(event), 
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: prefix0.Colors.black
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
          ]
          );
          // );

  }


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
        color: prefix0.Colors.white,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: eventList(),
        ),
      ),
    );
  }
}
