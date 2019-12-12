import 'package:flutter/material.dart';
import 'package:mac_mobile_attempt/helpers/product.dart';

class ProductViewModel {
  
  List<Product> productsItems;

  ProductViewModel({this.productsItems});

  getProducts() => <Product>[
        //Academic
        Product(
            link:'https://1600grand.macalester.edu',
            image: 'assets/images/r_1600grand.jpg',
            name: "1600 Grand",
            category: "academic",
            ),
        Product(
            link:'https://moodle.macalester.edu',
            image: 'assets/images/r_moodle.jpg',
            name: "Moodle",
            category: "academic",
            ),
        Product(
            link:'https://www.macalester.edu/registrar/schedules/',
            image: 'assets/images/r_classschedule.jpg',
            name: "Class Schedule",
            category: "academic",
            ),
        Product(
            link:'https://www.macalester.edu/registrar/academiccalendars/',
            image: 'assets/images/r_calendar.jpg',
            name: "Academic Calendar",
            category: "academic",
            ),
        Product(
            link:'https://www.macalester.edu/library/',
            image: 'assets/images/r_library.jpg',
            name: "Library",
            category: "academic",
            ),
        Product(
            link:'https://www.macalester.edu/max/#/0',
            image: 'assets/images/r_maxcenter.jpg',
            name: "MAX Center",
            category: "academic",
            ),
        //Student Life
        Product(
            link:'https://www.macalester.edu/directory/studentorganizations/#/0',
            image: 'assets/images/r_organization.jpg',
            name: "Student Organization",
            category: "life",
            ),
        Product(
            link:'https://www.macalester.edu/residential-life/',
            image: 'assets/images/r_residential.jpg',
            name: "Residential Life",
            category: "life",
            ),
        //Career Exploration
        Product(
            link:'https://macalester.joinhandshake.com',
            image: 'assets/images/r_handshake.jpg',
            name: "Handshake",
            category: "career",
            ),
        Product(
            link:'https://macalester.joinhandshake.com/appointments',
            image: 'assets/images/r_appointments.jpg',
            name: "Appointments",
            category: "career",
            ),
      ];
}
