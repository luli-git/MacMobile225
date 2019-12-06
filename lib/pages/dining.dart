import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DiningTab extends StatelessWidget {
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
                title: Text("Dining",
                    style: TextStyle(
                        color: Colors.blue[50],
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal)),
                background: Image.asset(
                  "assets/images/ccnew.jpg",
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
    QuerySnapshot qn = await firestore.collection('dinings').getDocuments();
    return qn.documents;
  }

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
                      return _listTile(snapshot.data[index].data);
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

  Widget _listTile(Map values) {
    DateFormat dateFormat = new DateFormat.Hm();
    DateTime date = DateTime.now();
    // print("===================");
    // print("weekday is ${date.weekday}");
    String today;
    String ex = "07:30-09:40 | 11:00-13:30 | 17:00-20:00";
    List<String> parts = ex.split("|");
    String status;

    for (String time in parts) {
      String period = time.trim();
      final now = DateTime.now();
      DateTime open = dateFormat.parse(period.split("-")[0]);
      DateTime close = dateFormat.parse(period.split("-")[1]);
      open = new DateTime(now.year, now.month, now.day, open.hour, open.minute);
      close =
          new DateTime(now.year, now.month, now.day, close.hour, close.minute);

      if (now.isAfter(open) && now.isBefore(close)) {
        status = "open";
      }
    }

    return InkWell(
      onTap: () => _launchURL(values['link']),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, top: 12.0, bottom: 5.0, right: 0.0),
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
                              fontSize: 18.0,
                              fontFamily: 'Lora',
                              color: Colors.black87)),
                      const Padding(padding: EdgeInsets.only(top: 8.0)),
                      // Text(values['phone'],
                      //     style:
                      //         TextStyle(fontSize: 16.0, color: Colors.black87)),
                      // const Padding(padding: EdgeInsets.only(top: 8.0)),
                      Text("07:30-09:30 | 11:00-13:30 | 17:00-20:00",
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
