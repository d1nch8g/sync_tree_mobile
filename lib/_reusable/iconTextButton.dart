import 'package:flutter/material.dart';

class RbuttonIconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final Color splashColor;
  final double textFontSize;
  final EdgeInsets contentPadding;
  final double borderRadius;
  final double borderWidth;
  final double spaceBetweenIconAndText;
  RbuttonIconText({
    this.text,
    this.icon,
    this.onPressed,
    this.buttonColor = Colors.grey,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.splashColor = Colors.white,
    this.textFontSize = 18,
    this.contentPadding = EdgeInsets.zero,
    this.borderRadius = 6,
    this.borderWidth = 2,
    this.spaceBetweenIconAndText = 5,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: contentPadding,
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: spaceBetweenIconAndText),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: textFontSize,
              ),
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        primary: Colors.white,
        side: BorderSide(
          width: borderWidth,
          color: borderColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
