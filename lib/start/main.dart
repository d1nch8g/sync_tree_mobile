import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  // Navigator.pushNamed(context, '/main');
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello',
                style: Theme.of(context).textTheme.headline1,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'You can use your public name and picture signing with your '
                  'google account, or stay anonymous. We are working hard to'
                  'build a secure keys for you.',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
