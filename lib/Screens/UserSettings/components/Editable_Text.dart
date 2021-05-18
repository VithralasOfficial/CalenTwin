import 'package:flutter/material.dart';

// ignore: camel_case_types
class Editable_Text extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  const Editable_Text({
    Key? key,
    required this.text,
    this.color = Colors.blueGrey,
    this.fontSize = 18
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize
            )
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
                Icons.edit,
                color: color
            )
        )
      ],
    );
  }
}