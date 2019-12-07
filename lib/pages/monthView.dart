import 'package:flutter/material.dart';
import 'package:quiver/time.dart';
import 'calendarInformation.dart';

class MonthView extends StatelessWidget {
  const MonthView(
      this.year,
      this.month,
      this.events,
      {
        Key key,
        this.onTapHandler,
        this.theme
      }
      );

  final int year;
  final int month;
  final Map<int, List> events;
  final Function onTapHandler;
  final ThemeData theme;


  Widget dayMarker(int day, bool hasEvent) => (
      Expanded(
        child: GestureDetector(
          onTap: hasEvent
              ? () => onTapHandler(day)
              : () => onTapHandler(0),
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: hasEvent
                  ? Colors.white
                  : Colors.black12,
              shape: BoxShape.rectangle,
            ),
            child: Center(
                child: Text(
                  day.toString(),
                  style: TextStyle(color: Colors.black)
                )
            ),
          ),
        ),
      )
  );

  Widget weekRow(int startDay, int lastDay) {
    List<Widget> days = [];
    for (var i = startDay; i < startDay + DateTime.daysPerWeek; i++) {
      if (i > 0 && i <= lastDay) {
        final hasEvent = events[i] != null;
        days.add(dayMarker(i, hasEvent));
      } else {
        days.add(Expanded(child: Container(),));
      }
    }

    return Row(children: days);
  }

  Widget weekdayItem(String text) => (
      Expanded(
          child: Container(
            padding: EdgeInsets.all(2.0),
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
    const spacing = 8.0;

    final firstDayOfMonth = DateTime(year, month, 1).weekday;
    final monthOffset = 1 - (firstDayOfMonth % DateTime.daysPerWeek);
    final lastDayOfMonth = daysInMonth(year, month);

    var weekStart = monthOffset;
    List<Widget> weeks = [
      Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: weekdayRow(),
      ),
      //Divider(color: Colors.grey, height: 8.0,),
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
