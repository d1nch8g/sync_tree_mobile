import 'package:flutter/material.dart';

class MarketModalSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: Center(
        child: Text(
          'yo',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
