import 'package:flutter/material.dart';
import 'package:mac_mobile_attempt/pages/security.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_ink_well/image_ink_well.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


class ResourcesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 828, height: 1792, allowFontScaling: true)..init(context);

    return Scaffold(
      appBar: AppBar(
        // Title
        title: Image.asset(
          'assets/images/maclogo.jpg',
          height: 50,
        ),
        centerTitle: true,
        // Set the background color of the App Bar
        backgroundColor : Color(0xFF501426A).withOpacity(1),
        
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
 
                   Container(
                   margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  //  constraints: BoxConstraints(maxWidth: ScreenUtil().setWidth(740), maxHeight: 100),
                   child: Ink.image(
                     image: AssetImage('assets/images/security.png'),
                      height: ScreenUtil().setWidth(210),
                      width: ScreenUtil().setWidth(730),
                     fit: BoxFit.fill,
                     child: //Text("xixiix", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,)
                       InkWell(
                         onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)  {
                              return Security();
                              } ));
                         },
                        ),
                      ),
                    
                     ),
                    
                    
 
 
                   Container(
                   margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                  //  constraints: BoxConstraints(maxWidth: ScreenUtil().setWidth(740), maxHeight: 100),
                   child: Ink.image(
                      height: ScreenUtil().setWidth(210),
                      width: ScreenUtil().setWidth(730),
                   image: AssetImage('assets/images/map.png'),
                   fit: BoxFit.fill,
                   child: InkWell(onTap: _launchURLmap,),),),
 
                   Row(
                         children: <Widget>[
                             Expanded(
                               child: Divider(color: Colors.black,)
                             ),      
 
                          new Text('   Academic   ',
                          textAlign: TextAlign.left,
                           style: new TextStyle(
                                     fontSize: 20.0,
                                     fontWeight: FontWeight.w500),),
                             Expanded(
                                 child: Divider(color: Colors.black,)
                             ),
                         ]
                   ),
 
 
               Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
 
                  
                   Container(
 
                   margin: const EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 15.0),
                   constraints: BoxConstraints(maxWidth: 200, maxHeight: 80),
 
                   child:
                 
 
                     RoundedRectangleImageInkWell(
                     onPressed: _launchURL1600,
                     width: ScreenUtil().setWidth(345),
                     height: ScreenUtil().setWidth(180),
                     borderRadius: BorderRadius.only(
                         topLeft: const Radius.circular(10),
                         topRight: const Radius.circular(10),
                         bottomLeft: const Radius.circular(10),
                         bottomRight: const Radius.circular(10),
                         ),
                     image: AssetImage('assets/images/1600.gif'),
                    
                      
                   ),
                  
                 ),
                  
 
                 Container(
 
                   margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                   constraints: BoxConstraints(maxWidth: 200, maxHeight: 80),
 
                   child:
                  
                     RoundedRectangleImageInkWell(
                     onPressed: _launchURLmoodle,
                     width: ScreenUtil().setWidth(345),
                     height: 80,
                     borderRadius: BorderRadius.only(
                         topLeft: const Radius.circular(10),
                         topRight: const Radius.circular(10),
                         bottomLeft: const Radius.circular(10),
                         bottomRight: const Radius.circular(10),
                         ),
                     image: AssetImage('assets/images/moodle.gif'),
                    
                      
                   ),
 
                 ),
 
               ]
               ),
 
 
 
               Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
 
                 Container(
 
                   margin: const EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 15.0),
 
                   child:
                  
                     RoundedRectangleImageInkWell(
                     onPressed: _launchURLclass,
                     width: ScreenUtil().setWidth(345),
                     height: 80,
                     borderRadius: BorderRadius.only(
                         topLeft: const Radius.circular(10),
                         topRight: const Radius.circular(10),
                         bottomLeft: const Radius.circular(10),
                         bottomRight: const Radius.circular(10),
                         ),
                     image: AssetImage('assets/images/class2.jpg'),
                    
                      
                   ),
 
                 ),
 
 
                 Container(
 
                   margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                  
 
                   child:
                  
                     RoundedRectangleImageInkWell(
                     onPressed: _launchURLacademic,
                     width: ScreenUtil().setWidth(345),
                     height: 80,
                     borderRadius: BorderRadius.only(
                         topLeft: const Radius.circular(10),
                         topRight: const Radius.circular(10),
                         bottomLeft: const Radius.circular(10),
                         bottomRight: const Radius.circular(10),
                         ),
                     image: AssetImage('assets/images/calendar.gif'),
                    
                      
                   ),
 
                 ),
                
               ]
               ),
 
 
               Row(
                         children: <Widget>[
                             Expanded(
                               child: Divider(color: Colors.black,)
                             ),      
 
                          new Text('   Student Life   ',
                          textAlign: TextAlign.left,
                           style: new TextStyle(
                                     fontSize: 20.0,
                                     fontWeight: FontWeight.w500),),
                             Expanded(
                                 child: Divider(color: Colors.black,)
                             ),
                         ]
                   ),
 
               Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
 
                 Container(
 
                   margin: const EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 15.0),
                  
 
                   child:
                  
                     RoundedRectangleImageInkWell(
                     onPressed: _launchURLorganizations,
                     width: ScreenUtil().setWidth(345),
                     height: 80,
                     borderRadius: BorderRadius.only(
                         topLeft: const Radius.circular(10),
                         topRight: const Radius.circular(10),
                         bottomLeft: const Radius.circular(10),
                         bottomRight: const Radius.circular(10),
                         ),
                     image: AssetImage('assets/images/organizations.gif'),
                    
                      
                   ),
 
                 ),
 
 
 
                
 
 
                 Container(
 
                   margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                  
 
                   child:
                  
                     RoundedRectangleImageInkWell(
                     onPressed: _launchURLresidence,
                     width: ScreenUtil().setWidth(345),
                     height: 80,
                     borderRadius: BorderRadius.only(
                         topLeft: const Radius.circular(10),
                         topRight: const Radius.circular(10),
                         bottomLeft: const Radius.circular(10),
                         bottomRight: const Radius.circular(10),
                         ),
                     image: AssetImage('assets/images/residence.jpg'),
                    
                      
                   ),
 
                 ),
                
               ]
               ),
 
               Row(
                         children: <Widget>[
                             Expanded(
                               child: Divider(color: Colors.black,)
                             ),      
 
                          new Text('   Career Exploration   ',
                          textAlign: TextAlign.left,
                           style: new TextStyle(
                                     fontSize: 20.0,
                                     fontWeight: FontWeight.w500),),
                             Expanded(
                                 child: Divider(color: Colors.black,)
                             ),
                         ]
                   ),
 


               Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
 
                 Container(
 
                   margin: const EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 15.0),
                  
 
                   child:
                  
                     RoundedRectangleImageInkWell(
                     onPressed: _launchURLorganizations,
                     width: ScreenUtil().setWidth(345),
                     height: 80,
                     borderRadius: BorderRadius.only(
                         topLeft: const Radius.circular(10),
                         topRight: const Radius.circular(10),
                         bottomLeft: const Radius.circular(10),
                         bottomRight: const Radius.circular(10),
                         ),
                     image: AssetImage('assets/images/handshake.jpg'),
                    
                      
                   ),
 
                 ),
 
 
 
                
 
 
                 Container(
 
                   margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                  
 
                   child:
                  
                     RoundedRectangleImageInkWell(
                     onPressed: _launchURLresidence,
                     width: ScreenUtil().setWidth(345),
                     height: 80,
                     borderRadius: BorderRadius.only(
                         topLeft: const Radius.circular(10),
                         topRight: const Radius.circular(10),
                         bottomLeft: const Radius.circular(10),
                         bottomRight: const Radius.circular(10),
                         ),
                     image: AssetImage('assets/images/appointment.jpg'),
                    
                      
                   ),
 
                 ),
                
               ]
               ),


               ],
 
       ),
     ),
   );
 }
 
 _launchURLmoodle() async {
   const url = 'https://moodle.macalester.edu';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }
 
 _launchURL1600() async {
   const url = 'https://1600grand.macalester.edu';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }
 
 _launchURLacademic() async {
   const url = 'https://www.macalester.edu/registrar/academiccalendars/';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }
 
 _launchURLclass() async {
   const url = 'https://www.macalester.edu/registrar/schedules/';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }
 
 _launchURLmap() async {
   const url = 'https://map.concept3d.com/?id=211#!ct/2569,2556';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }
 
   _launchURLorganizations() async {
   const url = 'https://www.macalester.edu/directory/studentorganizations/#/0';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }
 
   _launchURLresidence() async {
   const url = 'https://www.macalester.edu/residential-life/';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }

  _launchURLhandshake() async {
   const url = 'https://macalester.joinhandshake.com';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }

    _launchURLappointment() async {
   const url = 'https://macalester.joinhandshake.com/appointments';
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }
 
 
}
 
