import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeySave extends StatefulWidget {
  @override
  _KeySaveState createState() => _KeySaveState();
}

class _KeySaveState extends State<KeySave> {
  Widget currentWidget = KeysNotReady();

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}

class KeysNotReady extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: SpinKitCubeGrid(
          color: Theme.of(context).focusColor,
          size: 142.0,
          duration: const Duration(milliseconds: 1124),
        ),
      ),
    );
  }
}

class CopyKeysSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: IconButton(
          icon: Icon(Icons.copy),
          iconSize: 48,
        ),
      ),
    );
  }
}

class KeysReadyToGoFurther extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: Text('continue'),
            onPressed: () {
              Navigator.pushNamed(context, '/main');
            },
          ),
        ),
      ),
    );
  }
}
