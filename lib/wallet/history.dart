import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/security/pin.dart';

class TransactionHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        checkPwd(context, () {});
      },
      leading: Icon(Icons.list_alt_rounded),
      title: Text('Get transaction history'),
      subtitle: Text(
        'You can get history of all your operations loaded directly from distributed network.',
      ),
    );
  }
}
