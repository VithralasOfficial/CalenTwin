import 'package:flutter/material.dart';
import 'package:integrative/Screens/Login/Login_Screen.dart';
import 'package:integrative/Screens/Login/components/Already_Have_An_Account_Check.dart';
import 'package:integrative/Screens/Login/components/Rounded_Password_Input_Field.dart';
import 'package:integrative/Screens/Login/components/Text_Field_Container.dart';
import 'package:integrative/Screens/Welcome/components/Background.dart';
import 'package:integrative/components/Rounded_Button.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView (
            child: Column(
                children: <Widget>[
                  Container(
                    height: 274,
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
                  Rounded_Password_Input_Field(
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                    text: "SIGN UP",
                    press: (){},
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
                ]
            )
        )
    );
  }
}