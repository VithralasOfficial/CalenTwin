import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integrative/constants.dart';
import 'components/Login_Body.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
      appBar: AppBar(
        title: Text("LOGIN"),
      backgroundColor: kTextFieldColor,
      ),
    );
  }
}

