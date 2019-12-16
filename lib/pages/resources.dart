import 'package:flutter/material.dart';
import 'package:mac_mobile_attempt/helpers/resource_bloc.dart';
import 'package:mac_mobile_attempt/helpers/resource.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesTab extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext _context;

  //stack1
  Widget imageStack(String img) => 
  new ClipRRect(
    borderRadius: new BorderRadius.circular(12.0),
    child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
);
  

  //stack2
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
          // Container(margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          //   constraints: BoxConstraints(maxWidth: ScreenUtil().setWidth(740), maxHeight: 100),
          //   child: Ink.image(
          //     image: AssetImage('assets/images/security2.png'),
          //     height: ScreenUtil().setWidth(210),
          //     width: ScreenUtil().setWidth(730),
          //     fit: BoxFit.fill,
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (context)  {
          //           return Security();
          //       } ));},),
          //   ),
          // ),
                      
          // Container(margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
          // //  constraints: BoxConstraints(maxWidth: ScreenUtil().setWidth(740), maxHeight: 100),
          //   child: Ink.image(
          //     height: ScreenUtil().setWidth(210),
          //     width: ScreenUtil().setWidth(730),
          //     image: AssetImage('assets/images/map.png'),
          //     fit: BoxFit.fill,
          //     child: InkWell(onTap: _launchURLmap,),),),

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
