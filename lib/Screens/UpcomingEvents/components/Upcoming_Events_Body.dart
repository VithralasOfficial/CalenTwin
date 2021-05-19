import 'package:flutter/material.dart';
import 'package:integrative/constants.dart';
import 'Upcoming_Event_Widget.dart';

class UpcomingEventsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          UpcomingEventWidget(
            activityCat: Icon(
                Icons.phone_in_talk,
                color: kPrimaryLightColor
            ),
            color: Colors.green,
            activity: "Call Mom",
            time: "Today -> 11:00 AM - 6:00 PM",
            numOfParticipants: 0,
          ),
          UpcomingEventWidget(
            activityCat: Icon(
                Icons.person_pin_circle_outlined,
                color: kPrimaryLightColor
            ),
            color: kButtonColor,
            activity: "Lunch at Mcdonalds",
            time: "Today -> 12:00 PM - 1:30 PM",
            numOfParticipants: 4,
          ),
          UpcomingEventWidget(
              activityCat: Icon(
                  Icons.cases_outlined,
                  color: kPrimaryLightColor
              ),
            color: Colors.red,
            activity: "Design Review",
            time: "12.5 -> 9:00 AM - 10:00 AM",
            numOfParticipants: 4,
          ),
          UpcomingEventWidget(
            activityCat: Icon(
                Icons.people_alt_outlined,
                color: kPrimaryLightColor
            ),
            color: Colors.orangeAccent,
            activity: "Beer Party",
            time: "15.5 -> 11:00 PM - 4:00 AM",
            numOfParticipants: 0,
          ),
        ],
      ),
    );
  }
}