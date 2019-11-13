import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Facility{
  final String name;
  final String image;
  final String facilityPhone;
  final String openhours;
  
  Facility({this.name,this.facilityPhone,this.openhours,this.image});
  
  static _launchCaller() async {
    // const url = 'https://macalester.cafebonappetit.com/cafe/cafe-mac-grill/';
    const url = "tel:+1 670 699 661";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
}
  static List<Facility> allFacilities(){
    var listofFacilities = new List<Facility>();
    listofFacilities.add(new Facility(name: "Library", facilityPhone: "651-696-6346", openhours: "8:00AM - 10:00 PM", image: "library.jpg"));
    listofFacilities.add(new Facility(name: "Leonard Center", facilityPhone: "651-696-6457", openhours: "6:30AM - 12:00 AM", image: "lc2.jpg"));
    listofFacilities.add(new Facility(name: "Pool", facilityPhone: "(651) 696-6457", openhours: "7:30 AM - 9:00 AM\n11:00 AM - 1:00 PM \n7:30 PM - 9:00 PM", image: "pool.jpg"));
    listofFacilities.add(new Facility(name: "Campus Center", facilityPhone: "651-696-6888", openhours: "7:00AM - 1:00 AM", image: "campuscenter.jpg"));
    listofFacilities.add(new Facility(name: "Health and Wellness Center", facilityPhone: "651-696-6275", openhours: "9:00 AM - 4:45 PM", image: "hwc2.jpg"));
    listofFacilities.add(new Facility(name: "Central Stores", facilityPhone: "651-696-6364", openhours: "8:00 AM - 12:00 PM", image: "centralstores.jpg"));
    listofFacilities.add(new Facility(name: "Digital Resource Center", facilityPhone: "651-696-6336", openhours: "8:00AM - 10:00 PM", image: "digitalresourcecenter.jpg"));
    listofFacilities.add(new Facility(name: "Highlander Shop", facilityPhone: "651-696-6688", openhours: "9:00AM - 6:00 PM", image: "highlandernew.jpg"));
    listofFacilities.add(new Facility(name: "ITS Help Desk", facilityPhone: "651-696-6525", openhours: "8:00AM - 6:00 PM", image: "ITS.jpg"));
    listofFacilities.add(new Facility(name: "Mailing Services", facilityPhone: "651-696-6294", openhours: "8:00AM - 5:00 PM", image: "mailingservices.jpg"));
    listofFacilities.add(new Facility(name: "Student Accounts", facilityPhone: "651-696-6161", openhours: "8:00AM - 12:00 PM | 1:00 PM - 4:00 PM", image: "studentaccounts.jpg"));


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
            padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
            child: getHomePageBody(context))));
  }


  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allFacilities.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(5.0),
    );
  }
  // First Attempt
  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
          children: <Widget>[
            expansionList(context, index)
        ],
      ),
    );
  }
  Widget _listTile(BuildContext context, int index, List all) {
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
                    image: new DecorationImage(image: new AssetImage ( "assets/images/" + all[index].image
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
                        Text( all[index].name, style: TextStyle(fontSize: 19.0, fontFamily: 'Lora', color: Colors.black87)),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        
                        Text(all[index].facilityPhone,
                        style: TextStyle(fontSize: 15.0, color: Colors.black87
                        )
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),

                        Text(all[index].openhours,
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
  Widget expansionList(BuildContext context, int index) {
    return new ExpansionTile(
      initiallyExpanded: false,
      title: Column(
    children: <Widget>[
      _listTile(context, index, _allFacilities)
    ],
  ),
  children: <Widget>[
    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(children: <Widget>[
          Container(
          child: Text("Website: "),

        ),
        Container(child: Text("Location: "),)
        ],)
    ],
    )
  ],
  );
  }
}


