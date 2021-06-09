import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: TextButton(
            child: Text('hello'),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ),
      ),
    );
  }
}
