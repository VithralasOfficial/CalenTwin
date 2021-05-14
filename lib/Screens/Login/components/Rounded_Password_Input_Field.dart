import 'package:flutter/material.dart';
import 'package:integrative/constants.dart';

// ignore: camel_case_types
class Rounded_Password_Input_Field extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const Rounded_Password_Input_Field({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
          obscureText: true,
          onChanged: this.onChanged,
          decoration: InputDecoration(
            icon: Icon(
                Icons.lock,
                color: Colors.black
            ),
            suffixIcon: Icon(
                Icons.visibility,
                color: Colors.black
            ),
            hintText: "Enter Password",
            labelText: "Password",
            hintStyle: TextStyle(
                color: kHintColor
            ),
            labelStyle: TextStyle(
              color: Colors.black,
            ),
          )
      ),
      decoration: BoxDecoration(
        color: kTextFieldColor,
        borderRadius: BorderRadius.circular(29),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );
  }
}