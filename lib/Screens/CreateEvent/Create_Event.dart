import 'package:flutter/material.dart';
import 'package:integrative/Screens/HomePage/Home_Screen.dart';
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
                  onPressed: () {},
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
      body: EventCreationBody(),
    );
  }
}