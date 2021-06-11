import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  generateKeys() {
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO call key generation function, when it ends display key save page if
    // current route is not on hello or name

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello!',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                'We are building your private keys, you can pick public name '
                'that will be displayed to other users.',
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
