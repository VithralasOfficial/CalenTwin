import 'package:flutter/material.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'package:integrative/Screens/HomePage/components/Event.dart';
import 'package:integrative/Screens/UserSettings/Settings_Screen.dart';
import 'components/Upcoming_Events_Body.dart';
import '../../constants.dart';

class UpcomingEventsScreen extends StatelessWidget {
  final List<EventItem>? events;
  final String avatar;
  final UserBoundary user;

  const UpcomingEventsScreen({
    required this.avatar,
    required this.user,
    this.events,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTextFieldColor,
        title: Text(
          "Upcoming Events",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Container(
              width: 30,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SettingsScreen(user: user);
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.settings_sharp))),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: UpcomingEventsBody(
        events: events,
        avatar: avatar,
        user: user
      ),
    );
  }
}
