import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/chat.dart';
import 'package:sync_tree_mobile_ui/wallet/page/info.dart';
import 'package:sync_tree_mobile_ui/wallet/page/operations.dart';

class ConnectedWalletPage extends StatelessWidget {
  final MarketInfo info;
  final Function closeContainer;
  ConnectedWalletPage({
    required this.closeContainer,
    required this.info,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              WalletInfo(),
              Divider(),
              Expanded(
                child: WalletChat(),
              ),
              Divider(),
              WalletOperations(),
            ],
          ),
        ),
      ),
    );
  }
}
