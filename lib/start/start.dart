import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello!',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                'You can use public name and image signing with your '
                'google account, or stay anonymous.',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('skip'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/main');
                  },
                ),
                TextButton(
                  child: Text('sign in'),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
