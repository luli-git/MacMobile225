import 'package:flutter/material.dart';
import 'package:mac_mobile_attempt/helpers/product_bloc.dart';
import 'package:mac_mobile_attempt/helpers/product.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mac_mobile_attempt/ui/common_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mac_mobile_attempt/pages/security.dart';

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
  Widget descStack(Product product) => Positioned(
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
                    product.name,
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


  Widget productGrid(List<Product> products) => GridView.count(
    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        crossAxisCount:
            MediaQuery.of(_context).orientation == Orientation.portrait ? 2 : 3,
        shrinkWrap: true,
        primary: false,
        children: products
            .map((product) => Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                  child: InkWell(
                    // borderRadius: BorderRadius.all(Radius.circular(54.0)),
                    onTap: () => _launchURL(product.link),
                    splashColor: Colors.white,
                    child: Material(
                      color: Colors.white.withOpacity(0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      clipBehavior: Clip.antiAlias,
                      elevation: 2.0,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          imageStack(product.image),
                          descStack(product),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      );

  List<Product> getAcademic(List<Product> products) {
    List<Product> academic = [];
    for (var i=0; i<products.length; i++) {
      if (products[i].category=="academic") {
        academic.add(products[i]);
      }
    }
    return academic;
  }

  List<Product> getLife(List<Product> products) {
    List<Product> life = [];
    for (var i=0; i<products.length; i++) {
      if (products[i].category=="life") {
        life.add(products[i]);
      }
    }
    return life;
  }

  List<Product> getCareer(List<Product> products) {
    List<Product> career = [];
    for (var i=0; i<products.length; i++) {
      if (products[i].category=="career") {
        career.add(products[i]);
      }
    }
    return career;
  }

  Widget academicData() {
    ProductBloc productBloc = ProductBloc();
    return StreamBuilder<List<Product>>(
        stream: productBloc.productItems,
        builder: (context, snapshot) {
          print("??????????????"+snapshot.hasData.toString()+"??????????");
          return snapshot.hasData
              ? productGrid(getAcademic(snapshot.data))
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget lifeData() {
    ProductBloc productBloc = ProductBloc();
    return StreamBuilder<List<Product>>(
        stream: productBloc.productItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? productGrid(getLife(snapshot.data))
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget careerData() {
    ProductBloc productBloc = ProductBloc();
    return StreamBuilder<List<Product>>(
        stream: productBloc.productItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? productGrid(getCareer(snapshot.data))
              : Center(child: CircularProgressIndicator());
        });
  }
  

  // Widget bodyData() {
  //   ProductBloc productBloc = ProductBloc();
  //   return StreamBuilder<List<Product>>(
  //       stream: productBloc.productItems,
  //       builder: (context, snapshot) {
  //         return snapshot.hasData
  //             ? productGrid(snapshot.data)
  //             : Center(child: CircularProgressIndicator());
  //       });
  // }


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
            new Text('   Academic   ',
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
          height: 50,
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
