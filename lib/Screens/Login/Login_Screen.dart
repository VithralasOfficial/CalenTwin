import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integrative/Screens/Welcome/components/Background.dart';
import 'components/Text_Field_Container.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 280,
                  width: 300,
                  child: Background(
                    child: Container()
                  ),
                ),
                RoundedInputField(
                  hintText: "example@mail.com",
                  labelText: "Email",
                  icon: Icon(
                      Icons.mail,
                      color: Colors.black),
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
      ),
      appBar: AppBar(title: Text("LOGIN")),
    );
  }
}

