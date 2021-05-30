import 'package:flutter/material.dart';
import 'package:integrative/Screens/HomePage/components/Event.dart';
import 'package:integrative/Screens/UserSettings/Settings_Screen.dart';
import 'components/Event_View_Body.dart';

class EventView extends StatelessWidget {
  final Icon activityCat;
  final Color color;
  final EventItem event;
  final String avatar;

  const EventView({
    required this.activityCat,
     required this.color,
     required this.event,
     required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: activityCat,
            ),
            Expanded(
              child: Center(
                child: Text(event.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
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
                          return SettingsScreen();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                      Icons.settings_sharp
                  )
              )
          ),
          IconButton(
              onPressed: () {
                Navigator.popUntil(context,
                        (route) => route.settings.name == "/HomeScreen");
              },
              icon: Icon(
                  Icons.home
              )
          )
        ],
      ),
      body: EventViewBody(
        event: event,
        avatar: avatar,
      ),
    );
  }
}