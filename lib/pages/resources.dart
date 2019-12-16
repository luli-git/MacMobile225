import 'package:flutter/material.dart';
import 'package:mac_mobile_attempt/helpers/resource_bloc.dart';
import 'package:mac_mobile_attempt/helpers/resource.dart';
import 'package:url_launcher/url_launcher.dart';

/* 
This file is the page showing resources information. 
It cantains three main categories: academic resources, student life, and career exploration.
Each type of information is shwon through a clickable square tab, 
which can direct the user to an external link.
The links are stored in resource_view_model.dart
*/

class ResourcesTab extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext _context;

  //stack1 (containing photo in a rounded-angle rectangle)
  Widget imageStack(String img) => 
  new ClipRRect(
    borderRadius: new BorderRadius.circular(12.0),
    child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
);
  

  //stack2 (the shaded bar with text)
  Widget descStack(Resource resource) => Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    resource.name,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // This widget works like a skeleton and builds a grid view for each tab.
  Widget resourceGrid(List<Resource> resources) => GridView.count(
    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        crossAxisCount:
            MediaQuery.of(_context).orientation == Orientation.portrait ? 2 : 3,
        shrinkWrap: true,
        primary: false,
        children: resources
            .map((resource) => Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                  child: InkWell(
                    // borderRadius: BorderRadius.all(Radius.circular(54.0)),
                    onTap: () => _launchURL(resource.link),
                    splashColor: Colors.white,
                    child: Material(
                      color: Colors.white.withOpacity(0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      clipBehavior: Clip.antiAlias,
                      elevation: 3.0,
                      child: Stack(
                        fit: StackFit.passthrough,
                        children: <Widget>[
                          imageStack(resource.image),
                          descStack(resource),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      );


  // The three following functions put tabs of the same category into a list.
  List<Resource> getAcademic(List<Resource> resources) {
    List<Resource> academic = [];
    for (var i=0; i<resources.length; i++) {
      if (resources[i].category=="academic") {
        academic.add(resources[i]);
      }
    }
    return academic;
  }

  List<Resource> getLife(List<Resource> resources) {
    List<Resource> life = [];
    for (var i=0; i<resources.length; i++) {
      if (resources[i].category=="life") {
        life.add(resources[i]);
      }
    }
    return life;
  }

  List<Resource> getCareer(List<Resource> resources) {
    List<Resource> career = [];
    for (var i=0; i<resources.length; i++) {
      if (resources[i].category=="career") {
        career.add(resources[i]);
      }
    }
    return career;
  }


  // The following three widgets are lists containing tabs of three categories repectively
  Widget academicData() {
    ResourceBloc resourceBloc = ResourceBloc();
    resourceBloc.resourceBloc();
    return StreamBuilder<List<Resource>>(
        stream: resourceBloc.resourceItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? resourceGrid(getAcademic(snapshot.data))
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget lifeData() {
    ResourceBloc resourceBloc = ResourceBloc();
    resourceBloc.resourceBloc();
    return StreamBuilder<List<Resource>>(
        stream: resourceBloc.resourceItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? resourceGrid(getLife(snapshot.data))
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget careerData() {
    ResourceBloc resourceBloc = ResourceBloc();
    resourceBloc.resourceBloc();
    return StreamBuilder<List<Resource>>(
        stream: resourceBloc.resourceItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? resourceGrid(getCareer(snapshot.data))
              : Center(child: CircularProgressIndicator());
        });
  }
  


    Widget bodyData() {
      return Scaffold(
        body: SingleChildScrollView(child: Column(children: <Widget>[

          // This is the container with the divider title for Academic Resources.
          Container(child: Padding(padding: const EdgeInsets.fromLTRB(0, 18, 0, 5),
          child: Row(children: <Widget>[
            Expanded(child: Divider(color: Colors.black,)),      
            new Text('   Academic Resources   ',
              textAlign: TextAlign.left,
              style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500),),
            Expanded(child: Divider(color: Colors.black,)),]))),

          Container(child: academicData()),

          // This is the container with the divider title for Student Life.
          Container(child: Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Row(children: <Widget>[
            Expanded(child: Divider(color: Colors.black,)),      
            new Text('   Student Life   ',
              textAlign: TextAlign.left,
              style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500),),
            Expanded(child: Divider(color: Colors.black,)),]))),

          Container(child: lifeData()),

          // This is the container with the divider title for Career Exploration.
          Container(child: Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Row(children: <Widget>[
            Expanded(child: Divider(color: Colors.black,)),      
            new Text('   Career Exploration   ',
              textAlign: TextAlign.left,
              style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500),),
            Expanded(child: Divider(color: Colors.black,)),]))),

          Container(child: careerData()),
        ],),)
        );
  }


  // This widget overides the build function of flutter, the main difference function is to set
  // the bar as Mac logo. 
  @override
  Widget build(BuildContext context) {
    _context = context;
    return new Scaffold(
      appBar: AppBar(
        // Title
        title: Image.asset(
          'assets/images/maclogo.jpg',
          height: 38,
        ),
        centerTitle: true,
        // Set the background color of the App Bar
        backgroundColor : Color(0xFF501426A).withOpacity(1),),
        body: bodyData());
  }

  _launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
