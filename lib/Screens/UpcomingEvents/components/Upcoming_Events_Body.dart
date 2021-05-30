import 'package:flutter/material.dart';
import 'package:integrative/Screens/HomePage/components/Event.dart';
import 'package:integrative/constants.dart';
import 'Upcoming_Event_Widget.dart';

class UpcomingEventsBody extends StatelessWidget {
  final List<EventItem>? events;
  final String avatar;

  const UpcomingEventsBody({
    required this.avatar,
    this.events,
  });

  Widget getUpcomingEvents() {
    List<UpcomingEventWidget> upcomingEvents = [];
    events!.forEach((element) {
      upcomingEvents.add(
          UpcomingEventWidget(
              activityCat: whatIcon(element.category),
              color: whatColor(element.category),
              event: element,
              avatar: avatar)
      );
    });
    return new Column(children: upcomingEvents,);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: getUpcomingEvents()
    );
  }
}