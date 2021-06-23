import 'package:flutter/material.dart';

class LocalWallets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Text(
          'local connections',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
