import 'package:flutter/material.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'components/Event_Creation.dart';

class CreateEvent extends StatelessWidget {
  final UserBoundary user;
  final DateTime date;

  const CreateEvent({
    required this.user,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return EventCreationBody(selectedDate: date, user: user, size: size,);
  }
}