import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class HoursTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Color(0xFF501426A).withOpacity(0.9),
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text("Facility Hours",
                    style: TextStyle(
                        color: Colors.blue[50],
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal)),
                background: Image.asset(
                  "assets/images/jwalblue.jpg",
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: ListPage(),
    ));
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

Future _data;

class _ListPageState extends State<ListPage> {
  static _launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }

  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('facilities').getDocuments();
    return qn.documents;
  }

  // navigateToDetail(DocumentSnapshot post) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => DetailPage(
  //                 post: post,
  //               )));
  // }

  Future _data;
  @override
  void initState() {
    super.initState();
    _data = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: _data,
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return showLoad();
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return _expansionTile(snapshot.data[index].data);
                    });
              }
            }));
  }

  Widget showLoad() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new CircularProgressIndicator(),
              width: 60.0,
              height: 60.0,
              alignment: Alignment.center,
            )
          ],
        )
      ],
    );
  }

  Widget _expansionTile(Map values) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: Column(
        children: <Widget>[_listTile(values)],
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 25.0, top: 5.0, bottom: 5.0, right: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                        onTap: () => _launchURL("https://" + values['link']),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: values['link'],
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                  )),
                              // can add more TextSpans here...
                            ],
                          ),
                        )
                        // height: 30.0,
                        ),
                    const Padding(padding: EdgeInsets.only(top: 5.0)),
                    Container(
                      child: Text("Phone: " + values['phone'],
                          style: TextStyle(color: Colors.black87)),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5.0)),
                    Container(
                      child: Text("Location: " + values['location']),
                      height: 30.0,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Color _getStatusColor(String hours) {
    String status = getStatus(hours);
    if (status == "OPEN") {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  String getStatus(String hours) {
    DateFormat dateFormat = new DateFormat.Hm();
    DateTime date = DateTime.now();
    List<String> parts = hours.split("|");
    String status = 'CLOSED';

    if (hours != " ") {
      for (String time in parts) {
        String period = time.trim();
        final now = DateTime.now();
        DateTime open = dateFormat.parse(period.split("-")[0]);
        DateTime close = dateFormat.parse(period.split("-")[1]);
        if (period.split("-")[1] == "0:00" || period.split("-")[1] == "1:00") {
          close = new DateTime(
              now.year, now.month, now.day + 1, close.hour, close.minute);
        } else {
          open = new DateTime(
              now.year, now.month, now.day, open.hour, open.minute);
          close = new DateTime(
              now.year, now.month, now.day, close.hour, close.minute);
        }
        if (now.isAfter(open) && now.isBefore(close)) {
          status = "OPEN";
        }
      }
    }

    return status;
  }

  Widget _listTile(Map values) {
    DateTime date = DateTime.now();
    String today;
    if (values['name'] == 'Health and Wellness Center') {
      if (date.weekday == 1 || date.weekday == 5) {
        today = values['monday'];
      }
      if (date.weekday == 2 || date.weekday == 3) {
        today = values['wednesday'];
      }
      if (date.weekday == 4) {
        today = values['thursday'];
      }
      if (date.weekday == 6 || date.weekday == 7) {
        today = values['saturday'];
      }
    }
    if (values['name'] == 'Pool') {
      if (date.weekday == 1 || date.weekday == 3) {
        today = values['mw'];
      }
      if (date.weekday == 2 || date.weekday == 4) {
        today = values['ttr'];
      }
      if (date.weekday == 5) {
        today = values['friday'];
      }
      if (date.weekday == 6) {
        today = values['saturday'];
      }
      if (date.weekday == 7) {
        today = values['sunday'];
      }
    } else {
      if (1 <= date.weekday && date.weekday <= 4) {
        today = values['mToTR'];
      }
      if (date.weekday == 5) {
        today = values['friday'];
      }
      if (date.weekday == 6) {
        today = values['saturday'];
      }
      if (date.weekday == 7) {
        today = values['sunday'];
      }
    }

    return InkWell(
      // onTap: all[index].urlTap,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 0.0, top: 10.0, bottom: 10.0, right: 0.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 80.0,
                width: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/" + values['image']),
                      fit: BoxFit.fill,
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          15.0), // horizontal distance between image and text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(values['name'],
                          style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Lora',
                              color: Colors.black87)),
                      const Padding(padding: EdgeInsets.only(top: 8.0)),
                      Text(getStatus(today),
                          style: TextStyle(
                              fontSize: 15.0, color: _getStatusColor(today))),
                      const Padding(padding: EdgeInsets.only(top: 8.0)),
                      Text(today,
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[600])),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
