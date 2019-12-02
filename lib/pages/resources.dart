import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_ink_well/image_ink_well.dart';

class ResourcesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              constraints: BoxConstraints(maxWidth: 500, maxHeight: 100),
              child: Ink.image(
                image: AssetImage('assets/images/security.png'),
                fit: BoxFit.fill,
                child: InkWell(
                  onTap: _launchURL1600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
              constraints: BoxConstraints(maxWidth: 500, maxHeight: 100),
              child: Ink.image(
                image: AssetImage('assets/images/map.png'),
                fit: BoxFit.fill,
                child: InkWell(
                  onTap: _launchURLmap,
                ),
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                color: Colors.black,
              )),
              new Text(
                '   Academic   ',
                textAlign: TextAlign.left,
                style:
                    new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              Expanded(
                  child: Divider(
                color: Colors.black,
              )),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                margin: const EdgeInsets.fromLTRB(8.0, 15.0, 10.0, 15.0),
                constraints: BoxConstraints(maxWidth: 170, maxHeight: 80),
                child: Ink.image(
                  image: AssetImage('assets/images/1600new.png'),
                  fit: BoxFit.fill,
                  child: InkWell(
                    onTap: _launchURL1600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10.0, 15.0, 8.0, 15.0),
                constraints: BoxConstraints(maxWidth: 170, maxHeight: 80),
                child: Ink.image(
                  image: AssetImage('assets/images/moodlenew.png'),
                  fit: BoxFit.fill,
                  child: InkWell(
                    onTap: _launchURLmoodle,
                  ),
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 15.0),
                constraints: BoxConstraints(maxWidth: 170, maxHeight: 80),
                child: Ink.image(
                  image: AssetImage('assets/images/classnew.png'),
                  fit: BoxFit.fill,
                  child: InkWell(
                    onTap: _launchURLclass,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                constraints: BoxConstraints(maxWidth: 170, maxHeight: 80),
                child: Ink.image(
                  image: AssetImage('assets/images/academicnew.png'),
                  fit: BoxFit.fill,
                  child: InkWell(
                    onTap: _launchURLacademic,
                  ),
                ),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                color: Colors.black,
              )),
              new Text(
                '   Student Life   ',
                textAlign: TextAlign.left,
                style:
                    new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              Expanded(
                  child: Divider(
                color: Colors.black,
              )),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 15.0),
                child: RoundedRectangleImageInkWell(
                  onPressed: _launchURL1600,
                  width: 170,
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
                constraints: BoxConstraints(maxWidth: 170, maxHeight: 80),
                child: Ink.image(
                  image: AssetImage('assets/images/academicnew.png'),
                  fit: BoxFit.fill,
                  child: InkWell(
                    onTap: _launchURLacademic,
                  ),
                ),
              ),
            ]),
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
}
