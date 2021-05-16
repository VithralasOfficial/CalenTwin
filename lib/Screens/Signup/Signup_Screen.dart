import 'package:flutter/material.dart';
import 'components/SignUp_Body.dart';
import '../../constants.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
      appBar: AppBar(
        title: Text("SIGN UP"),
        centerTitle: true,
        backgroundColor: kTextFieldColor,
      ),
    );
  }
}
