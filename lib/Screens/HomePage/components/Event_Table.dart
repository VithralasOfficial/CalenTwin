import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integrative/Model/ItemBoundary.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'package:integrative/Screens/CreateEvent/Create_Event.dart';
import 'package:integrative/Screens/EventView/Event_View_Screen.dart';
import 'package:integrative/Screens/UpcomingEvents/Upcoming_Events_Screen.dart';
import 'package:integrative/Screens/UserSettings/Settings_Screen.dart';
import 'package:integrative/components/Rounded_Button.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../constants.dart';
import 'Event.dart';
import 'package:integrative/API/Http_Caller.dart' as httpCaller;

class EventTable extends StatefulWidget {
  final UserBoundary user;

  const EventTable(this.user);

  @override
  EventTableState createState() => EventTableState(user);
}

class EventTableState extends State<EventTable> {
  UserBoundary user;
  List<EventItem>? selectedEvents;
  Map<DateTime, List<EventItem>>? eventsByDate;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  EventTableState(this.user);

  @override
  void initState() {
    eventsByDate = {};
    super.initState();
  }

  List<EventItem> getEventsFromDay(DateTime date) {
    return eventsByDate![date] ?? [];
  }

  void showUserEvents() {
    user.events.forEach((element) {
      if (eventsByDate![element.date] == null) {
        List<EventItem> newList = [];
        newList.add(element);
        eventsByDate!.putIfAbsent(element.date, () => newList);
      } else {
        if (!eventsByDate![element.date]!.contains(element))
          eventsByDate![element.date]!.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showUserEvents();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // This Container Keeps The Spacing From The Top Part Of The Phone.
              height: size.height * 0.05,
            ),
            Container(
                height: 80,
                width: 100,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  widget.user.avatar,
                  height: size.height * 0.3,
                  width: size.height * 0.4,
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                children: [
                  TableCalendar(
                      firstDay: kFirstDay,
                      lastDay: kLastDay,
                      calendarStyle: CalendarStyle(),
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
                      eventLoader: (day) {
                        return getEventsFromDay(day);
                      }),
                  ...getEventsFromDay(selectedDay).map((EventItem event) =>
                      // ignore: deprecated_member_use
                      ListTile(
                        // ignore: deprecated_member_use
                        title: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EventView(
                                      activityCat: whatIcon(event.category),
                                      color: whatColor(event.category),
                                      event: event,
                                      avatar: user.avatar);
                                },
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                alignment: Alignment.center,
                                height: size.height * 0.06,
                                color: whatColor(event.category),
                                child: Text(event.title)),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              // Upcoming Events Button
              padding: EdgeInsets.symmetric(vertical: 6),
              child: RoundedButton(
                text: "Upcoming Events",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UpcomingEventsScreen(
                          events: user.events.toList(),
                          avatar: user.avatar,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              // Create Event Button
              padding: EdgeInsets.symmetric(vertical: 0),
              child: RoundedButton(
                text: "Create Event",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CreateEvent(
                          user: user,
                          date: selectedDay,
                        );
                      },
                    ),
                  ).then((value) => setState(() {}));
                },
              ),
            ),
            Container(
              // Settings Button
              width: 100,
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 5),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SettingsScreen();
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings_sharp),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
