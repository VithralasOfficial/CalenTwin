import 'package:flutter/material.dart';

class SimpleTextHeader extends StatelessWidget {
  final String text;
  final double size;
  const SimpleTextHeader({
    Key? key,
    required this.text,
    this.size = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size
            ),
          ),
        )
    );
  }
}