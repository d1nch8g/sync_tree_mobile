import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/crypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatelessWidget {
  void createKeys() async {
    var crypt = Crypt();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var keys = await crypt.generateKeys();
    prefs.setString('persPriv', keys[0]);
    prefs.setString('persPub', keys[1]);
    prefs.setString('mesPriv', keys[2]);
    prefs.setString('mesPub', keys[3]);
  }

  @override
  Widget build(BuildContext context) {
    createKeys();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                'We are building your private keys, you can pick public name '
                'that will be displayed to other users.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(height: 12),
            TextButton(
              child: Text('continue'),
              onPressed: () {
                Navigator.pushNamed(context, '/name');
              },
            ),
          ],
        ),
      ),
    );
  }
}
