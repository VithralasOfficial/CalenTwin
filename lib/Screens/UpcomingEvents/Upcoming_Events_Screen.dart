import 'package:flutter/material.dart';
import 'package:integrative/Screens/HomePage/Home_Screen.dart';
import 'package:integrative/Screens/UserSettings/Settings_Screen.dart';
import 'components/Upcoming_Events_Body.dart';
import '../../constants.dart';

class UpcomingEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTextFieldColor,
        title: Text("Upcoming Events",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
              icon: Icon(
                  Icons.home
              )
          )
        ],
      ),
      body: UpcomingEventsBody(),
    );
  }

}