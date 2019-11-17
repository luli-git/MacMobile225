import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
class HoursTab extends StatefulWidget{
  @override
  _ListPageState createState() => _ListPageState(); 
 
}
class _ListPageState extends State<HoursTab> {

  // Future getPosts() async {
    

  //   var firestore = Firestore.instance;
    
  //   QuerySnapshot qn = await firestore.collection('facilities').getDocuments();

  //   // print(qn.documents.length);
  //   return qn.documents;
  // }

  final databaseReference = Firestore.instance;

  void getData() {
  databaseReference
      .collection("facilities")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => print('${f.data}}'));
  });
} 
  @override 
  Widget build(BuildContext context){
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('haha').snapshots(),
        builder: (context, snapshot){
        if(snapshot.data == null) return CircularProgressIndicator();
  
        return new ListView(
                      children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                          return new ListTile(
                            title: document['name'],
                          );
                      }).toList(),);
        },
    ),
    );
  }
  
}
