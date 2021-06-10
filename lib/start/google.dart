import 'package:flutter/material.dart';

class GoogleAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).focusColor,
                ),
                labelText: 'login',
                hoverColor: Theme.of(context).focusColor,
                fillColor: Theme.of(context).focusColor,
              ),
            ),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  labelStyle: TextStyle(
                    color: Theme.of(context).focusColor,
                  ),
                  labelText: 'password',
                  hoverColor: Theme.of(context).focusColor,
                  fillColor: Theme.of(context).focusColor,
                ),
              ),
          ),
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
