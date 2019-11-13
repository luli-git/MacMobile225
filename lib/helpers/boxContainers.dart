import 'package:flutter/material.dart';

// class HomeTab extends StatefulWidget {
//   @override 
//   State<StatefulWidget> createState() {
//     return HomeTabStateful();
//   }
// }
class HomeTabStateful extends StatefulWidget {
@override
_HomeTabStateful createState() => _HomeTabStateful();

}
class Arts extends StatefulWidget {
@override
_Arts createState() => _Arts();
}

class _HomeTabStateful extends State<StatefulWidget> {
  // HomeTabStateful(){}
  @override
  Widget build(BuildContext context) {
    return
  
    Scaffold(
      body:
       Container(
              width: 400.0,
              height: 400,
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                    border: Border.all(
                      color: Colors.grey[200], style: BorderStyle.solid,),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey[300],blurRadius: 15.0, spreadRadius: 5.0,
                      offset: Offset(5.0,5.0,),)
                    ],
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF01426A),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                      ),
                      child: Text(  
                        "       Academic                           12:00pm-01:00pm  ",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.left,
                        
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(7),
                    ),
               
                  Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '       The Climate Crisis Affects Me and You: The          Intersections of Climate Activism – Isra Hirsi, Founder,            US Youth Climate Strike',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            Icon(Icons.place),
            Text(
              'John B Davis Lecture Hall',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 13,
              
              ),
              textAlign: TextAlign.center,
            ),
                
                ],
              ),
            ),
    );
}
}

class _Arts extends State<StatefulWidget> {
  // HomeTabStateful(){}
  @override
  Widget build(BuildContext context) {
    return
  
    Scaffold(
      body:
       Container(
              width: 400.0,
              height: 292,
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                    border: Border.all(
                      color: Colors.grey[200], style: BorderStyle.solid,),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey[300],blurRadius: 15.0, spreadRadius: 5.0,
                      offset: Offset(5.0,5.0,),)
                    ],
                ),
                
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  

                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF01426A),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                      ),
                      child: 
                      Text(
                        "       Religious                            04:15pm-07:15pm",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.start,
                        
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(7),
                    ),
               Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Torah Study with Rabbi Emma ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            Icon(Icons.place),
            Text(
              'Center for Religious and Spiritual Life, Weyerhaeuser Memorial Chapel',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 13,
              
              ),
              textAlign: TextAlign.center,
            ),
                  
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  //     child: 
                      
                  //     Text(
                  //       "Torah Study with Rabbi Emma                                                      "
                  //       "Center for Religious and Spiritual Life, Weyerhaeuser Memorial Chapel",
                  //       style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  //       softWrap: true,
                  //       textAlign: TextAlign.center,
                  //       ),
                  // ),
                
                ],
              ),
            ),
    );
}
}

// Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 'Oeschinen Lake Campground',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),