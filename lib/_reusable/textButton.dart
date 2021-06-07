import 'package:flutter/material.dart';

class RbuttonText extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color buttonBorderColor;
  final Color textColor;
  final double textFontSize;
  final EdgeInsets contentPadding;
  final double corners;
  final double borderWidth;
  final Function() onPressed;
  RbuttonText({
    this.text,
    this.onPressed,
    this.buttonColor = Colors.grey,
    this.buttonBorderColor = Colors.white,
    this.textColor = Colors.white,
    this.textFontSize = 18,
    this.contentPadding = EdgeInsets.zero,
    this.corners = 6,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: contentPadding,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textFontSize,
          ),
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(corners),
        backgroundColor: buttonColor,
        side: BorderSide(
          width: borderWidth,
          color: buttonBorderColor,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
