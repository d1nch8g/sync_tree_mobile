import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/wallet/page/chat.dart';
import 'package:sync_tree_mobile_ui/wallet/page/info.dart';
import 'package:sync_tree_mobile_ui/wallet/page/operations.dart';

class ConnectedWalletPage extends StatelessWidget {
  final Function closeContainer;
  ConnectedWalletPage({required this.closeContainer});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hoverColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              WalletInfo(),
              Divider(),
              WalletChat(),
              Divider(),
              WalletOperations(),
            ],
          ),
        ),
      ),
    );
  }
}
