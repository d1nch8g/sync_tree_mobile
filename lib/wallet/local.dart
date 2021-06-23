import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/security/pin.dart';

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
