import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/chat_box.dart';
import 'package:sync_tree_mobile_ui/wallet/page/chat_input.dart';
import 'package:sync_tree_mobile_ui/wallet/page/deposit.dart';
import 'package:sync_tree_mobile_ui/wallet/page/info.dart';
import 'package:sync_tree_mobile_ui/wallet/page/withdrawal.dart';

class ConnectedWalletPage extends StatefulWidget {
  final MarketInfo info;
  final Function closeContainer;
  ConnectedWalletPage({
    required this.closeContainer,
    required this.info,
  });

  @override
  State<ConnectedWalletPage> createState() => _ConnectedWalletPageState();
}

bool resizekb = true;

class _ConnectedWalletPageState extends State<ConnectedWalletPage> {
  final FocusNode focuser = FocusNode();
  double height = 0;
  double bottomNavBarPadHeight = 0;

  updateBottomHeight() async {
    bottomNavBarPadHeight = await Storage.loadBottomPadding();
  }

  @override
  void initState() {
    super.initState();
    updateBottomHeight();
  }

  @override
  Widget build(BuildContext context) {
    var kbsize = MediaQuery.of(context).viewInsets.bottom;
    if (kbsize > 0) {
      kbsize = kbsize - 64 - bottomNavBarPadHeight;
    }
    if (resizekb == false) {
      kbsize = 0.0;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SafeArea(
            child: WalletInfo(
              info: widget.info,
            ),
            bottom: false,
          ),
          Divider(color: Theme.of(context).focusColor),
          ChatMessages(
            adress: widget.info.adress,
            delimiter: widget.info.delimiter,
          ),
          Divider(color: Theme.of(context).focusColor),
          ChatTextField(
            marketAdress: widget.info.adress,
            marketMesKey: widget.info.messageKey as Uint8List,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 377),
            curve: Curves.easeOutCubic,
            height: kbsize,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Center(
                  child: DepositButton(
                    info: widget.info,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.closeContainer();
                },
                iconSize: 52,
                color: Theme.of(context).focusColor,
                splashRadius: 38,
                icon: Icon(Icons.arrow_drop_down_circle_rounded),
              ),
              Expanded(
                child: Center(
                  child: WithdrawalButton(
                    info: widget.info,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: bottomNavBarPadHeight,
          ),
        ],
      ),
    );
  }
}
