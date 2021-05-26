import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:integrative/Screens/Login/Login_Screen.dart';
import 'package:integrative/Screens/Login/components/Already_Have_An_Account_Check.dart';
import 'package:integrative/Screens/Login/components/Rounded_Password_Input_Field.dart';
import 'package:integrative/Screens/Login/components/Text_Field_Container.dart';
import 'package:integrative/Screens/Welcome/components/Background.dart';
import 'package:integrative/components/Rounded_Button.dart';
import 'package:integrative/API/Http_Caller.dart';

import 'package:http/http.dart' as http;

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final usernameController = TextEditingController();
  final mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            height: 274,
            width: 300,
            child: Background(child: Container()),
          ),
          RoundedInputField(
            controller: usernameController,
            hintText: "Your User Name",
            labelText: "Name",
            icon: Icon(Icons.person, color: Colors.black),
            onChanged: (value) {},
          ),
          RoundedInputField(
            controller: mailController,
            hintText: "example@mail.com",
            labelText: "Email",
            icon: Icon(Icons.mail, color: Colors.black),
            onChanged: (value) {},
          ),
          Rounded_Password_Input_Field(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "SIGN UP",
            press: () {
              // createNewUser(
              //                mailController.text, usernameController.text, "avatar");
              //
            },
          ),
          SizedBox(height: size.height * 0.005),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          )
        ])));
  }

  @override
  void dispose() {
    mailController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
