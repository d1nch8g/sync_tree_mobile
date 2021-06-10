import 'package:flutter/material.dart';

class GoogleAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(),
          SizedBox(height: 23),
          TextField(),
          TextButton(
            child: Text('toMain'),
            onPressed: () {
              Navigator.pushNamed(context, '/keySave');
            },
          ),
        ],
      ),
    );
  }
}
