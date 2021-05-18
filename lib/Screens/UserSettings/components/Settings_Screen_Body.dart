import 'package:flutter/material.dart';
import 'package:integrative/Screens/Welcome/welcome_screen.dart';
import 'package:integrative/components/Rounded_Button.dart';
import 'package:integrative/constants.dart';
import 'Editable_Text.dart';

class SettingsScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding( // Avatar Image
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Avatar.png"
              ),
            ],
          ),
        ),
        Editable_Text(
            text: "User's Name"
        ),
        Editable_Text(
            text: "User's ID"
        ),
        Editable_Text(
          text: "User's Email"
        ),
        Container(
          height: size.height * 0.32,
        ),
        RoundedButton(
            text: "Change Password",
            textColor: Colors.black,
            color: kButtonColor,
            fontSize: 15,
            press: () {}
            ),
        RoundedButton(
            text: "Sign Out",
            textColor: Colors.black,
            color: kButtonLightColor,
            fontSize: 15,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                    return WelcomeScreen();
                    },
                  ),
              );
            },
        ),
      ],
    );
  }
}