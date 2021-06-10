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
          SizedBox(height: 23),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('skip'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/keySave');
                  },
                ),
                TextButton(
                  child: Text('sign'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/googleSign');
                  },
                )
              ],
            ),
        ],
      ),
    );
  }
}
