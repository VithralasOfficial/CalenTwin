import 'dart:math';
import 'package:flutter/material.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'package:integrative/Screens/CreateEvent/components/Simple_Text_Header.dart';
import 'package:integrative/Screens/EventView/Event_View_Screen.dart';
import 'package:integrative/Screens/HomePage/components/Event.dart';
import '../../../constants.dart';

class UpcomingEventWidget extends StatelessWidget {
  final Icon activityCat;
  final Color color;
  final EventItem event;
  final String avatar;
  final UserBoundary user;

  const UpcomingEventWidget({
    required this.activityCat,
    required this.color,
    required this.event,
    required this.avatar,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int numOfParticipants = new Random().nextInt(4);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) {
                        return EventView(
                          activityCat: this.activityCat,
                          color: this.color,
                          event: event,
                          avatar: avatar,
                          user: user
                        );
                      },
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.9,
                    color: kUpcomingBG,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: size.height * 0.2,
                          width: size.width * 0.025,
                          color: color,
                        ),
                        Container(
                          height: size.height * 0.18,
                          width: size.width * 0.7,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: SimpleTextHeader(text: event.title),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(horizontal: 26),
                                  child: Text(
                                      event.date.day.toString() +"/" +event.date.month.toString() +" -> "
                                          +"Time Scheduled: " +event.hours
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                                  child: Row(
                                    children: <Widget>[
                                      if (numOfParticipants > 0)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Image.asset("assets/images/Userpic.png"),
                                        ),
                                      if (numOfParticipants > 1)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Image.asset("assets/images/Userpic2.png"),
                                        ),
                                      if (numOfParticipants > 2)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Image.asset("assets/images/Userpic3.png"),
                                        ),
                                      if (numOfParticipants > 3)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Image.asset("assets/images/Userpic4.png"),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                                height: size.height * 0.06,
                                width: size.width * 0.1,
                                color: color,
                                child: activityCat
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}