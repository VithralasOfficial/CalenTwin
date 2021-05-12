import 'package:flutter/material.dart';
import 'package:integrative/Screens/Welcome/components/Background.dart';
import 'package:integrative/constants.dart';

import 'components/Text_Field_Container.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
              alignment: Alignment.center,
              children: <Widget>[Background(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                    "LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: size.height * 0,
                        fontSize: 18,
                     ),
                    ),
                    RoundedInputField(
                      hintText: "example@mail.com",
                      labelText: "Email",
                      icon: Icon(Icons.person, color: Colors.black),
                      onChanged: (value) {},
                    ),
                    RoundedInputField(
                      hintText: "Enter Password",
                      labelText: "Password",
                      icon: Icon(Icons.lock, color: Colors.black),
                      onChanged: (value) {},
                    ),
                  ],
                ),
               ),
              ],
          )
      ),
    );
  }
}

