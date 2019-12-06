import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'ServiceLocator.dart';
import 'TelService.dart';


class Security extends StatelessWidget {
  final TelService _service = locator<TelService>();


  @override
  Widget build(BuildContext context) {
    Widget sections = Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildsection(context, "Macalester Security: 24 hour", "651-696-6555"),
                _buildsection(context, "Macalester Security: business hours", "651-696-6278"),
                _buildsection(context, "Macalester Security: fax", "651-696-6135"),
                _buildsection(context, "Interim Title IX Coordinator", "651-696-6258"),
                _buildsection(context, "Counselors at Protocall", "651-696-6275 (Press 2)"),
                _buildsection(context, "Urgent Care for Mental Health", "651-266-7900"),
                _buildsection(context, "Regions Hospital", "651-250-5000"),
              ],
            ),
          );
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
                "Security Numbers",
                style: new TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
        ),
        backgroundColor : Color(0xFF501426A).withOpacity(1),
      ),
      
      backgroundColor: Colors.white,



      body: ListView(
        children: <Widget>[
          sections,
        ],
          



      ),
          
    

    );
  }
}


 
 
 
 
 
 
 
 


 Column _buildsection(BuildContext context, String label1, String label2) {
     final TelService _service = locator<TelService>();
      return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Row(
                        children: <Widget>[
                    Expanded(
                      child:
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 5.0),
                      child: Text(label1,
                              style: TextStyle(
                                    fontSize: 18.0
                              ),
                              ),
                    ),
                    
                    Container(
                     margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),

                      child: Text(label2,
                              style: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 1.0),
                               ),),
                    ),
                    ]
                    ),
                    ),
                    
                    
                    Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                      child:
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: ()=> _service.call(label2),
                        )
                    ),
                    ]),

                    Container(
                      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
                      child:
                      Divider(height: 1.0,indent: 0.0,color: Color.fromRGBO(154, 154, 154, 1.0),),
                    ),

                  ],
       
                );
    }


// _launchPhone() async {
//    const url = 'tel:17601290637';
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
// }



