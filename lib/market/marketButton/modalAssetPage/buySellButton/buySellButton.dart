import 'package:flutter/material.dart';
import 'package:wallet_app/_reusable/colors.dart';

class BuySellButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;

  BuySellButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: SizedBox(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        width: 120,
        height: 32,
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(6),
        primary: palette.textColor,
        backgroundColor: color,
        side: BorderSide(
          width: 2,
          color: palette.buttonBorderColor,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
