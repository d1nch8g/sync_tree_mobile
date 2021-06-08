import 'package:flutter/material.dart';

class Rtext extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  Rtext({
    this.text,
    this.fontSize = 18,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
