import 'package:flutter/material.dart';
import 'package:integrative/API/Http_Caller.dart';
import 'package:integrative/Screens/HomePage/Home_Screen.dart';
import 'package:integrative/Screens/Signup/Signup_Screen.dart';
import 'package:integrative/Screens/Welcome/components/Background.dart';
import 'package:integrative/components/Rounded_Button.dart';
import 'Already_Have_An_Account_Check.dart';
import 'Rounded_Password_Input_Field.dart';
import 'Text_Field_Container.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginUpBodyState createState() => _LoginUpBodyState();
}

  class _LoginUpBodyState extends State<LoginBody> {
    final mailController = TextEditingController();

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
              controller: mailController,
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
                loginValidUser(
                    mailController.text,
                    (user) {
                      print(user.username.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: RouteSettings(name: "/HomeScreen"),
                          builder: (context) {
                            return HomeScreen(user);
                          },
                        ),
                      );
                    });
              },
            ),
            SizedBox(height: size.height * 0.005),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                    },
                  ),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return SignUpScreen();
                //     },
                //   ),
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}
