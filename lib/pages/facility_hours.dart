import 'dart:collection';
import 'package:flutter/material.dart';
// import 'package:googleapis/compute/v1.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final databaseReference = Firestore.instance;

class Facility{
  final String name;
  final String image;
  final String facilityPhone;
  final String openhours;
  final String mToTR;
  final String friday;
  final String link;
  final String location;
  final String saturday;
  final String sunday;

  
  Facility({this.name,this.facilityPhone,this.openhours,this.image, this.friday, this.link, this.location, this.mToTR, this.saturday, this.sunday});
  
  static _launchCaller() async {
    // const url = 'https://macalester.cafebonappetit.com/cafe/cafe-mac-grill/';
    const url = "tel:+1 670 699 661";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
    
}


}
class HoursTab extends StatefulWidget {
  @override 
  _ListPageState createState() => _ListPageState();
} 
class _ListPageState extends State<HoursTab> {
  Future getPost() async {
    var fireStore = Firestore.instance;
    QuerySnapshot qn = await fireStore.collection("facilities").getDocuments();
    return qn.documents;
  }
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
          backgroundColor: Color(0xFF01426A),
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text("Facility Hours",
                  style: TextStyle(
                    color: Colors.blue[50],
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal
                  )),
              background: Image.asset(
                "assets/images/jwalblue.jpg",
                fit: BoxFit.cover,
              )),
        ),
      ];
    },
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
            child:   FutureBuilder(
        future:getPost(),
        
        builder: (_, snapshot ){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: Text("loading...."),
            );
          }
          else {

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: _getItemUI,
            );
          }
        }
      ,)
    )));

  }
  getHomePageBody(BuildContext context, snapshot) {
        return 
      ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(5.0),
    );
    }

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
          children: <Widget>[
            expansionList(context, index)
        ],
      ),
    );
  }

  Widget _listTile(BuildContext context, int index) {
    return  
    
    FutureBuilder(
      future:getPost(),
        builder: (_, snapshot ){
          return 
    InkWell(
      // onTap: all[index].urlTap,
      child: SafeArea(
          
          top: false,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 5.0, bottom: 3.0, right: 0.0),
            child: Row(
              
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: new DecorationImage(image: new AssetImage ( "assets/images/" + snapshot.data[index].data['image'].toString()
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
                        
                      
                        Text( snapshot.data[index].data['name'], style: TextStyle(fontSize: 19.0, fontFamily: 'Lora', color: Colors.black87)),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        
                        Text(snapshot.data[index].data['phone'],
                        style: TextStyle(fontSize: 15.0, color: Colors.black87
                        )
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),

                        Text(snapshot.data[index].data['mToTR'],
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
  });
  }
  Widget expansionList(BuildContext context, int index) {
    return FutureBuilder(
      future: getPost(),
      initialData: [],
      builder: (context, snapshot){
        return 
             ExpansionTile(
      initiallyExpanded: false,
      title: Column(
    children: <Widget>[
      _listTile(context, index )
    ],
  ),
  children: <Widget>[
    Row(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(children: <Widget>[
          Container(
          child: Text("Website: " + snapshot.data[index].data['link'], style: TextStyle(fontSize: 15),),
        ),
        Container(child: Text("Location: " + snapshot.data[index].data['location'] ),)
        ],)
    ],
    ),
  ],
  );
  },);}



}