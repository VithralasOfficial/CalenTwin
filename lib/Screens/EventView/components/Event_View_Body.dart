import 'dart:math';
import 'package:flutter/material.dart';
import 'package:integrative/Screens/CreateEvent/components/Simple_Text_Header.dart';
import 'package:integrative/Screens/HomePage/components/Event.dart';

class EventViewBody extends StatelessWidget {
  final EventItem event;
  final String avatar;

  const EventViewBody({
    required this.event,
    required this.avatar,
  }) ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int numOfParticipants = new Random().nextInt(4);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SimpleTextHeader(
                text: "Event Date"
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                  event.date.day.toString() +"/" +event.date.month.toString() +" -> "
                  +"Time Scheduled: " +event.hours
              ),
            ),
            Container( // Spacer
              height: 10,
            ),
            SimpleTextHeader(
                text: "Description"
            ),
            Container(
              height: size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(event.description == "" ?
                "insert description here..." : event.description),
              ),
            ),
            SimpleTextHeader(text: "Organizer"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Image.asset(avatar),
            ),
            Container(
              height: 30,
            ),
            SimpleTextHeader(text: "Participants"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: <Widget>[
                  if (numOfParticipants > 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset("assets/images/Userpic2.png"),
                    ),
                  if (numOfParticipants > 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset("assets/images/Userpic3.png"),
                    ),
                  if (numOfParticipants > 2)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset("assets/images/Userpic4.png"),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}