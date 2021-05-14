import 'package:flutter/material.dart';
import 'package:integrative/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Don't have an account ? ",
          style: TextStyle(
              color: kTextFieldColor,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),
        ),
        GestureDetector(
          onTap: this.press,
          child: Text(
              login ? "Sign Up" : "Sign In",
              style: TextStyle(
                  color: kTextFieldColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              )
          ),
        ),
      ],
    );
  }
}