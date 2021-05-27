import 'package:flutter/material.dart';
import 'package:integrative/Screens/Signup/Signup_Screen.dart';
import 'package:integrative/Screens/Welcome/components/Background.dart';
import 'package:integrative/components/Rounded_Button.dart';

import 'Already_Have_An_Account_Check.dart';
import 'Rounded_Password_Input_Field.dart';
import 'Text_Field_Container.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: SingleChildScrollView(
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
              text: "LOGIN",
              press: () {
                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) {
                //     return HomeScreen();
                //     },
                //   ),
                // );
              },
            ),
            SizedBox(height: size.height * 0.005),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
