import 'package:flutter/material.dart';
import 'package:integrative/Screens/UserSettings/Settings_Screen.dart';
import 'components/Event_View_Body.dart';

class EventView extends StatelessWidget {
  final Icon activityCat;
  final Color color;
  final String activity;
  final String time;
  final int numOfParticipants;

  const EventView({
    Key? key,
    required this.activityCat,
     required this.color,
    required this.activity,
    required this.time,
    this.numOfParticipants = 4
  }) : super(key: key);


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
            Text(activity,
              style: TextStyle(
                  fontWeight: FontWeight.bold
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
                Navigator.pop(context);
              },
              icon: Icon(
                  Icons.home
              )
          )
        ],
      ),
      body: EventViewBody(
        time: this.time,
        numOfParticipants: this.numOfParticipants,
      ),
    );
  }
}