import 'package:flutter/material.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'components/Event_Table.dart';

class HomeScreen extends StatelessWidget {
  final UserBoundary user;
  const HomeScreen(
    this.user,
  );

  @override
  Widget build(BuildContext context) {
    return EventTable(user);
  }
}