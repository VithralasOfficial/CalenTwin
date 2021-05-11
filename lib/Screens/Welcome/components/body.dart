import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Total height and width of screen.
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              child: Image.asset(
              "assets/images/CalenTwin.png",
            height: size.height * 0.4,
            width: size.width * 0.4,
          )
          )
        ],
      ),
    );
  }
}