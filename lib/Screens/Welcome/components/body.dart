import 'package:flutter/material.dart';
import 'package:integrative/Screens/Login/Login_Screen.dart';
import 'package:integrative/Screens/Welcome/components/Background.dart';
import 'package:integrative/constants.dart';
import 'package:integrative/components/Rounded_Button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Total height and width of screen.
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
            RoundedButton(
                text: "LOGIN",
                press: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return LoginScreen();
                        },
                      ),
                    );
                  },
            ),
            RoundedButton(
                text: "SIGN UP",
                press: (){},
                color: kButtonLightColor,
                textColor: Colors.black,
            ),],
        ),
      )
    );
  }
}


