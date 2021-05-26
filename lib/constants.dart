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

// not sure about this one ill check later
const String kSpace = "twins2021.idankoren-israeli";

const Map<String, String> kJsonHeaders = {
  'Content-Type': 'application/json',
  'accept': 'application/json'
};
