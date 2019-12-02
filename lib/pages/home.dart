import 'package:flutter/material.dart';
import 'package:mac_mobile_attempt/helpers/Constants.dart';
import 'package:mac_mobile_attempt/pages/events.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mac_mobile_attempt/helpers/DiningChoices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTab extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return HomeTabStateful();
  }
}

class HomeTabStateful extends State<HomeTab> {
  String event1 = " Esri Info Session: GIS Careers ";
  String event2 = " Admissions Fall Sampler";
  String event1Start = "1:00 PM";
  String event2Start = "8:00 AM";
  String event1End = "2:00 PM";
  String event2End = "4:30 PM";
  String event1Location = "Carnegie Hall 107";
  String event2Location = "Weyerhauser Hall";

  String dining2 = "Grille";
  String dining2Time = "7:30 AM - 9:00 PM";
  String dining2Status = "OPEN";
  String dining2Image = "grille.jpg";

  String _haveStarted3Times = '';

  // Future<int> _getIntFromSharedPred() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final startupNumber = prefs.getInt('startupNumber');

  //   if(startupNumber == null {
  //     return 0;
  //   }
  //   return startupNumber;
  // }

  Future <void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startupNumber', 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Image(
              image: AssetImage("assets/images/HPnew.jpg"),
              fit: BoxFit.cover,
              height: 240,
              width: MediaQuery.of(context).size.width),
          Column(children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(12.0, 17.0, 12.0, 15.0),
                padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[200],
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 15.0,
                      spreadRadius: 5.0,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                          child: new Text("Featured Events",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 22)),
                          alignment: Alignment.topRight,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: PopupMenuButton<String>(
                                onSelected: choiceAction,
                                itemBuilder: (BuildContext context) {
                                  return Constants.choices.map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                }))
                      ],
                    )),
                    Container(
                      height: 0.8,
                      color: Colors.grey[400],
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Container(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Column(
                          children: <Widget>[
                            Container(
                                child: Text(
                              event1Start,
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            )),
                            Container(
                                child: Text(
                              event1End,
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ))
                          ],
                        )),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Container(
                            child: new Flexible(
                                child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    child: Text(
                                  event1,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ))),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Text(event1Location,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.center),
                                ))
                          ],
                        ))),
                      ],
                    )),
                    Padding(padding: EdgeInsets.all(15)),
                    Container(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Column(
                          children: <Widget>[
                            Container(
                                child: Text(
                              event2Start,
                              style: TextStyle(fontSize: 18),
                            )),
                            Container(
                                child: Text(
                              event2End,
                              style: TextStyle(fontSize: 16),
                            ))
                          ],
                        )),
                        Padding(
                          padding: EdgeInsets.all(15),
                        ),
                        Container(
                            child: new Flexible(
                                child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    child: Text(
                                  event2,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ))),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  child: Text(event2Location,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.center),
                                ))
                          ],
                        )))
                      ],
                    ))
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(1),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[200],
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 15.0,
                      spreadRadius: 5.0,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                    )
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                        child: Row(
                      children: <Widget>[
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                          child: new Text("Dining Favorites",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 22)),
                          alignment: Alignment.topLeft,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: PopupMenuButton<String>(
                                onSelected: choiceAction2,
                                itemBuilder: (BuildContext context) {
                                  return DiningConstants.choices
                                      .map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                }))
                      ],
                    )),
                    Container(
                      height: 0.8,
                      color: Colors.grey[400],
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    InkWell(
                      onTap: _launchURLgrille,
                      child: SafeArea(
                        top: false,
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, top: 10.0, bottom: 10.0, right: 0.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 80.0,
                                width: 130.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: new DecorationImage(
                                      image: new AssetImage(
                                        "assets/images/cafemacbeauti.jpeg",
                                      ),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Cafe Mac",
                                          style: TextStyle(
                                              fontSize: 21.0,
                                              fontFamily: 'Lora')),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 8.0)),
                                      Text("OPEN",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.green,
                                          )),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 8.0)),
                                      Text(
                                          "7:30-9:30 | 11:00-13:30 | 17:00-20:00",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[600])),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _launchURLCafeMac,
                      child: SafeArea(
                        top: false,
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, top: 10.0, bottom: 10.0, right: 0.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 80.0,
                                width: 130.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: new DecorationImage(
                                      image: new AssetImage(
                                        "assets/images/" + dining2Image,
                                      ),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(dining2,
                                          style: TextStyle(
                                              fontSize: 21.0,
                                              fontFamily: 'Lora')),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 8.0)),
                                      Text(dining2Status,
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.green,
                                          )),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 8.0)),
                                      Text(dining2Time,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[600])),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
        ])));
  }

  void choiceAction2(String choice) {
    if (choice == DiningConstants.atrium) {
      setState(() {
        dining2 = "Atrium";
        dining2Time = "10:30 - 1:30 | 5:00 - 7:00";
        dining2Status = "OPEN";
        dining2Image = "atrium.jpg";
        // dining2Url = _launchURLcafeMac();
      });
    } else if (choice == DiningConstants.loch) {
      setState(() {
        dining2 = "Loch";
        dining2Time = "11:00 AM - 1:30 PM";
        dining2Status = "OPEN";
        dining2Image = "loch.jpg";
      });
    } else if (choice == DiningConstants.grille) {
      setState(() {
        dining2 = "Grille";
        dining2Time = "7:30 AM - 9:00 PM";
        dining2Status = "OPEN";
        dining2Image = "grille.jpg";
      });
    } else if (choice == DiningConstants.scottys) {
      setState(() {
        dining2 = "Scotty's";
        dining2Time = "11:00 AM - 2:30 PM";
        dining2Status = "OPEN";
        dining2Image = "scottys.png";
      });
    } else if (choice == DiningConstants.jwall) {
      setState(() {
        dining2 = "JWall Coffee Cart";
        dining2Time = "8:00 AM - 2:00PM";
        dining2Status = "OPEN";
        dining2Image = "jwal.jpg";
      });
    }
  }

  void choiceAction(String choice) {
    if (choice == Constants.campus) {
      setState(() {
        event1 = "Celebrating WGSS jkljf;dlkfjadls;k";
        event2 = "Wellness Wednesday";
        event1Start = "4:00 PM";
        event2Start = "1:00 PM";
        event1End = "5:00 PM";
        event2End = "2:00 PM";
        event1Location = "4th floor lounge, Old Main";
        event2Location = "Harmon Room, Dewitt Wallace Library";
      });
    } else if (choice == Constants.sporting) {
      setState(() {
        event1 = "Men's Soccer at Hamline University";
        event2 = "Volleyball vs. St. Catherine University";
        event1Start = "3:30 PM";
        event2Start = "7:00 PM";
        event1End = "5:30 PM";
        event2End = "9:00 PM";
        event1Location = "St. Paul, MN";
        event2Location = "St. Paul, MN (Home), Leonard Center";
      });
    } else if (choice == Constants.student) {
      setState(() {
        event1 = "Anthropology Club's Snack Attack";
        event2 = "Lunching and Punching";
        event1Start = "1:30 PM";
        event2Start = "1:30 PM";
        event1End = "2:30 PM";
        event2End = "3:00 PM ";
        event1Location = "Carnegie Hall 04";
        event2Location = "Harmon Room, Dewitt Wallace Library";
      });
    } else if (choice == Constants.art) {
      setState(() {
        event1 = "Thursday Noon Recital";
        event2 = "The Rocky Horror Show";
        event1Start = "12:00 PM";
        event2Start = "7:30 PM";
        event1End = "1:00 PM";
        event2End = "9:00 PM";
        event1Location = "Mairs Concert Hall";
        event2Location = "Theater, Theater and Dance Building";
      });
    }
  }

  _launchURLCafeMac() async {
    const url = 'https://macalester.cafebonappetit.com/cafe/cafe-mac/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLgrille() async {
    const url = 'https://macalester.cafebonappetit.com/cafe/cafe-mac-grill/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
