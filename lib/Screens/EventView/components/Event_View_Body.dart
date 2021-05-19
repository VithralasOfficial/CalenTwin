import 'package:flutter/material.dart';
import 'package:integrative/Screens/CreateEvent/components/Simple_Text_Header.dart';
import 'package:integrative/constants.dart';

class EventViewBody extends StatelessWidget {
  final String time;
  final int numOfParticipants;

  const EventViewBody({
    Key? key,
    required this.time,
    this.numOfParticipants = 4
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SimpleTextHeader(
              text: "Event Date"
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
                time
            ),
          ),
          Container( // Spacer
            height: 10,
          ),
          SimpleTextHeader(
              text: "Description"
          ),
          Container(
            height: size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text("insert description here..."),
            ),
          ),
          SimpleTextHeader(text: "Organizer"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Image.asset("assets/images/Userpic.png"),
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
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: Container(
                    alignment: Alignment.center,
                    width: size.height * 0.15,
                    height: size.height * 0.07,
                    color: kButtonLightColor,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {},
                      child: Text("< Prev",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                    ),
                  ),
                ),
                Container( // Spacer
                  width: size.width * 0.2,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: Container(
                    alignment: Alignment.center,
                    width: size.height * 0.15,
                    height: size.height * 0.07,
                    color: kButtonColor,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {},
                      child: Text("Next >",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}