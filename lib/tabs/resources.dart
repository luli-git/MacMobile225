import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    constraints: BoxConstraints(maxWidth: 500, maxHeight: 140), 
                    child: Ink.image(
                      image: AssetImage('assets/images/1600new.png'),
                      fit: BoxFit.fill,
                      child: InkWell(onTap: _launchURL1600,),),),
                    

                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                    constraints: BoxConstraints(maxWidth: 500, maxHeight: 140), 
                    child: Ink.image(
                    image: AssetImage('assets/images/moodlenew.png'),
                    fit: BoxFit.fill,
                    child: InkWell(onTap: _launchURLmoodle,),),),

                  

                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                    constraints: BoxConstraints(maxWidth: 500, maxHeight: 140), 
                    child: Ink.image(
                    image: AssetImage('assets/images/classnew.png'),
                    fit: BoxFit.fill,
                    child: InkWell(onTap: _launchURLclass,),),),


                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                    constraints: BoxConstraints(maxWidth: 500, maxHeight: 140), 
                    child: Ink.image(
                    image: AssetImage('assets/images/academicnew.png'),
                    fit: BoxFit.fill,
                    child: InkWell(onTap: _launchURLacademic,),),),
                  
                  // Expanded(child: Container(
                  //   width: 500,
                  //   height: 5,
                  //   margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  //   child: ConstrainedBox(
                  //   constraints: BoxConstraints.expand(), child: Ink.image(
                  //   image: AssetImage('assets/images/moodle.png'),
                  //   fit: BoxFit.fill,
                  //   child: InkWell(onTap: _launchURLmoodle,),),),),),
                  // Expanded(child: Container(
                  //   width: 500,
                  //   height: 40,
                  //   margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  //   child: ConstrainedBox(
                  //   constraints: BoxConstraints.expand(), child: Ink.image(
                  //   image: AssetImage('assets/images/class.png'),
                  //   fit: BoxFit.fill,
                  //   child: InkWell(onTap: _launchURLclass,),),),),),
                  // Expanded(child: Container(
                  //   width: 500,
                  //   height: 40,
                  //   margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  //   child: ConstrainedBox(
                  //   constraints: BoxConstraints.expand(), child: Ink.image(
                  //   image: AssetImage('assets/images/academic.png'),
                  //   fit: BoxFit.fill,
                  //   child: InkWell(onTap: _launchURLacademic,),),),),),



//                  Image.asset('assets/images/1600.png'),
//                  Image.asset('assets/images/moodle.png'),
//                  Image.asset('assets/images/class.png'),
//                  Image.asset('assets/images/academic.png'),
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
}
