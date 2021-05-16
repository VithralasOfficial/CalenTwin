import 'package:flutter/material.dart';
import 'package:integrative/Screens/Login/components/Text_Field_Container.dart';
import 'package:integrative/constants.dart';
import 'Button_With_Icon.dart';

class EventCreationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RoundedInputField(
            hintText: "Your Event",
            labelText: "Name",
            icon: Icon(Icons.event, color: Colors.black),
            onChanged: (value) {}
            ),
        Container(
          alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Text("Event Type",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            )
        ),
        Row(
          children: [
            Container(
              width: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ButtonWithIcon(
                  text: "Work Meeting",
                  icon: Icon(
                    Icons.cases_outlined,
                    color: kPrimaryLightColor,
                  ),
                press: () {},
                color: Colors.red
              ),
            ),
            ButtonWithIcon(
              text: "Party",
              icon: Icon(
                Icons.people_alt_outlined,
                color: kPrimaryLightColor,
              ),
              press: () {},
              width: 110,
            )
          ],
        ),
      ],
    );
  }
}
