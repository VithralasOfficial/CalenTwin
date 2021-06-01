import 'dart:math';
import 'package:flutter/material.dart';
import 'package:integrative/API/Http_Caller.dart';
import 'package:integrative/Model/ItemBoundary.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'package:integrative/Screens/CreateEvent/components/Simple_Text_Header.dart';
import 'package:integrative/Screens/HomePage/components/Event.dart';
import 'package:integrative/components/Rounded_Button.dart';

class EventViewBody extends StatelessWidget {
  final EventItem event;
  final UserBoundary user;

  const EventViewBody({
    required this.event,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int numOfParticipants = new Random().nextInt(4);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SimpleTextHeader(text: "Event Date"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(event.date.day.toString() +
                  "/" +
                  event.date.month.toString() +
                  " -> " +
                  "Time Scheduled: " +
                  event.hours),
            ),
            Container(
              // Spacer
              height: 10,
            ),
            SimpleTextHeader(text: "Description"),
            Container(
              height: size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(event.description == ""
                    ? "insert description here..."
                    : event.description),
              ),
            ),
            SimpleTextHeader(text: "Organizer"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Image.asset(user.avatar),
            ),
            Container(
              height: 30,
            ),
            SimpleTextHeader(text: "Participants"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: <Widget>[
                  if (numOfParticipants > 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset("assets/images/Userpic2.png"),
                    ),
                  if (numOfParticipants > 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset("assets/images/Userpic3.png"),
                    ),
                  if (numOfParticipants > 2)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset("assets/images/Userpic4.png"),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Center(
                child: RoundedButton(
                    color: Colors.red,
                    text: "Delete Event",
                    press: () {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                title: new Text("Delete Event"),
                                content: Container(
                                    width: size.width * 0.8,
                                    height: size.height * 0.055,
                                    child: Text(
                                        "Are you sure you would like to delete this event?")),
                                actions: <Widget>[
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    child: Text("Delete"),
                                    onPressed: () async {
                                      print("Event Deleted: " + event.itemId!);
                                      await retrieveItem(
                                          event.itemId!.split("\$")[0],
                                          user.userId.email,
                                          (loadedItem) async {
                                        ItemBoundary itemToDelete =
                                            ItemBoundary.fromJson(loadedItem);
                                        EventItem eventToRemove =
                                            EventItem.fromJson(
                                                itemToDelete.itemAttributes);
                                        user.events.remove(eventToRemove);
                                        user.role = 'MANAGER';
                                        await updateUserDetails(
                                            user.userId.email, user);

                                        await updateItem(
                                          itemToDelete.itemId.id,
                                          itemToDelete.type,
                                          itemToDelete.name,
                                          false,
                                          user.userId.email,
                                          itemToDelete.location,
                                          itemToDelete.itemAttributes,
                                        );
                                        user.role = 'PLAYER';
                                        await updateUserDetails(
                                            user.userId.email, user);
                                        Navigator.of(context).pop();
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
