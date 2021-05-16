import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integrative/Screens/CreateEvent/Create_Event.dart';
import 'package:integrative/components/Rounded_Button.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../constants.dart';

class EventTable extends StatefulWidget {
  @override
  EventTableState createState() => EventTableState();
}

class EventTableState extends State<EventTable> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container( // This Container Keeps The Spacing From The Top Part Of The Phone.
            height: size.height * 0.05,
          ),
          Container(
            height: 80,
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
                "assets/images/Avatar.png",
              height: size.height * 0.3,
              width: size.height * 0.4,
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: TableCalendar(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: focusedDay,
              calendarFormat: calendarFormat,
              selectedDayPredicate: (day) {
                // Use "selectedDayPredicate" to determine which day is currently selected.
                // If this returns true, then "day" will be marked as selected.
                return isSameDay(selectedDay, day);
              },
              onDaySelected: (newSelectedDay, newFocusedDay) {
                if (!isSameDay(selectedDay, newSelectedDay)) {
                  // Call setState() when updating the selected day
                  setState(() {
                    selectedDay = newSelectedDay;
                    focusedDay = newSelectedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (calendarFormat != format) {
                  // Call setState() when updating calendar format
                  setState(() {
                    calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call setState() here
                focusedDay = focusedDay;
              },
            ),
          ),
          Container( // Upcoming Events Button
            padding: EdgeInsets.symmetric(vertical: 6),
            child: RoundedButton(
                text: "Upcoming Events",
                press: () {}
            ),
          ),
          Container( // Create Event Button
            padding: EdgeInsets.symmetric(vertical: 0),
            child: RoundedButton(
                text: "Create Event",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                      return CreateEvent();
                      },
                    ),
                  );
                },
            ),
          ),
          Container( // Settings Button
            width: 100,
            // ignore: deprecated_member_use
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 5),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings_sharp),
                  Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}