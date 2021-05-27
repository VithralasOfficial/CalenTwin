import 'package:flutter/material.dart';
import 'package:integrative/Screens/UserSettings/Settings_Screen.dart';
import 'package:integrative/constants.dart';
import 'components/Event_Creation.dart';

class CreateEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTextFieldColor,
        title: Text("Create New Event",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        actions: <Widget>[
          Container(
            width: 30,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
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
      body: EventCreationBody(),
    );
  }
}