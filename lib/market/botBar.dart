import 'package:flutter/material.dart';

class BottomStuff extends StatelessWidget {
  String text;
  BottomStuff(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Text(text),
    );
  }
}
