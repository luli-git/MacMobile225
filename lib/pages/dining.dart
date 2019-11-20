import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final databaseReference = Firestore.instance;


class DiningOptions{
  final String diningname;
  final String image;
  final String status;
  final String openhours;
  final Function urlTap;
  DiningOptions({this.diningname, this.image, this.status, this.openhours,this.urlTap});


  static _launchURLgrille() async {
    const url = 'https://macalester.cafebonappetit.com/cafe/cafe-mac-grill/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  static _launchURLcafeMac() async {
    const url = 'https://macalester.cafebonappetit.com/cafe/cafe-mac/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static _launchURLLoch() async {
    const url = 'https://macalester.cafebonappetit.com/cafe/nessies/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  static _launchURLAtrium() async {
    const url = 'https://macalester.cafebonappetit.com/cafe/atrium-market/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  static _launchURLScottys() async {
    const url = 'https://macalester.cafebonappetit.com/cafe/scottys/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  static _launchURLJwall() async {
    const url = 'https://macalester.cafebonappetit.com/cafe/coffee-cart/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  static List<Widget> pages() {
    var listOfPages = new List<Widget>();
    listOfPages.add(DiningTab());
    return listOfPages;
  }
  static List<DiningOptions> allDiningPlaces(){
    var lstOfDiningPlaces = new List<DiningOptions>();

  




    lstOfDiningPlaces.add(new DiningOptions(diningname: "Cafe Mac", image: "cafemacbeauti.jpeg", status: "OPEN", openhours: "7:30-9:30 | 11:00-13:30 | 17:00-20:00",urlTap: _launchURLcafeMac));
    lstOfDiningPlaces.add(new DiningOptions(diningname: "Loch", image: "loch.jpg", status: "CLOSED", openhours: "11:00-13:30", urlTap: _launchURLLoch));
    lstOfDiningPlaces.add(new DiningOptions(diningname: "Atrium", image: "atrium.jpg", status: "CLOSED", openhours: "10:30-13:30 | 17:00-19:00", urlTap: _launchURLAtrium));
    lstOfDiningPlaces.add(new DiningOptions(diningname: "Scotty's", image: "scottys.png", status: "CLOSED", openhours: "11:00-14:30",urlTap: _launchURLScottys));
    lstOfDiningPlaces.add(new DiningOptions(diningname: "Grille", image: "grille.jpg", status: "OPEN", openhours: "7:30-21:00",urlTap: _launchURLgrille));
    lstOfDiningPlaces.add(new DiningOptions(diningname: "JWall Coffee Cart", image: "jwal.jpg", status: "CLOSED", openhours: "8:00-14:00",urlTap: _launchURLJwall));

    return lstOfDiningPlaces;
    }
    static Future<List<DiningOptions>> _getEventsFromFirestore() async {
CollectionReference ref = Firestore.instance.collection('events');
QuerySnapshot eventsQuery = await ref
    .where("time", isGreaterThan: new DateTime.now().millisecondsSinceEpoch)
    .where("food", isEqualTo: true)
    .getDocuments();

  HashMap<String, DiningOptions> eventsHashMap = new HashMap<String, DiningOptions>();

  eventsQuery.documents.forEach((document) {
    eventsHashMap.putIfAbsent(document['id'], () => new DiningOptions(
        diningname: document['name'],
        openhours: document['montothur'],
        image: "cafemacbeauti.jpeg",
        status: "OPEN",
        urlTap: _launchURLcafeMac));});
        }

}



class DiningTab extends StatelessWidget {
  final List<DiningOptions> _allDiningOptions = DiningOptions.allDiningPlaces();
  // final List<Widget> _allPages = DiningOptions.pages();

  DiningTab(){}
  @override
  Widget build(BuildContext context) {

  Color _getStatusColor(String status){
    if (status == "OPEN") {
      return Colors.green;
    }
    else{
      return Colors.red;
    }
  }
  

  Widget _listTile(BuildContext context, int index) {
    return 
    InkWell(
      
      onTap: _allDiningOptions[index].urlTap,
      child: SafeArea(
      
          
          top: false,
          bottom: false,
          
          child: Padding(
            
            padding: const EdgeInsets.only(left: 15.0, top: 6.0, bottom: 8.0, right: 0.0),
            child: Row(
              
              
              children: <Widget>[
                Container(
                  
                  height: 80.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: new DecorationImage(image: new AssetImage ( "assets/images/" + _allDiningOptions[index].image
                    ),
                    fit: BoxFit.fill,
                    ) 
                  ),
                  
                ),
                Expanded(
                  
                  child: Padding(
                    
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: <Widget>[
                        Text( _allDiningOptions[index].diningname, style: TextStyle(fontSize: 19.0, fontFamily: 'Lora')),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        
                        
                        Text(_allDiningOptions[index].status,
                        style: TextStyle(fontSize: 15.0, color: _getStatusColor(_allDiningOptions[index].status),
                        )
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),

                        Text(_allDiningOptions[index].openhours,
                        style: TextStyle(fontSize: 12.0, color:Colors.grey[600])),
   
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

  Widget _getItemUI(BuildContext context, int index){
    return Card(
      child: Column(
        children: <Widget>[
          _listTile(context, index)
        ],
      ),
    );
  }

  getDiningPageBody(BuildContext context){
      return ListView.builder(
      itemCount: _allDiningOptions.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(5.0)
      );
    }
 nested(){
   return NestedScrollView(
     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xFF01426A),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text(
                "Dining",
                style: TextStyle(
                  color: Colors.blue[50],
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal

                ),
              ),
              background: Image.asset(
                "assets/images/ccnew.jpg",
                fit: BoxFit.cover,
              ),
            ),
          )
        ];
      },
      body:
      Padding(
        padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 5.0),
        child: getDiningPageBody(context)
      ),
    );
 }
    return Scaffold(
      body:nested(),
      backgroundColor: Colors.white,
    ); 
}
  void choiceAction(String choice) {
    if (choice == "Menu") {
      } else if (choice == "Info") {
    }

    }



}