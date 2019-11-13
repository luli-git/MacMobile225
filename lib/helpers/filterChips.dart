import 'package:flutter/material.dart';

class FilterChipDisplay extends StatefulWidget {
  @override
  _FilterChipDisplayState createState() => _FilterChipDisplayState();
}

class _FilterChipDisplayState extends State<FilterChipDisplay> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:5.0, top:20),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: -6.0,
                    children: <Widget>[
                      filterChipWidget(chipName: 'All'),
                      filterChipWidget(chipName: 'Academic'),
                      filterChipWidget(chipName: 'Alumni'),
                      filterChipWidget(chipName: 'Art, Music, Theater'),
                      filterChipWidget(chipName: 'Athletic'),
                      filterChipWidget(chipName: 'Campus'),
                      filterChipWidget(chipName: 'Career'),
                      filterChipWidget(chipName: 'Films & Videos'),
                      filterChipWidget(chipName: 'Meetings'),
                      filterChipWidget(chipName: 'Religious'),
                      filterChipWidget(chipName: 'Student Org'),
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _titleContainer(String myTitle) {
  return Text(
    myTitle,
    style: TextStyle(
        color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
  );
}

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      //showCheckmark: false,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selected: _isSelected,
      label: Text(widget.chipName),
      labelStyle: TextStyle(color: _isSelected ? Colors.white : Color(0xFF01426A),fontSize: 18.0,fontWeight: FontWeight.normal),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            30.0),),
      backgroundColor: Color(0xffededed),
      selectedColor: Color(0xFF01426A),);
      
}
}

