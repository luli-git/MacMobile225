import 'package:flutter/material.dart';

class Facility{
  final String facilityName;
  final String facilityPic;
  final String facilityPhone;
  final String facilityHour;
  
  Facility({this.facilityName,this.facilityPhone,this.facilityHour,this.facilityPic});

  static List<Facility> allFacilities(){
    var listofFacilities = new List<Facility>();
    listofFacilities.add(new Facility(facilityName: "Campus Center", facilityPhone: "651-696-6888", facilityHour: "7:00AM - 1:00 AM", facilityPic: "campuscenter.jpg"));
    listofFacilities.add(new Facility(facilityName: "Central Stores", facilityPhone: "651-696-6364", facilityHour: "8:00 AM - 12:00 PM", facilityPic: "centralstores.jpg"));
    listofFacilities.add(new Facility(facilityName: "Digital Resource Center", facilityPhone: "651-696-6336", facilityHour: "8:00AM - 10:00 PM", facilityPic: "digitalresourcecenter.jpg"));
    listofFacilities.add(new Facility(facilityName: "Health and Wellness Center", facilityPhone: "651-696-6275", facilityHour: "9:00 AM - 4:45 PM", facilityPic: "healthandwellness.jpg"));
    listofFacilities.add(new Facility(facilityName: "Highlander Shop", facilityPhone: "651-696-6688", facilityHour: "9:00AM - 6:00 PM", facilityPic: "highlandernew.jpg"));
    listofFacilities.add(new Facility(facilityName: "ITS Help Desk", facilityPhone: "651-696-6525", facilityHour: "8:00AM - 6:00 PM", facilityPic: "ITS.jpg"));
    listofFacilities.add(new Facility(facilityName: "Leonard Center", facilityPhone: "651-696-6457", facilityHour: "6:30AM - 12:00 AM", facilityPic: "leonardcenter.jpg"));
    listofFacilities.add(new Facility(facilityName: "Library", facilityPhone: "651-696-6346", facilityHour: "8:00AM - 10:00 PM", facilityPic: "library.jpg"));
    listofFacilities.add(new Facility(facilityName: "Mailing Services", facilityPhone: "651-696-6294", facilityHour: "8:00AM - 5:00 PM", facilityPic: "mailingservices.jpg"));
    listofFacilities.add(new Facility(facilityName: "Student Accounts", facilityPhone: "651-696-6161", facilityHour: "8:00AM - 12:00 PM | 1:00 PM - 4:00 PM", facilityPic: "studentaccounts.jpg"));

    return listofFacilities;
  }
}

class HoursTab extends StatelessWidget {

  final List<Facility> _allFacilities = Facility.allFacilities();
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
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getHomePageBody(context))));
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allFacilities.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );
  }
  // First Attempt
  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              leading: ClipRRect(borderRadius: new BorderRadius.circular(8.0), 
      child: Image.asset(

                "assets/images/" + _allFacilities[index].facilityPic,
        width: 100.0,
        height: 310.0,
        fit: BoxFit.fill,

      ),
      ),
              // leading: new Image.asset(
              //   "assets/" + _allFacilities[index].facilityPic,
              //   fit: BoxFit.cover,
              //   width: 100.0,
              // ),

              title: new Text(
                _allFacilities[index].facilityName,
                style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
              ),
              subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(_allFacilities[index].facilityPhone,
                        style: new TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.normal)),
                    new Text('Hours: ${_allFacilities[index].facilityHour}',
                        style: new TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.normal)),
                  ]),
              //trailing: ,
            )
          ],
        ));
  }
}

