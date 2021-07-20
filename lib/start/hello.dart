import 'package:flutter/material.dart';

import '../_local/keys.dart';

class IntroPage extends StatelessWidget {
  void createKeys() async {
    var keys = await generateKeys();
    saveAllKeys(keys);
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
