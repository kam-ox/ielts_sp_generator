import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final Color color;
  final Color textColor;
  final Function() onPressed;
  final IconData? icon;
  const Button({
    Key? key,
    required this.text,
    this.width = double.infinity,
    this.height = 75.0,
    this.fontSize = 36,
    this.color = const Color(0xFF5BC805),
    required this.onPressed,
    this.textColor = Colors.black,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: const BeveledRectangleBorder(),
              primary: color,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        if (icon != null)
          Positioned(
            bottom: 0,
            top: 0,
            right: 20,
            child: Icon(
              icon,
              size: 45,
              color: textColor,
            ),
          )
      ],
    );
  }
}
