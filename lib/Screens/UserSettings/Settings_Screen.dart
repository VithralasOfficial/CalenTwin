import 'package:flutter/material.dart';
import 'package:integrative/constants.dart';
import 'components/Settings_Screen_Body.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Settings",),
        backgroundColor: kTextFieldColor,
        centerTitle: true,
      ),
      body: SettingsScreenBody(),
    );
  }
}