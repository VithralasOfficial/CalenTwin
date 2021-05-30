import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF716D6D);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kButtonColor = Color(0xFF237CEC);
const kButtonLightColor = Color(0x6000C0FF);
const kHintColor = Color(0xB54B4B4B);
const kTextFieldColor = Color(0x970066FF);
const kUpcomingBG = Color(0x979E9E9E);

DateTime kFirstDay = DateTime.utc(2010, 1, 1);
DateTime kLastDay = DateTime.utc(2030, 12, 31);
DateTime kFocusedDay = DateTime.now();

String apiKey = "AIzaSyAti8b7yFUYl07IeZT43YhD7paVg4EwK2I";

// not sure about this one ill check later
const String kSpace = "2021b.idan";

Color whatColor(String category) {
  switch (category) {
    case "Work Meeting":
      return Color(0xFFBF000C);
    case "Party":
      return Color(0xFFC7AC00);
    case "Call":
      return Color(0xFF00B32C);
    default:
      return kButtonColor;
  }
}

Icon whatIcon(String category) {
  switch (category) {
    case "Work Meeting":
      return Icon(
        Icons.cases_outlined,
        color: kPrimaryLightColor,
      );
    case "Party":
      return Icon(
        Icons.people_alt_outlined,
        color: kPrimaryLightColor,
      );
    case "Call":
      return Icon(
        Icons.phone_in_talk,
        color: kPrimaryLightColor,
      );
    default:
      return Icon(
        Icons.person_pin_circle_outlined,
        color: kPrimaryLightColor,
      );
  }
}

const Map<String, String> kJsonHeaders = {
  'Content-Type': 'application/json',
  'accept': 'application/json'
};
