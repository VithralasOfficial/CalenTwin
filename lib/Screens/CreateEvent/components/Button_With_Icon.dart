import 'package:flutter/material.dart';
import 'package:integrative/constants.dart';

class ButtonWithIcon extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final Icon icon;
  final double width;
  const ButtonWithIcon({
    Key? key,
    required this.text,
    required this.press,
    required this.icon,
    this.color = kButtonColor,
    this.textColor = kPrimaryLightColor,
    this.width = 150
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: Container(
            width: width,
            color: color,
            // ignore: deprecated_member_use
            child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: icon,
                    ),
                    Text(text,
                        style: TextStyle(
                            color: textColor
                        )
                    ),
                  ],
                )
            ),
          ),
        )
      ],
    );
  }
}