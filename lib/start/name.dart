import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../security/filter.dart';

class GoogleAuth extends StatefulWidget {
  @override
  _GoogleAuthState createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  final nameController = TextEditingController();
  final filter = Filter();

  saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pubName', name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'pick a name',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              'You can set another one '
              'later in the settings.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
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
                labelText: 'name',
                hoverColor: Theme.of(context).focusColor,
                fillColor: Theme.of(context).focusColor,
                focusColor: Theme.of(context).focusColor,
              ),
              cursorColor: Theme.of(context).focusColor,
            ),
          ),
          SizedBox(height: 23),
          TextButton(
            child: Text('continue'),
            onPressed: () {
              var checked = filter.operateCheck(nameController, context);
              if (checked) {
                saveName(nameController.text);
                Navigator.pushNamed(context, '/keys');
              }
            },
          ),
          SizedBox(
            height: 125,
          )
        ],
      ),
    );
  }
}
