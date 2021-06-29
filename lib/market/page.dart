import 'package:flutter/material.dart';

class MarketHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Hero(
        tag: 'market',
        child: Container(
          child: Center(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Market page!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/main');
                    },
                    child: Text(
                      'go back',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
