import 'dart:io';

import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:integrative/API/Http_Caller.dart';
import 'package:integrative/Model/ItemBoundary.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'package:integrative/Screens/HomePage/components/Event.dart';
import 'package:integrative/Screens/Login/components/Text_Field_Container.dart';
import 'package:integrative/Screens/UserSettings/Settings_Screen.dart';
import 'package:integrative/components/Rounded_Button.dart';
import 'package:integrative/constants.dart';
import 'package:place_picker/place_picker.dart';
import 'Button_With_Icon.dart';
import 'Simple_Text_Header.dart';

class EventCreationBody extends StatefulWidget {
  final DateTime selectedDate;
  final UserBoundary user;
  final Size size;

  const EventCreationBody({
    required this.selectedDate,
    required this.user,
    required this.size,
  });

  @override
  EventCreationBodyState createState() => EventCreationBodyState(
        date: selectedDate,
        user: user,
        size: size,
      );
}

class EventCreationBodyState extends State<EventCreationBody> {
  final Size size;
  final UserBoundary user;
  final eventController = TextEditingController();
  final descriptionController = TextEditingController();
  final DateTime date;
  Map<String, dynamic> attributes = {};
  String category = "Work Meeting";
  String description = "";
  List<UserBoundary>? participants;
  TimeOfDay timeOfDay = TimeOfDay.now();
  String hours = "00:00";
  int buttonColors = 0;
  Location location = Location(32, 35);
  bool canCreate = true;

  EventCreationBodyState({
    required this.date,
    required this.user,
    required this.size,
  });

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      hours = "";
      timeOfDay = newTime;
      if (timeOfDay.hour < 10)
        hours += "0" + timeOfDay.hour.toString();
      else
        hours += timeOfDay.hour.toString();

      if (timeOfDay.minute < 10)
        hours += ":0" + timeOfDay.minute.toString();
      else
        hours += ":" + timeOfDay.minute.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTextFieldColor,
        title: Text(
          "Create New Event",
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  icon: Icon(Icons.settings_sharp))),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RoundedInputField(
                controller: eventController,
                hintText: "Your Event",
                labelText: "Name",
                icon: Icon(Icons.event, color: Colors.black),
                onChanged: (value) {}),
            SimpleTextHeader(text: "Event Type"),
            Row(
              children: [
                Container(
                  width: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ButtonWithIcon(
                      text: "Work Meeting",
                      icon: Icon(
                        Icons.cases_outlined,
                        color: kPrimaryLightColor,
                      ),
                      press: () {
                        setState(() {
                          buttonColors = 1;
                        });
                        category = "Work Meeting";
                      },
                      color: buttonColors == 1
                          ? Color(0xFFBF000C)
                          : Color(0x94A70208)),
                ),
                ButtonWithIcon(
                    text: "Party",
                    icon: Icon(
                      Icons.people_alt_outlined,
                      color: kPrimaryLightColor,
                    ),
                    press: () {
                      setState(() {
                        buttonColors = 2;
                      });
                      category = "Party";
                    },
                    width: 110,
                    color: buttonColors == 2
                        ? Color(0xFFC7AC00)
                        : Color(0x8CC7AC00))
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
                      press: () {
                        setState(() {
                          buttonColors = 3;
                        });
                        category = "Call";
                      },
                      color: buttonColors == 3
                          ? Color(0xFF00B32C)
                          : Color(0x8000A828)),
                ),
                ButtonWithIcon(
                  text: "Other",
                  icon: Icon(
                    Icons.person_pin_circle_outlined,
                    color: kPrimaryLightColor,
                  ),
                  press: () {
                    setState(() {
                      buttonColors = 4;
                    });
                    category = "Other";
                  },
                  color: buttonColors == 4 ? kButtonColor : Color(0x800015A7),
                  width: 105,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SimpleTextHeader(text: "Participants"),
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
            SimpleTextHeader(text: "Event Details"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ButtonWithIcon(
                color: Colors.white,
                width: 120,
                text: "Add Users",
                textColor: Colors.grey,
                press: () {},
                icon: Icon(
                  Icons.person_add_alt_1_outlined,
                  color: Colors.grey,
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
                press: () async {
                  LocationResult result =
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlacePicker(
                                "AIzaSyAti8b7yFUYl07IeZT43YhD7paVg4EwK2I",
                                displayLocation:
                                    LatLng(location.lat, location.lng),
                              )));
                  // Handle the result in your way
                  location.lat = result.latLng!.latitude;
                  location.lng = result.latLng!.longitude;
                },
                icon: Icon(
                  Icons.add_location_alt_outlined,
                  color: Colors.grey,
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
                press: () {
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                            title: new Text("Event Description"),
                            content: Container(
                              width: size.width * 0.8,
                              height: size.height * 0.3,
                              child: new TextField(
                                controller: descriptionController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Insert Description...",
                                  labelText: "Event Description",
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  descriptionController.text = description;
                                },
                              ),
                              // ignore: deprecated_member_use
                              FlatButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  description = descriptionController.text;
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          )
                  );
                },
                icon: Icon(
                  Icons.view_headline_sharp,
                  color: Colors.grey,
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
                press: () {
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      value: timeOfDay,
                      onChange: onTimeChanged,
                      minuteInterval: MinuteInterval.ONE,
                      disableHour: false,
                      disableMinute: false,
                      minMinute: 0,
                      maxMinute: 59,
                    ),
                  );
                },
                icon: Icon(
                  Icons.access_time,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: RoundedButton(
                  text: "Create Event",
                  press: () async {
                    for (var i = 0; i < user.events.length; i++) {
                      if (user.events.elementAt(i).date.compareTo(date) == 0 &&
                          user.events.elementAt(i).hours.compareTo(hours) == 0) {
                        canCreate = false;
                        break;
                      }
                      else{
                        canCreate = true;
                      }
                    }
                    if (canCreate) {
                      attributes[eventController.text] = EventItem(
                        title: eventController.text,
                        date: date,
                        category: category,
                        owner: user.userId.email,
                        hours: hours,
                        description: description,
                      );
                      EventItem newEventItem = EventItem.fromJson(
                          attributes[eventController.text].toJson());

                      user.role = 'MANAGER';
                      await updateUserDetails(user.userId.email, user);
                      await createNewItem(
                          "Event",
                          eventController.text,
                          true,
                          user.userId.email,
                          location,
                          attributes[eventController.text].toJson(), (event) {
                        newEventItem.itemId =
                            event.itemId.id + '\$' + event.itemId.space;

                        user.events.add(newEventItem);
                        print(newEventItem.toString());
                        Navigator.pop(context);
                      });
                      user.role = 'PLAYER';
                      await updateUserDetails(user.userId.email, user);
                    }
                    else {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                            title: new Text("Error!"),
                            content: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.06,
                                child: new Text("An event with the same time has already been set to this date!"
                                    "\n Change the time to try again.")
                            ),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          )
                      );
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedButton(
                text: "Create Multiple Events",
                fontSize: 14,
                press: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    File file = File(result.files.single.path!);
                    String fileString = await file.readAsString();
                    Map<String, dynamic> operationAttributes = {
                      'eventsData': fileString
                    };
                    invokeOperationAsync(
                        "createMultipleEvents",
                        user.userId.space + "-calendar-" + user.userId.email,
                        user.userId.email,
                        operationAttributes, (asyncBoundary) {
                      print(asyncBoundary);
                    });
                  } else {
                    // User canceled the file picker
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
