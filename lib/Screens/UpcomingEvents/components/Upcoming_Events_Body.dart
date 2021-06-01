import 'package:flutter/material.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'package:integrative/Screens/HomePage/components/Event.dart';
import 'package:integrative/constants.dart';
import 'Upcoming_Event_Widget.dart';

class UpcomingEventsBody extends StatelessWidget {
  final List<EventItem>? events;
  final String avatar;
  final UserBoundary user;

  const UpcomingEventsBody({
    required this.avatar,
    required this.user,
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
              avatar: avatar,
              user: user
          )
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