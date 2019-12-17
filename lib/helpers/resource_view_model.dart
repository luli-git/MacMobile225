import 'package:flutter/material.dart';
import 'package:mac_mobile_attempt/helpers/resource.dart';

/* 
This file is used to store the links used in resources page
*/

class ResourceViewModel {
  
  List<Resource> resourcesItems;

  ResourceViewModel({this.resourcesItems});

  getResources() => <Resource>[
        //Academic
        Resource(
            link:'https://1600grand.macalester.edu',
            image: 'assets/images/r_1600grand.jpg',
            name: "1600 Grand",
            category: "academic",
            ),
        Resource(
            link:'https://moodle.macalester.edu',
            image: 'assets/images/r_moodle.jpg',
            name: "Moodle",
            category: "academic",
            ),
        Resource(
            link:'https://www.macalester.edu/registrar/schedules/',
            image: 'assets/images/r_classschedule.jpg',
            name: "Class Schedule",
            category: "academic",
            ),
        Resource(
            link:'https://www.macalester.edu/registrar/academiccalendars/',
            image: 'assets/images/r_calendar.jpg',
            name: "Academic Calendar",
            category: "academic",
            ),
        Resource(
            link:'https://www.macalester.edu/library/',
            image: 'assets/images/r_library.jpg',
            name: "Library",
            category: "academic",
            ),
        Resource(
            link:'https://docs.google.com/a/macalester.edu/forms/d/e/1FAIpQLSczsH54xrvTPWUPT78eEEjhPnRXANsIUl4DupNGh3-wL5-81g/viewform',
            image: 'assets/images/r_studyroom1.jpg',
            name: "Group Study Room",
            category: "academic",
            ),  
        Resource(
            link:'https://www.macalester.edu/studyaway/',
            image: 'assets/images/r_studyaway1.jpg',
            name: "Study Away",
            category: "academic",
            ),
        Resource(
            link:'https://www.macalester.edu/max/#/0',
            image: 'assets/images/r_maxcenter.jpg',
            name: "MAX Center",
            category: "academic",
            ),
        //Student Life
        Resource(
            link:'https://www.macalester.edu/directory/studentorganizations/#/0',
            image: 'assets/images/r_organization.jpg',
            name: "Student Organization",
            category: "life",
            ),
        Resource(
            link:'https://www.macalester.edu/residential-life/',
            image: 'assets/images/r_residential.jpg',
            name: "Residential Life",
            category: "life",
            ),
        //Career Exploration
        Resource(
            link:'https://macalester.joinhandshake.com',
            image: 'assets/images/r_handshake.jpg',
            name: "Handshake",
            category: "career",
            ),
        Resource(
            link:'https://macalester.joinhandshake.com/appointments',
            image: 'assets/images/r_appointments.jpg',
            name: "Appointments",
            category: "career",
            ),
      ];
}
