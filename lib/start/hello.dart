import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

Future<String> generateKeys(bool start) async {
  var keys = Keys.generate();
  return keys.allKeysString;
}

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    compute(generateKeys, true);
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
              onPressed: () async {
                Navigator.pushNamed(context, '/name');
                var keys = await compute(generateKeys, true);
                Storage.saveKeys(keys);
              },
            ),
          ],
        ),
      ),
    );
  }
}
