import 'package:flutter/material.dart';
import 'package:integrative/Screens/Login/components/Text_Field_Container.dart';
import 'package:integrative/components/Rounded_Button.dart';
import 'package:integrative/constants.dart';
import 'Button_With_Icon.dart';
import 'Simple_Text_Header.dart';

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
        SimpleTextHeader(text: "Event Type"),
        Row(
          children: [
            Container(
              width: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
              color: Colors.orangeAccent
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ButtonWithIcon(
                  width: 100,
                  text: "Call",
                  icon: Icon(
                    Icons.phone_in_talk,
                    color: kPrimaryLightColor,
                  ),
                  press: () {},
                  color: Colors.green
              ),
            ),
            ButtonWithIcon(
              text: "Other",
              icon: Icon(
                Icons.person_pin_circle_outlined,
                color: kPrimaryLightColor,
              ),
              press: () {},
              width: 105,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SimpleTextHeader(
              text: "Participants"
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                width: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Image.asset(
                    "assets/images/Userpic.png",
                  scale: 0.75,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Image.asset(
                    "assets/images/Userpic2.png",
                  scale: 0.75,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Image.asset(
                    "assets/images/Userpic3.png",
                  scale: 0.75,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Image.asset(
                    "assets/images/Userpic4.png",
                  scale: 0.75,
                ),
              ),
            ],
          ),
        ),
        SimpleTextHeader(
          text: "Event Details"
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ButtonWithIcon(
            color: Colors.white,
            width: 120,
            text: "Add Users",
            textColor: Colors.grey,
            press: () {},
            icon: Icon(
              Icons.person_add_alt_1_outlined, color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ButtonWithIcon(
            color: Colors.white,
            width: 130,
            text: "Add Location",
            textColor: Colors.grey,
            press: () {},
            icon: Icon(
              Icons.add_location_alt_outlined, color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ButtonWithIcon(
            color: Colors.white,
            width: 147,
            text: "Add Description",
            textColor: Colors.grey,
            press: () {},
            icon: Icon(
              Icons.view_headline_sharp, color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ButtonWithIcon(
            color: Colors.white,
            width: 143,
            text: "Set Event Time",
            textColor: Colors.grey,
            press: () {},
            icon: Icon(
              Icons.access_time, color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: RoundedButton(text: "Create Event", press: () {} ),
        )
      ],
    );
  }
}

