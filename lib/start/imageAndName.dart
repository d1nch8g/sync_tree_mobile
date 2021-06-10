import 'package:flutter/material.dart';

class GoogleAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'public data',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).focusColor,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).focusColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).focusColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).focusColor),
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).focusColor,
                ),
                labelText: 'public name',
                hoverColor: Theme.of(context).focusColor,
                fillColor: Theme.of(context).focusColor,
                focusColor: Theme.of(context).focusColor,
              ),
              cursorColor: Theme.of(context).focusColor,
            ),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).focusColor,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).focusColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).focusColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).focusColor),
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).focusColor,
                ),
                labelText: 'image link',
                hoverColor: Theme.of(context).focusColor,
                fillColor: Theme.of(context).focusColor,
                focusColor: Theme.of(context).focusColor,
              ),
              cursorColor: Theme.of(context).focusColor,
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
          SizedBox(height: 68),
        ],
      ),
    );
  }
}
