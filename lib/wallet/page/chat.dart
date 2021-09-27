import 'package:flutter/material.dart';

class WalletChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
