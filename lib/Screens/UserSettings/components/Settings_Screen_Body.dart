import 'package:flutter/material.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'package:integrative/components/Rounded_Button.dart';
import 'package:integrative/constants.dart';
import 'Editable_Text.dart';

class SettingsScreenBody extends StatelessWidget {
  final UserBoundary user;

  const SettingsScreenBody({
    required this.user
  });

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
                user.avatar
              ),
            ],
          ),
        ),
        Editable_Text(
            text: user.username
        ),
        Editable_Text(
          text: user.userId.email
        ),
        Container(
          height: size.height * 0.39,
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
              Navigator.popUntil(context, (route) => route.isFirst);
            },
        ),
      ],
    );
  }
}