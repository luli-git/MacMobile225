import 'package:flutter/material.dart';
import 'package:quiver/time.dart';
import 'calendar_information.dart';

/*
This file creates the layout of the days in each month on the calendar. It also
creates the dots that appear on the calendar if a certain day contains an event.
 */

class MonthView extends StatelessWidget {
  const MonthView(
      this.year,
      this.month,
      this.events,
      this.isSelected,
      this.selectedColor,
      {
        Key key,
        this.onTapHandler,
        this.theme
      }
      );

  final int year;
  final bool isSelected;
  final Color selectedColor;
  final int month;
  final Map<int, List> events;
  final Function onTapHandler;
  final ThemeData theme;


  Widget dayMarker(int day, bool hasEvent, int numEvent) => (
      Expanded(
        child: GestureDetector(
          onTap: hasEvent
              ? () => onTapHandler(day)
              : () => onTapHandler(0),
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.black12
                  : Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                      day.toString(),
                      style: TextStyle(color: Colors.black)
                  )
              ),
              (hasEvent == true && numEvent == 1 )
                  ?  Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.only(left: 1.0, right: 1.0, top: 0.0),
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                  )
                  ),
                ],
            ): Container()

          ]),
        ),
      )
  ));




  Widget weekRow(int startDay, int lastDay) {
    List<Widget> days = [];
    for (var i = startDay; i < startDay + DateTime.daysPerWeek; i++) {
      if (i > 0 && i <= lastDay) {
        final hasEvent = events[i] != null;
        final numEvent = 1;
        days.add(dayMarker(i, hasEvent, numEvent));
      } else {
        days.add(Expanded(child: Container(),));
      }
    }

    return Row(children: days);
  }

  Widget weekdayItem(String text) => (
      Expanded(
          child: Container(
            padding: EdgeInsets.all(0.0),
            child: Center(
              child: Text(
                text,
              ),
            ),
          )
      )
  );

  Widget weekdayRow() {
    final dayText = daysAbbreviated.map((day) => (
        weekdayItem(day)
    )).toList();

    return Row(
      children: dayText,
    );
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 0.001;

    final firstDayOfMonth = DateTime(year, month, 1).weekday;
    final monthOffset = 1 - (firstDayOfMonth % DateTime.daysPerWeek);
    final lastDayOfMonth = daysInMonth(year, month);

    var weekStart = monthOffset;
    List<Widget> weeks = [
      Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: weekdayRow(),
      ),
    ];

    while (weekStart <= lastDayOfMonth) {
      weeks.add(Padding(
        padding: const EdgeInsets.only(bottom: spacing),
        child: weekRow(weekStart, lastDayOfMonth),
      ));
      weekStart += DateTime.daysPerWeek;
    }

    return Container(
      color: Colors.white,
      child: Column(
        children: weeks,
      ),
    );
  }
}
