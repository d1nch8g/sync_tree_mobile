import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeySave extends StatefulWidget {
  @override
  _KeySaveState createState() => _KeySaveState();
}

class _KeySaveState extends State<KeySave> {
  Widget currentWidget;

  Future sleep10ms() {
    return new Future.delayed(const Duration(milliseconds: 10), () => "1");
  }

  changeCurrentWidget(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var firstLaunch = prefs.getString('persPriv');
    if (firstLaunch == null) {
      sleep10ms();
      changeCurrentWidget(context);
    }
    var keyController = TextEditingController(text: firstLaunch);
    setState(() {
      currentWidget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: keyController,
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
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    currentWidget = SpinKitFadingCircle(
      color: Theme.of(context).focusColor,
      size: 78.0,
      duration: const Duration(milliseconds: 1124),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'save your key',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                'This text is private key. Keep it in secret place. All '
                'assets in this app are related to this key. You can change '
                'it later in settings.',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(height: 12),
            currentWidget,
            SizedBox(height: 12),
            TextButton(
              child: Text('continue'),
              onPressed: () {
                Navigator.pushNamed(context, '/main');
              },
            ),
          ],
        ),
      ),
    );
  }
}
